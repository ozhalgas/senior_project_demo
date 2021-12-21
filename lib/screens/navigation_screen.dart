import 'package:flutter/material.dart';
import 'package:senior_project_demo/data.dart';
import 'package:senior_project_demo/widgets/panel_widget.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({ Key? key, required this.startShop, required this.endShop}) : super(key: key);

  final Shop startShop;
  final Shop endShop;

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, 
        ),
        backgroundColor: Colors.grey[200],
        title: Text(
          'Navigation Screen',
          style: TextStyle(
            color: Colors.black,
          ),
        )
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[200],
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        child: Column(
          children: [
            SizedBox(height: 200),
            Text(
              'Map will be here',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                'Route from "' + widget.startShop.name + '" to "' + widget.endShop.name + '" will be constructed',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}