import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  //list of data
   List<WorldTime> locations = [
    WorldTime(URL: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(URL: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(URL: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(URL: 'Africa/Lagos', location: 'Lagos', flag: 'nigeria.png'),
    WorldTime(URL: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(URL: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(URL: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(URL: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(URL: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    //store the locations list to the instance local var
    WorldTime instance = locations[index];
    await instance.getTime();

    //navigate to homescreen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime, 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Choose a Location',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location?? 'Unknown Location'),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
