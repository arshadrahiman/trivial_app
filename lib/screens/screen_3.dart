import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({Key? key, required this.score}) : super(key: key);
  final int score;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              const SizedBox(
                    height: 120,
                    child: Center(
                      child: Text(
                        'TRIVIA APP',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      ),),
            const SizedBox(height: 120,),
            const Text('Your Score Is',style: TextStyle(fontSize:30,fontWeight: FontWeight.bold)),
            const SizedBox(height: 50,),
            Text('$score/100',style:const TextStyle(fontSize:40,fontWeight: FontWeight.bold)),
            const SizedBox(height: 120,),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
               child: const Text('RETAKE TRIVIA',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),)
            )],
      ),
    ),);
  }
}

     