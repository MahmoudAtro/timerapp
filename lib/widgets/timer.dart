import 'dart:async';
import 'package:flutter/material.dart';


class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer? _timer;
  bool isRunning = false;
  int _remainingTime = 0; // الوقت المتبقي بالثواني
  int durationInMinutes = 5; // مدة المؤقت بالدقائق

  @override
  void initState() {
    super.initState();
    _remainingTime = durationInMinutes * 60;
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer?.cancel();
          isRunning = false;
        }
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _remainingTime = durationInMinutes * 60;
      isRunning = false;
    });
  }

  String _formatTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 7.0),
              width: 120,
              height: 120,
              child: Text(
                _formatTime(_remainingTime).split(':')[0], // الساعات
                style: textstyle.textstyle2,
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 7.0),
              width: 120,
              height: 120,
              child: Text(
                _formatTime(_remainingTime).split(':')[1], // الدقائق والثواني
                style: textstyle.textstyle2,
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(left: 7.0),
              width: 120,
              child: Text(
                "Minutes",
                style: textstyle.textstyle1,
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(left: 7.0),
              width: 120,
              child: Text(
                "Seconds",
                style: textstyle.textstyle1,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        isRunning
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: _stopTimer,
                    color: Colors.purple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Text(
                      "Stop Timer",
                      style: textstyle.textstyle1,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  MaterialButton(
                    onPressed: _resetTimer,
                    color: Colors.purple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Text(
                      "Reset",
                      style: textstyle.textstyle1,
                    ),
                  ),
                ],
              )
            : MaterialButton(
                onPressed: () {
                  setState(() {
                    isRunning = true;
                    _startTimer();
                  });
                },
                color: Colors.blue[900],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: Text(
                  "Start Timer",
                  style: textstyle.textstyle1,
                ),
              ),
      ],
    );
  }
}

class textstyle {
  static TextStyle textstyle1 = TextStyle(
    color: Colors.white,
    fontSize: 20,
  );

  static TextStyle textstyle2 = TextStyle(
    color: Colors.black,
    fontSize: 60,
  );
}
