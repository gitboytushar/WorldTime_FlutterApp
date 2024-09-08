import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTime(location: 'Athens', flag: 'greece.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo'),
    WorldTime(location: 'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi'),
    WorldTime(location: 'Chicago', flag: 'usa.png', url: 'America/Chicago'),
    WorldTime(location: 'New_York', flag: 'usa.png', url: 'America/New_York'),
    WorldTime(location: 'Delhi', flag: 'india.png', url: 'Asia/Kolkata'),
    WorldTime(location: 'Seoul', flag: 'south_korea.png', url: 'Asia/Seoul'),
    WorldTime(location: 'Jakarta', flag: 'indonesia.png', url: 'Asia/Jakarta'),
    WorldTime(location: 'Tokyo', flag: 'japan.png', url: 'Asia/Tokyo'),
    WorldTime(location: 'Sydney', flag: 'australia.png', url: 'Australia/Sydney'),
    WorldTime(location: 'Paris', flag: 'france.png', url: 'Europe/Paris'),
    WorldTime(location: 'Moscow', flag: 'russia.png', url: 'Europe/Moscow'),
    WorldTime(location: 'Dubai', flag: 'uae.png', url: 'Asia/Dubai'),
    WorldTime(location: 'Rio de Janeiro', flag: 'brazil.png', url: 'America/Sao_Paulo'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
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
        backgroundColor: Colors.blue[200],
        title: Text(
            'Choose a Location',
            style: TextStyle(
              color: Colors.black,
            ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                    // print(locations[index].location);
                  },
                  title: Text(
                      locations[index].location,
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 1.5,
                      ),
                  ),
                ),
              ),
            );
          },
      ),
    );
  }
}

