import 'package:flutter/material.dart';
import 'dart:async';
import 'package:senior_project_demo/screens/home.dart';
import 'package:senior_project_demo/screens/camera.dart';
import 'package:senior_project_demo/screens/floor_plan.dart';
import 'package:camera/camera.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context) => Home(),
      '/camera' : (context) => Camera(camera : cameras.first),
      '/floor_plan' : (context) => FloorPlan(),
      //'/map_screen' : (context) => MapScreen(shop: ),
    }
  ));
}
