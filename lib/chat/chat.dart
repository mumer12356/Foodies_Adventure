import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:foodies_adventure/Screen/HomePage/HomePage.dart';

import 'Messages.dart';

class Chat extends StatefulWidget {
  final String initialMessage;

  const Chat({super.key,
    required this.initialMessage
  });

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller=TextEditingController();

  List<Map<String, dynamic>> messages=[];

  @override
  void initState() {
    // TODO: implement initState
    _controller.text = widget.initialMessage;
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter=instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Chat Bot'),centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: MessageScreen(messages:messages),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 8),
              color: Colors.deepPurple,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  IconButton(onPressed: (){
                    sendMessage(_controller.text);
                    _controller.clear();

                  },
                      icon: const Icon(Icons.send)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  sendMessage(String text) async{
    if(text.isEmpty){
    }
    else{
      setState(() async {
        addMessage(Message(
            text: DialogText(text: [text])),true);

        DetectIntentResponse response=
        await dialogFlowtter.detectIntent(queryInput:
        QueryInput(text: TextInput(text: text)));
        if(response.message==null)return;
        setState(() {
          addMessage(response.message!);
        });

      });
    }
  }

  addMessage(Message message,[bool isUserMessage =false]){
    messages.add({
      'message':message,
      'isUserMessage':isUserMessage
    });
  }
}
