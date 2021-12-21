import 'package:flutter/material.dart';

class FloorPlan extends StatelessWidget {
  const FloorPlan({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Map',
          style: TextStyle(
            color: Colors.amberAccent[200],
          )
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40), 
          topRight: Radius.circular(40)
        ),
        child: Container(
          
        ),
      )
    );
  }
}