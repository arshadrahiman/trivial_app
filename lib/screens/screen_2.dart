import 'package:flutter/material.dart';
import 'package:trivial_app/MODELS/response_model_model.dart';
import 'package:trivial_app/network/network_helper.dart';
import 'package:trivial_app/screens/screen_3.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  var network = NetworkHelper();
  late Response respons;
  bool isInit = false;
  List<String> answers = [];
  var selectedAnser = '';
  var index = 0;
  var score = 0;
  @override
  void initState() {
    getQusten();
    super.initState();
  }

  getQusten() async {
    index = 0;
    score = 0;
    var res = await network.getQustens();
    if (res != null) {
      setState(() {
        respons = res;
        isInit = true;
        answers = respons.results[index].incorrectAnswers;
        answers.add(respons.results[index].correctAnswer);
        answers.shuffle();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: isInit
              ? [
                  const Text(
                    'TRIVIA APP',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    "Question ${index + 1}",
                    style: const TextStyle(fontSize: 20, color: Colors.blue),
                    textAlign: TextAlign.left,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(respons.results[index].question),
                  ),
                  Column(
                    children: answers.map((e) {
                      return Row(
                        children: [
                          Radio<String>(
                            value: e,
                            groupValue: selectedAnser,
                            onChanged: (
                              value,
                            ) {
                              setState(() {
                                selectedAnser = value ?? '';
                              });
                            },
                          ),
                          Flexible(child: Text(
                            e,
                            style: const TextStyle(color: Colors.blue),
                          ),)

                        ],
                      );
                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(30.0),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: ElevatedButton.icon(
                              onPressed: next,
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
                              label: const Text(
                                'Next',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ]
              : [],
        ),
      ),
    );
  }

  void next() async {
    if (selectedAnser == respons.results[index].correctAnswer) {
      score++;
    }
    print(index);

    if (respons.results.length - 1 > index) {
      setState(() {
        index++;
        answers = respons.results[index].incorrectAnswers;
        answers.add(respons.results[index].correctAnswer);
        answers.shuffle();
      });
    } else {
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Screen3(
                    score: score,
                  )));
      setState(() {
        isInit = false;
      });
      getQusten();
    }
  }
}
