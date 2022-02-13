import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vp12_azkar_app/screens/about_app_screen.dart';

class AzcarScreen extends StatefulWidget {
  const AzcarScreen({Key? key}) : super(key: key);

  @override
  _AzcarScreenState createState() => _AzcarScreenState();
}

class _AzcarScreenState extends State<AzcarScreen> {
  int _counter = 0;
  String _content='استغفر الله';

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
        centerTitle: true,
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
          // IconButton(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => AboutAppScreen(
          //                     message: 'About App',
          //                   )));
          //     },
          //     icon: Icon(Icons.question_answer))
          PopupMenuButton<String>(onSelected: (value) {
           if(_content!=value){
             setState(() {
               _content=value;
               _counter=0;
             });
           }
          },
              itemBuilder: (context) {

            return [
              //لو شلت النوع رح يعطيني ايرور
              PopupMenuItem(
                child: Text('استغفر الله'),
                value: 'استغفر الله',
                height: 30,
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                child: Text('الحمد الله'),
                value: 'الحمد الله',
                height: 30,
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                child: Text('سبحان الله'),
                value: 'سبحان الله',
                height: 30,
              ),
            ];
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            ++_counter;
          });
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.teal.shade700, Colors.teal.shade200])),
        //لاحظ اللون عبارة عن ستايل من عنصر فما تاثر
        padding: EdgeInsetsDirectional.only(start: 20, end: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                margin: EdgeInsetsDirectional.only(bottom: 20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  //borderRadius: BorderRadius.circular(10)
                ),
              ),
              Card(
                elevation: 5,
                //the default value here canceled
                margin: EdgeInsetsDirectional.only(bottom: 20
                    //شلتهم لانه عملت padding عالحاوي الكبير
                    // , end: 20, start: 20
                    ),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(_content,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    )),
                    Container(
                      color: Colors.blue,
                      alignment: Alignment.center,
                      height: 60,
                      width: 60,
                      child: Text(
                        _counter.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          //لمن اعمل ريفرش للبيلد الاشي الوحيد الي مش رح يتاثر هو الcons
                          //هنا لانه كل statfull اله state  طيب انا لازم اعمم التغيرر عالبيلد لانه الstate حتعمل تاثير على مستوى البيلد فرجاء اعمل ريفريش عليها
                          setState(() {
                            ++_counter;
                          });
                        },
                        child: Text('تسبيح'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue.shade600,
                            minimumSize: Size(0, 45),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.only(
                                    topStart: Radius.circular(10)))),
                      )),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {},
                    child: Text('اعادة'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue.shade800,
                        minimumSize: Size(0, 45),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.only(
                                bottomEnd: Radius.circular(10)))),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
