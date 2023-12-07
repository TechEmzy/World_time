import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // Import Flutter's foundation library for debugPrint.
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/choose_location.dart';

void main() {
  // Set error filter to suppress all error messages
  FlutterError.onError = (FlutterErrorDetails details) {
    // Suppress all errors
    debugPrint('Handled or suppressed an error: ${details.exception}');
  };

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
