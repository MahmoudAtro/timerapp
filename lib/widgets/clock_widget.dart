// ignore_for_file: prefer_const_constructors, must_be_immutable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer/widgets/Models/clock_model.dart';
import 'package:timer/widgets/Models/time_model.dart';
import 'package:timer_builder/timer_builder.dart';

class ClockWidget extends StatefulWidget {
  ClockWidget({super.key});

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // upgrade time each second
      TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
        DateTime currentTime = DateTime.now();
        // set the digital time with time format 12 hour system
        var seconds = DateFormat('ss').format(currentTime);
        var minute = DateFormat('mm').format(currentTime);
        var hour = DateFormat('hh').format(currentTime);
        var period = DateFormat('a').format(currentTime);

        return Column(
          children: [
            Center(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  
                  shape: BoxShape.circle,
                  // add effect colck
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber.withAlpha(80),
                      blurRadius: 38,
                    )
                  ]),
              height: 300,
              width: 300,
              child: CustomPaint(
                // draw the circle 
                painter: ClockPainter(
                    time: TimeModel(
                        hour: currentTime.hour,
                        min: currentTime.minute,
                        sec: currentTime.second)),
              ),
            )),
            SizedBox(
              height: 25,
            ),
            Row(
              // here we view the time digital
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Hours
                Container(
                  margin: EdgeInsets.only(right: 5),
                  width: 75,
                  height: 75,
                  child: Center(
                    child: Text(
                      "${hour}",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle, color: Colors.grey),
                ),
                // Minutes
                Container(
                  margin: EdgeInsets.only(right: 5),
                  child: Center(
                    child: Text(
                      "${minute}",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle, color: Colors.grey),
                ),
                // Seconds
                Container(
                  margin: EdgeInsets.only(right: 5),
                  child: Center(
                    child: Text(
                      "${seconds}",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle, color: Colors.grey),
                ),
              ],
            ),
            // Period => [Am , Pm]
             Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Center(
                    child: Text(
                      "${period}",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
          ],
        );
      }),
    ]);
  }
}
