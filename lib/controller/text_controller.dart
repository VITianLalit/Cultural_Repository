import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TextController extends GetxController {
  final TextEditingController hindiController = TextEditingController();
  final TextEditingController brajController = TextEditingController();

  var isPressed = false.obs;
  var loading = false.obs; // Add this observable to track the loading state

  // Method to toggle the pressed state and initiate translation
  void togglePressed() async {
    isPressed.value = !isPressed.value;
    if (isPressed.value) {
      await translateText(hindiController.text);
    }
  }

  // Method to translate the input text using the API
  Future<void> translateText(String inputText) async {
    loading.value = true; // Start loading
    var url = Uri.parse('http://127.0.0.1/predict'); // Ensure this is correct

    var requestBody = jsonEncode({
      'text': inputText,
    });

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json',
        },
        body: requestBody,
      );

      if (response.statusCode == 200) {
        var utf8DecodedBody = utf8.decode(response.bodyBytes);
        var responseData = jsonDecode(utf8DecodedBody);
        brajController.text = responseData['language'].toString();
        print("Data: ${responseData['language']}");
        isPressed.value = false;
      } else {
        print('Error: Unable to translate. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      loading.value = false; // Stop loading after translation is done
    }
  }
}
