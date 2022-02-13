import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vp12_azkar_app/screens/about_app_screen.dart';

class AzcarScreen extends StatefulWidget {
  const AzcarScreen({Key? key}) : super(key: key);

  @override
  _AzcarScreenState createState() => _AzcarScreenState();
}

class _AzcarScreenState extends State<AzcarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //its job check the stack if zero put back button default value is true
        //هنا ما حلت المشكلة هيا فقط شالت زر الرجوع من القائمة ولكن بقي الستاك فلازم اغير الpushnamed to pushreplacement in the launch_screen
        //لاحظ انه حتى لو كانت قيمته صح وحطيت الpushreplacement بردو فش زر رجوع لانها فعليا بتفحص الستاك والستاك صفر
        automaticallyImplyLeading: false,
        title: Text('azcar'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/info_screen', arguments: {
                  'message',
                  'info screen',
                });
              },
              icon: Icon(Icons.info)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AboutAppScreen(
                              message: 'About App',
                            )));
              },
              icon: Icon(Icons.question_answer))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.teal.shade700, Colors.teal.shade200])),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow,
                //borderRadius: BorderRadius.circular(10)
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    'استغفر الله',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  )
                  ),
                  Container(
                    color: Colors.blue,
                     alignment: Alignment.center,
                     height: 60,
                    width: 60,
                    child: Text('0',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
