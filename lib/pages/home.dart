import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  @override
  Widget build(BuildContext context) {

    data=ModalRoute.of(context).settings.arguments;
    print(data);
    String bgImage = data['isdaytime']? 'morning.jpg':'night.jpg';
    Color bgColor = data['isdaytime']? Colors.blue:Colors.indigo[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: SafeArea(child: Column(
            children: <Widget>[
              FlatButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context,'/location');
                },
                icon: Icon(Icons.edit_location,
                color: Colors.white,),
                label: Text('Edit Location',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),),
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 45,
                    letterSpacing: 1,
                    color: Colors.white,
                    ),
                  ),
                ],
               ),
              SizedBox(height: 15,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(data['time'],
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight:FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ]
              )
            ],
          )),
        ),
      ),
    );
  }
}
