import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:worldtimeapp/services/world_time.dart';

class ChoseLocation extends StatefulWidget {
  @override
  _ChoseLocationState createState() => _ChoseLocationState();
}

class _ChoseLocationState extends State<ChoseLocation> {

  List<WorldTime>locations= [
                              WorldTime(location: 'America',flag:'usa_flag.png',url: 'America/New_York'),
                              WorldTime(location: 'London',flag:'uk_flag.png',url: 'Europe/London'),
                              WorldTime(location: 'Japan',flag:'japan_flag.png',url: 'Asia/Tokyo'),
                              WorldTime(location: 'Germany',flag:'germany_flag.png',url: 'Europe/Berlin'),
                              WorldTime(location: 'Greece',flag:'greece_flag.png',url: 'Europe/Athens'),
                              WorldTime(location: 'China',flag:'china_flag.png',url: 'Asia/Hong_Kong'),
                             ];
  void updateTime(index) async {
    WorldTime instance1 = WorldTime(location: locations[index].location,
        flag: locations[index].flag,
        url: locations[index].url);
    await instance1.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance1.location,
      'time': instance1.time,
      'flag': instance1.flag,
      'isdaytime': instance1.isdaytime,
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle:true,
        title: Text('Location',
        style: TextStyle(
          color: Colors.white,
        ),
        ),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
            onTap: (){
              updateTime(index);
            },
            title:Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),

          ),
          );
       }
     ),
    );
  }
}
