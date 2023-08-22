import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  final List messages;
  const MessageScreen({super.key, required this.messages});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    return ListView.separated(
      itemBuilder: (context,index){
        return Container(
          margin: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment:
            widget.messages[index]['isUserMessage']?
            MainAxisAlignment.end:MainAxisAlignment.start ,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(20),
                    topRight:
                    Radius.circular(
                        widget.messages[index]['isUserMessage']?0:20),
                    topLeft:
                    Radius.circular(
                        widget.messages[index]['isUserMessage']?0:20),
                  ),
                  color: widget.messages[index]['isUserMessage']?
                  Colors.white:
                  Colors.white.withOpacity(0.8),
                ),
                constraints: BoxConstraints(maxWidth: w * 2 / 3),
                child: Text(widget.messages[index]['message'].text.text[0],
                style: TextStyle(fontSize:
                widget.messages[index]['isUserMessage']? 18 : 20,
                  color: widget.messages[index]['isUserMessage']? Colors.black:
                      Colors.orange
                ),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (_,i)=>const Padding(padding: EdgeInsets.only(top: 10)),
      itemCount: widget.messages.length,
    );
  }
}

