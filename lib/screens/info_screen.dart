import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  String? message;

  @override
  Widget build(BuildContext context) {
    ModalRoute? modelRoute = ModalRoute.of(context);
    if (modelRoute != null) {
      RouteSettings modalSettings = modelRoute.settings;
      if (modalSettings.arguments != null) {
        Map<String, dynamic> data =
            modalSettings.arguments as Map<String, dynamic>;
        // if (data.containsKey('message')) {
        //   message=data['message'];
        // }
        // else{
        //   message='Default message2';
        // }
        message=data.containsKey('message')?data['message']:'Default message2';
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
        leading: IconButton(onPressed: () {
          setState(() {

          });
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Text(
          message??'Default message1',
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),
    );
  }
}
