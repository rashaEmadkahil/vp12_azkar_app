import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {


  @override
  //تقابل ال onCreate بالاندرويد
  void initState() {
    // TODO: implement initState
    super.initState();
    //    بدي اعمل حدث مستقبلي بعد تاخير مدته 3ثوانا
    Future.delayed(Duration(seconds: 3),(){
      //the pushnamed put the launch screen in the stack then put azcar screen in stack when azcar finish run it call
      //back the launch screen from stack
      //رح تلاحظ بعد تنفيذ هادي العملية رجع رجعني عال lunch screen بسبب انه بشكل مبدئي بيحط زر الرجوع بالappbar
      Navigator.pushReplacementNamed(context, '/azcar_screen');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [Colors.blue.shade900, Colors.blue.shade700]),
        ),
        child: Text(
          'Azkar App',
          style:TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24
          )
          //TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
