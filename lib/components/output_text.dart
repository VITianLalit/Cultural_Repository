import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/text_controller.dart';

class OutputText extends StatefulWidget {
  const OutputText({super.key});

  @override
  State<OutputText> createState() => _OutputTextState();
}

class _OutputTextState extends State<OutputText> with TickerProviderStateMixin {
  bool isMobile = false;

  late AnimationController _slideController;
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Slide animation
    _slideController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _slideAnimation = Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0)).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeOut),
    );

    // Fade animation
    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    // Scale animation
    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeOutBack),
    );

    // Start the animations
    _slideController.forward();
    _fadeController.forward();
    _scaleController.forward();
  }

  @override
  void dispose() {
    _slideController.dispose();
    _fadeController.dispose();
    _scaleController.dispose();
    controller.brajController.dispose();
    super.dispose();
  }
  final TextController controller = Get.put(TextController());
  @override
  Widget build(BuildContext context) {
    isMobile = MediaQuery.of(context).size.width <= 700;

    return Container(
      margin: isMobile ? EdgeInsets.all(15): EdgeInsets.all(0),
      child: Column(
        children: [
          // Upper container with SlideTransition and ScaleTransition for text
          SlideTransition(
            position: _slideAnimation,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.grey.shade800, Colors.grey.shade600],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                border: Border.all(color: Colors.grey.shade100),
              ),
              width: isMobile
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.08,
              child: Center(
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText(
                        'ब्रज वाक्य |',
                        textStyle: TextStyle(
                          letterSpacing: 2,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'RobotoSlab',
                          color: Colors.white,
                        ),
                        colors: [
                          Colors.white,
                          Colors.blue,
                          Colors.yellow,
                          Colors.red,
                        ],
                        speed: Duration(milliseconds: 500),
                      ),
                    ],
                    repeatForever: true,
                  ),
                ),
              ),
            ),
          ),
          // Lower container with FadeTransition
          FadeTransition(
            opacity: _fadeAnimation,
            child: Container(
              width: isMobile
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width * 0.4,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                border: Border.all(color: Colors.grey.shade100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * 0.5,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller.brajController,
                  maxLines: null, // Allows multiple lines of input
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Output text...',
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 23),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
