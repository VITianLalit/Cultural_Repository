import 'package:flutter/material.dart';
import 'package:apni_bhasha/src/constants.dart';

class CardContent extends StatelessWidget {
  final Color color;
  final String englishWord;
  final String brajWord;

  CardContent({
    Key? key,
    required this.color,
    required this.englishWord,
    required this.brajWord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width <= 700;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: Constants.cardHeight,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.9),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: isMobile ? Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTextContainer(englishWord, context),
          isMobile ? Icon(
            Icons.arrow_downward,
            color: Colors.white70,
            size: 24,
          ) :Icon(
            Icons.arrow_forward_ios,
            color: Colors.white70,
            size: 24,
          ),
          _buildTextContainer(brajWord, context),
        ],
      ): Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTextContainer(englishWord, context),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white70,
            size: 24,
          ),
          _buildTextContainer(brajWord, context),
        ],
      ),
    );
  }

  Widget _buildTextContainer(String text, BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width <= 700;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white70, width: 2),
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.3),
            Colors.black.withOpacity(0.1)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: isMobile ? 11 : 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }
}
