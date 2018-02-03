import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:demo02/modules/home/HomePage.dart';
import 'package:fluro/fluro.dart';
import 'package:demo02/modules/ABRouter.dart';

void main() {
  runApp(
     new ChatApp()
  );
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Chat App',
      home: new HomePage(),
    );
  }
}

class ChatScreen extends StatefulWidget {

  @override
  ChatScreenState createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {

  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  
  ChatScreenState() {

  }

  void _handleSubmitted(String text) {
    _textController.clear();

    ChatMessage chatMessage = new ChatMessage(
      text: text,
      animationController: new AnimationController(
          vsync: this,
          duration: new Duration(milliseconds: 700)
      ),
    );
    setState((){

      _messages.insert(0, chatMessage);

    });
    chatMessage.animationController.forward();
  }

  Widget _buildTextComposer() {
    return new Container(

      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child:
      new Row(
        children: <Widget>[
          new Flexible(child:
            new TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: new InputDecoration.collapsed(hintText: 'Send a meesage'),
            ),
          ),

          new Container(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            child:
              new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)
              ),
          )
        ],
      )

    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('聊天室'),
      ),

      body: new Column(
        children: <Widget>[
          
          new Flexible(child: new ListView.builder(
            padding: new EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder:(_, int index) => _messages[index],
            itemCount: _messages.length,
          )),

          new Divider(height: 1.0),

          new Container(
            decoration: new BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {

  ChatMessage({this.text, this.animationController});

  final String text;

  final AnimationController animationController;

  String _name = "brant";

  @override
  Widget build(BuildContext context) {

    return new SizeTransition(                                    //new
        sizeFactor: new CurvedAnimation(                              //new
            parent: animationController, curve: Curves.easeOut),      //new
        axisAlignment: 0.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
                margin: const EdgeInsets.only(right: 12.0),
                child: new CircleAvatar(
                  child: new Text(_name[0]),
                )
            ),

            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(_name, style: Theme.of(context).textTheme.subhead),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(text),
                ),
              ],
            )
          ],


        ),
      ),
    );

  }
}