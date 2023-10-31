import 'package:flutter/material.dart';
import 'package:parkwise/screens/map.dart';
import 'package:parkwise/screens/map2.dart';
import './screens/login_page.dart';
import './screens/registration.dart';
import './screens/vehicle_selection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parkwise login page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      routes: {
        '/register': (context) => const RegistrationPage(),
        '/vehicleSelect': (context) => const VehicleSelect(),
        '/mapScreen': (context) => const MapScreen(),
        '/mapScreen2': (context) => const MapScreen2(),
      },
    );
  }
}
