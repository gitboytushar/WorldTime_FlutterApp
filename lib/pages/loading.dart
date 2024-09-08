import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading...';
  WorldTime? worldTime;

  void setupWorldTime() async {
    worldTime = WorldTime(location: 'Asia', flag: 'asia.png', url: 'Asia/Kolkata');

    await worldTime?.getTime(); // Use safe navigation operator to avoid null errors

    if (worldTime != null) {
      setState(() {
        time = worldTime!.time; // Access time using safe navigation
      });

      // Redirect to home after data is fetched
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': worldTime!.location,
        'flag': worldTime!.flag,
        'time': worldTime!.time,
        'isDaytime': worldTime!.isDaytime,
      });
    } else {
      print('Error fetching data from WorldTime Api');
    }
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Center(
        // flutter loading animation
        child: SpinKitFadingCircle(
          color: Colors.blue[900],
          size: 80.0,
        ),
      ),
    );
  }
}