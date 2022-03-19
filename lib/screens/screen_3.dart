import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({Key? key, required this.score}) : super(key: key);
  final int score;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'TRIVIA APP',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text('Your Score Is',style: TextStyle(fontSize:30,fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            Text('$score/100',style: TextStyle(fontSize:40,fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
                        
              // Directionality(
              // textDirection: TextDirection.rtl,
              // child: ),
              // child:ElevatedButton(onPressed: () => Navigator.of(context).pop(),);
              // ElevatedButton.icon(
              //   onPressed: () => Navigator.of(context).pop(),
              //  ),
              //   icon: Icon(
              //     Icons.arrow_back,
              //     color: Colors.black,
              //  ),
              //   label: Text(
              //     'RETAKE TRIVIA',
              //     style: TextStyle(
              //       color: Colors.blue,
              //       fontSize: 20,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
          ],
          
        ),
        
      ),
      
      
    );
  }
}

