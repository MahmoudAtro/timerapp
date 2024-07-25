import 'package:flutter/material.dart';
import 'package:timer/widgets/clock_widget.dart';
import 'package:timer/widgets/layout/drawer.dart';
import 'package:timer/widgets/timer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
          child: Scaffold(
              appBar: AppBar(     
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: Colors.deepPurple,
                // add bottom to tabbar witch view the tow page
                bottom: const TabBar(
                  dividerColor: Colors.black,
                  tabs: <Widget>[
                  Tab(
                    icon: Icon(
                      Icons.watch_later,
                      color: Colors.white,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.timer,
                      color: Colors.white,
                    ),
                  )
                ]),
              ),
              // set My Drawer
              drawer: const MyDrawer(),
              body: TabBarView(children: [
                // the first page which content the clock 
                Container(
                  padding: EdgeInsets.all(25),
                  color: Colors.black,
                  child: ClockWidget(),
                ),
                // the second page which content the timer 
                Container(
                  padding: EdgeInsets.only(top: 100, right: 20, left: 20, ),
                  color: Colors.black,
                  child: TimerWidget(),
                )
              ]))),
    );
  }
}
