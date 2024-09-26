import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../data.dart';
import '../src/widgets/cool_swiper.dart';
import '../widgets/card_content.dart';

class Dictionary extends StatefulWidget {
  const Dictionary({super.key});

  @override
  State<Dictionary> createState() => _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {
  List<String> sentences = [
    "I",
    "He",
    "She",
    "You",
    "It",
    "One",
    "Come",
    "Came",
    "Will come",
    "Open",
    "Opened",
    "Will open",
    "Sit",
    "Walk",
    "Eat",
    "Drink",
    "Go",
    "Run",
    "He is eating an apple.",
    "He ate an apple.",
    "I saw the film last week.",
    "She came by bus yesterday.",
    "They went to the village.",
    "He slept the whole night.",
    "He wrote well in the examination.",
    "He has eaten.",
    "He had eaten.",
    "He had gone.",
    "He had come.",
    "He will eat.",
    "He will go.",
    "He will come.",
    "What is your name?",
    "What",
    "Is",
    "Your",
    "Name",
    "What did you do?",
    "What should I do?",
    "What can I do?",
    "What are the questions?",
    "What were the questions?",
    "What is the last question?",
    "What is written in the letter?",
    "What you had been told?",
    "What will be the answer?",
  ];
  List<String> brajSentences = [
    "मैं",
    "बो",
    "बो",
    "तू",
    "जा",
    "एक",
    "अइयो",
    "आई थी",
    "आई थी",
    "खोलियो",
    "खु्ली थी",
    "खोलोगी",
    "बैठजा",
    "चलो",
    "खालो",
    "पीलो",
    "जयगो",
    "दौड़ना",
    "बो सेब खा रहयो है |",
    "बानाय सेब खायो |",
    "मैनय परके हफ्ता फिलम देखी हती |",
    "बो कल बस ते आई हटी |",
    "बे सब गांव गए |",
    "बो रात भर सोयो |",
    "बाणे परीक्षा अच्छो लिखो |",
    "बाने खा लियो है|",
    "बाने खा लियो थो|",
    "बो चलो गयो थो|",
    "बो आयो थो|",
    "बो खायेगो |",
    "बो जायेगो |",
    "बो आयेगो",
    "तेरो नाम का है?",
    "का",
    "हैं",
    "तेरो, तुम्हारो",
    "नाम",
    "तूने का कियो?",
    "मैं का करू?",
    "मैं का कर सकता हूँ?",
    "का सबल है?",
    "का सबल थो?",
    "आखिरी सबल का है?",
    "खत में का लिखो है?",
    "तुमटे का कायो गयो थो?",
    "जवाब का होगो?",
  ];

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width <= 700;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Dictionary",
              style: TextStyle(
                  fontSize: isMobile?30: 60,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: screenHeight*0.1,
          ),
          SafeArea(
            child: Padding(
              padding:  EdgeInsets.only(left: screenWidth*0.04, right: screenWidth*0.04),
              child: Container(
                // Added Container to limit size
                height: MediaQuery.of(context).size.height /
                    2, // Set a fixed height
                child: CoolSwiper(
                  children: List.generate(
                    Data.colors.length,
                    (index) => CardContent(
                        color: Data.colors[index],
                        englishWord: sentences[index],
                        brajWord: brajSentences[index]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
