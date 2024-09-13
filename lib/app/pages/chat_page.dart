import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final chatController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<String> message = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: message.length,
                itemBuilder: (context, index) => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
                        const Text(
                          'Role: user or assistant',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black26),
                        ),
                        Text(
                          message[index],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    )),
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
                          controller: chatController,
                          decoration: const InputDecoration(
                            hintText: 'Ask me anything..',
                            border: InputBorder.none,
                            // contentPadding: EdgeInsets.all(0),
                          ),
                          onSubmitted: (value) {
                            message.add(value);
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
