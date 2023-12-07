import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Declaring a variable to store some data
  Map? data; // Use 'Map?' to indicate that data can be null

  @override
  Widget build(BuildContext context) {
    // Check if data is null; if it is, assign it from route arguments
    if (data == null) {
      data = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
    }

    // Check if data is not null before accessing its properties
    if (data != null) {
      print(data);

      // Set background
      String bgImage = data!['isDaytime'] ? 'day.jpg' : 'night.jpg';
      Color bgColor = data!['isDaytime'] == true
          ? Colors.blue
          : Colors.indigo[700] ?? Colors.transparent;

      return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                children: [
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
                      color: Colors.grey[300],
                    ),
                    label: Text(
                      'Edit Location',
                      style: TextStyle(color: Colors.grey[300]),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data!['location'],
                        style: TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data!['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      // Handle the case where data is null (e.g., display a loading indicator)
      return CircularProgressIndicator(); // Replace with appropriate widget or handling logic
    }
  }
}
