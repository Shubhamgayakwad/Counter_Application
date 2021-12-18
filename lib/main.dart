import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(const TimerApp());

class TimerApp extends StatefulWidget {
  const TimerApp({Key? key}) : super(key: key);

  @override
  _TimerAppState createState() => _TimerAppState();
}

//Update the time in 'YYYY-MM-DD HH:MM:SS' format
final eventTime = DateTime.parse('2021-12-18 16:11:00');

class _TimerAppState extends State<TimerApp> {
  static const duration = Duration(seconds: 1);

  int timeDiff = eventTime.difference(DateTime.now()).inSeconds;
  bool isFinishTimer = false;
  Timer? timer;

  void handleTick() {
    if (timeDiff > 0) {
      setState(() {
        if (eventTime != DateTime.now()) {
          timeDiff = timeDiff - 1;
        } else {
          // ignore: avoid_print
          print('Times up!');
          //Do something
        }
      });
    } else {
      setState(() {
        isFinishTimer = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    timer ??= Timer.periodic(duration, (_) {
      handleTick();
    });

    int days = timeDiff ~/ (24 * 60 * 60) % 24;
    int hours = timeDiff ~/ (60 * 60) % 24;
    int minutes = (timeDiff ~/ 60) % 60;
    int seconds = timeDiff % 60;

    showTime() {
      return Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            timeCards(time: days.toString(), headers: 'DAYS'),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                margin: const EdgeInsets.only(bottom: 50),
                child: const Text(
                  ':',
                  style: TextStyle(fontSize: 60, color: Colors.white),
                ),
              ),
            ),
            timeCards(time: hours.toString(), headers: 'HOURS'),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                margin: const EdgeInsets.only(bottom: 50),
                child: const Text(
                  ':',
                  style: TextStyle(fontSize: 60, color: Colors.white),
                ),
              ),
            ),
            timeCards(time: minutes.toString(), headers: 'MINUTES'),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                margin: const EdgeInsets.only(bottom: 50),
                child: const Text(
                  ':',
                  style: TextStyle(fontSize: 60, color: Colors.white),
                ),
              ),
            ),
            timeCards(time: seconds.toString(), headers: 'SECONDS'),
          ],
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.grey,
            title: const Center(
              child: Text('Countdown Timer'),
            ),
          ),
          body: isFinishTimer != true
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    showTime(),
                  ],
                )
              : const Center(
                  child: Text(
                    'Time is Over now',
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                )),
    );
  }

  Widget timeCards({String? time, var headers}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Text(
            time.toString().padLeft(2, "0"),
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(headers,
            style: const TextStyle(fontSize: 15, color: Colors.white)),
      ],
    );
  }
}
