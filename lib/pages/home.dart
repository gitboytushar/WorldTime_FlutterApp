import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map<dynamic, dynamic>? data;

  @override
  Widget build(BuildContext context) {

    // Retrieve arguments if data is null
    data ??= ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
    // print(data); // check console

    // set background image
    String bgImage = data?['isDaytime'] ? 'day.png' : 'night.png';
    // set color based on background image
    Color bgColor = data?['isDaytime'] ? Colors.black : Colors.white;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover, // image covers the whole screen
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: bgColor,
                  ),
                  label: Text(
                    "Select Location",
                    style: TextStyle(color: bgColor),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data?['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: bgColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.0),
                Text(
                  data?['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    fontWeight: FontWeight.bold,
                    color: bgColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}