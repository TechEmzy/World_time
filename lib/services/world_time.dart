import 'package:http/http.dart' as http; // Import http with an alias to avoid conflicts with the Response class
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String? location; //location name for the UI
  String? time; //the time in the location
  String? flag; //url to an asset flag icon
  String? URL; //location url for api endpoint
  bool? isDaytime; //true or false if day time or not (ternary operator)

  //the constructor to receiving the values
  WorldTime({ this.location, this.flag, this.URL });

  Future<void> getTime() async {

    //Try block in making a request(Error Handling)
    try {
      //make a request
    final Uri url = Uri.parse('https://worldtimeapi.org/api/timezone/$URL'); // Corrected URL
    final http.Response response = await http.get(url); // Use http.get
    Map data = jsonDecode(response.body);
    // print(data);

    //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    // print(datetime);
    // print(offset);

    //create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    
    //set the time property
    isDaytime = now.hour > 6 && now.hour < 20 ? true : false;    //ternary operator
    time = DateFormat.jm().format(now);
    }
    //catch the error
    catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
    

  }

}

