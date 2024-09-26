// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:apni_bhasha/components/about_model.dart';
import 'package:apni_bhasha/components/dictionary.dart';
import 'package:apni_bhasha/components/input_text.dart';
import 'package:apni_bhasha/components/output_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'controller/text_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'अपनी भाषा अपनी संस्कृति',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'अपनी भाषा'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final dictionaryKey = GlobalKey();
  final homeKey = GlobalKey();
  final aboutModel = GlobalKey();
  final contactUs = GlobalKey();

  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;
  bool isMobile = false;

  List<Widget> navItems = [];

  List<Color> _colors = [Colors.pinkAccent, Colors.blueAccent];
  List<Color> _nextColors = [Colors.orangeAccent, Colors.purpleAccent];
  bool _isFirst = true;
  late Timer _timer;

  void _startColorChangeTimer() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _isFirst = !_isFirst;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _startColorChangeTimer();
    // Initialize the AnimationController
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Define the Slide animation
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: Curves.easeOut,
      ),
    );

    // Start the slide animation
    _slideController.forward();
    navItems = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Scrollable.ensureVisible(homeKey.currentContext!,
                duration: Duration(milliseconds: 500));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Colors.transparent, // Transparent background for black navbar
            foregroundColor: Colors.white, // Text color
            padding: EdgeInsets.symmetric(
                horizontal: 30, vertical: 18), // Button padding
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(20.0), // Border radius set to 4
              side: BorderSide(color: Colors.white, width: 1.5), // White border
            ),
            elevation: 0, // No shadow
          ),
          child: Text(
            "Home",
            style: TextStyle(
              fontWeight: FontWeight.bold, // Bold text
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Scrollable.ensureVisible(dictionaryKey.currentContext!,
                duration: Duration(milliseconds: 500));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: Colors.white, width: 1.5),
            ),
            elevation: 0,
          ),
          child: Text(
            "Dictionary",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Scrollable.ensureVisible(aboutModel.currentContext!,
                duration: Duration(milliseconds: 500));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: Colors.white, width: 1.5),
            ),
            elevation: 0,
          ),
          child: Text(
            "About Model",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Scrollable.ensureVisible(contactUs.currentContext!,
                duration: Duration(milliseconds: 500));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: Colors.white, width: 1.5),
            ),
            elevation: 0,
          ),
          child: Text(
            "Contact Us",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ];
  }

  @override
  void dispose() {
    // Dispose of the animation controller to free resources
    _slideController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    isMobile = MediaQuery.of(context).size.width <= 700;
    final TextController controller = Get.put(TextController());
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Change the drawer icon color to white
        ),
        toolbarHeight: 70,
        elevation: 8, // Increased elevation for a more pronounced shadow
        backgroundColor: Colors.transparent, // Set transparent background
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.grey.shade900],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 4),
              ),
            ],
          ),
        ),
        actions: isMobile ? null : navItems,
        title: Row(
          children: [
            // SlideTransition for animated sliding text
            SlideTransition(
              position: _slideAnimation,
              child: SelectableText(
                "अपनी ",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2, // Slight spacing for elegance
                ),
              ),
            ),
            const SizedBox(width: 5), // Space between static and animated text
            // Animated rotating text
            AnimatedTextKit(
              animatedTexts: [
                RotateAnimatedText(
                  'भाषा',
                  textStyle: const TextStyle(
                    fontSize: 28,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                RotateAnimatedText(
                  'संस्कृति',
                  textStyle: const TextStyle(
                    fontSize: 28,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
              repeatForever: true,
              pause: const Duration(milliseconds: 500),
            ),
          ],
        ),
        centerTitle: true, // Center the title for a balanced look
      ),
      drawer: isMobile
          ? Drawer(
              backgroundColor: Colors.black,
              child: ListView(
                children: navItems,
              ),
            )
          : null,
      body: AnimatedContainer(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context)
              .size
              .width, // Minimum width of the container
          minHeight: MediaQuery.of(context)
              .size
              .height, // Minimum height of the container
        ),
        duration: Duration(seconds: 5),
        onEnd: () {
          // Randomize the next gradient colors when animation ends
          _nextColors = [
            Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
            Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
          ];
        },
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _isFirst ? _colors : _nextColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  key: homeKey,
                  height: MediaQuery.of(context).size.height * 0.1),
              GestureDetector(
                onTap: () {
                  if (controller.hindiController.text != "") {
                    controller.togglePressed();
                  } else {
                    Get.snackbar(
                        "Error:", "Please Enter Text Before Translating",
                        snackPosition: SnackPosition.BOTTOM,
                        colorText: Colors.white,
                        backgroundColor: Colors.black,
                        snackStyle: SnackStyle.FLOATING,
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 6,
                            right: MediaQuery.of(context).size.width / 6,
                            bottom: 50));
                  }
                },
                child: Obx(() => AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        color: controller.isPressed.value
                            ? Colors.grey[800]
                            : Colors.black, // Black background
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      // Show the CircularProgressIndicator when loading, else show 'Translate'
                      child: controller.loading.value
                          ? CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                          : Text(
                              'Translate',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    )),
              ),
              SizedBox(
                height: screenHeight*0.05,
              ),
              Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: const [
                    InputText(),
                    OutputText(),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight*0.1,
              ),
              Container(
                key: dictionaryKey,
                width: MediaQuery.of(context).size.width,
                height: isMobile? screenHeight/1.3 : MediaQuery.of(context).size.height / 1.1,
                margin: EdgeInsets.only(left: screenWidth*0.06, right: screenWidth*0.06),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(40),
                ),
                padding: EdgeInsets.only(top: screenHeight*0.05, left: screenWidth*0.03, right: screenWidth*0.03),
                child: Dictionary(),
              ),
              SizedBox(
                height: screenHeight*0.1,
              ),
              Container(
                key: aboutModel,
                width: MediaQuery.of(context).size.width,
                height: isMobile? screenHeight/1.6 : MediaQuery.of(context).size.height / 1.1,
                margin: EdgeInsets.only(left:  screenWidth*0.06, right:  screenWidth*0.06),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(40),
                ),
                padding: EdgeInsets.only(top: screenHeight*0.05, left: screenWidth*0.03, right: screenWidth*0.03),
                child: AboutModel(),
              ),
              SizedBox(
                key: contactUs,
                height: screenHeight*0.1,
              ),
              // footer
          Container(
            color: Colors.black,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '© 2024 "अपनी भाषा अपनी संस्कृति"',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 20),
                Center(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return constraints.maxWidth > 600
                          ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildProfileColumn(name: "Lalit Sahu", path: "assets/images/Lalit_Sahu.png", address: 'Indore, India', email:  'LalitSahuji786@gmail.com'), // Reusable profile column
                          _buildDevelopersBox(),
                          _buildProfileColumn(name: "Manish Rana", path: "assets/images/img.png", address: 'Balaghat, India', email:  'Manish.rana2021@vitbhopal.ac.in'),
                        ],
                      )
                          : Column(
                        children: [
                          _buildProfileColumn(name: "Lalit Sahu", path: "assets/images/Lalit_Sahu.png", address: 'Indore, India', email:  'LalitSahuji786@gmail.com'),
                          SizedBox(height: 20),
                          _buildDevelopersBox(),
                          SizedBox(height: 20),
                          _buildProfileColumn(name: "Manish Rana", path: "assets/images/img.png", address: 'Balaghat, India', email:  'Manish.rana2021@vitbhopal.ac.in'),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildProfileColumn({required name, required path,required address,required email}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(path),
        ),
        SizedBox(height: 10),
        SelectableText(
          name!,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        SelectableText(
          address!,
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
        SelectableText(
          email!,
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: FaIcon(FontAwesomeIcons.github, color: Colors.white),
              onPressed: () {
                // GitHub link
              },
            ),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.white),
              onPressed: () {
                // Instagram link
              },
            ),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.linkedin, color: Colors.white),
              onPressed: () {
                // LinkedIn link
              },
            ),
          ],
        )
      ],
    );
  }

  Widget _buildDevelopersBox() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        'Developers',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
