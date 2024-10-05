import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final chatController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  final List<Map<String, String>> messages = [];
  final List<Map<String, dynamic>> chat = [];
  final dio = Dio();

  static const geminiKey = "AIzaSyDclM3W_D4WqUqgvBtLsJeMZFd9fP5ItYQ";

  Future<String> geminiAPI() async {
    try {
      final res = await http.post(
        Uri.parse(
            'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$geminiKey'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "contents": chat,
        }),
      );
      print(res.statusCode);

      if (res.statusCode == 200) {
        String val = jsonDecode(res.body)['candidates'][0]['content']['parts']
            [0]['text'];
        // content = content.trim();
        print(res.body);
        chat.add({
          "role": "model",
          "parts": [
            {"text": val},
          ]
        });
        setState(() {});
        return res.body;

        // return content;
      }
      print('internal error');
      return 'An internal error occurred';
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  late FocusNode myFocusNode;

  @override
  void initState() {
    myFocusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    chat.length,
                    (index) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(-1, 0),
                                blurRadius: 5,
                                spreadRadius: 1,
                                color: Colors.black12,
                              )
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              chat[index]['role'].toString(),
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black26),
                            ),
                            // Add Selection area widget
                            AnimatedTextKit(
                              animatedTexts: [
                                TyperAnimatedText(
                                  chat[index]['parts'][0]['text'].toString(),
                                  textStyle: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                              totalRepeatCount: 1,
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: KeyboardListener(
                      focusNode: _focusNode,
                      onKeyEvent: (event) {
                        // if (event is KeyDownEvent &&
                        //     event.logicalKey == LogicalKeyboardKey.enter) {
                        //   // ... // your action here
                        //   print(chatController.text);
                        // }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(-1, 0),
                              blurRadius: 10,
                              spreadRadius: 1,
                              color: Colors.black26,
                            )
                          ],
                          color: Colors.white,
                        ),
                        child: TextField(
                          // maxLines: null,
                          focusNode: myFocusNode,
                          autofocus: true,
                          controller: chatController,
                          decoration: const InputDecoration(
                            hintText: 'Ask me anything..',
                            border: InputBorder.none,
                            // contentPadding: EdgeInsets.all(0),
                          ),
                          onSubmitted: (value) {
                            // messages.add({
                            //   'role': 'user',
                            //   'content': value.trim(),
                            // });
                            chat.add({
                              "role": "user",
                              "parts": [
                                {"text": value},
                              ]
                            });
                            geminiAPI();
                            // chatGPTAPI(value);
                            myFocusNode.requestFocus();
                            chatController.clear();
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
