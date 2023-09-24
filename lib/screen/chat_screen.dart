import 'package:chat_ui/model/chatModel.dart';
import 'package:chat_ui/model/userModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key, required this.userModel});
  UserModel userModel;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _editingController = TextEditingController();
  List<ChatModel> chatModelLst = [
    ChatModel(
      message: "سلام",
      isME: false,
    ),
    ChatModel(
      message: "سلام",
      isME: true,
    ),
    ChatModel(
      message: "خوبی؟",
      isME: false,
    ),
    ChatModel(
      message: "ممنون",
      isME: true,
    ),
    ChatModel(
      message: "سایت فلاتر فارسی رو دیدی؟",
      isME: false,
    ),
    ChatModel(
      message: "نه میشه لینکش رو بدی ؟",
      isME: true,
    ),
    ChatModel(
      message: "FlutterFarsi.com",
      isME: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(CupertinoIcons.back),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 25,
              foregroundImage: NetworkImage(widget.userModel.image),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.userModel.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatModelLst.length,
                itemBuilder: (context, index) {
                  return BubbleSpecialThree(
                    text: chatModelLst[index].message,
                    color: chatModelLst[index].isME
                        ? Colors.blueAccent
                        : Colors.blue,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    isSender: chatModelLst[index].isME,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _editingController,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                    hintText: "Write a Message",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        chatModelLst.add(
                          ChatModel(
                            message: _editingController.text.trim(),
                            isME: true,
                          ),
                        );
                        _editingController.clear();
                        setState(() {});
                      },
                      icon: const Icon(
                        CupertinoIcons.arrow_right_circle,
                        size: 30,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
