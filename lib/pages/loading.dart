import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async{
    WorldTime instance1=WorldTime(location: 'Berlin',flag:'germany.png',url: 'Europe/Berlin');
    await instance1.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location':instance1.location,
      'time':instance1.time,
      'flag':instance1.flag,
      'isdaytime':instance1.isdaytime,
    });
  }


  @override
  void initState(){
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body:Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 100.0,
        ),
      )
    );
  }
}
