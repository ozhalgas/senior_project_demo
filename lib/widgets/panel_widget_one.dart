import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:senior_project_demo/data.dart';
import 'package:senior_project_demo/screens/endpoint_screen.dart';

class PanelWidgetOne extends StatefulWidget {
  const PanelWidgetOne({ Key? key, required this.controller, /*required this.panelController*/ required this.shop}) : super(key: key);

  final ScrollController controller;
  //final PanelController panelController;
  final Shop shop;

  @override
  State<PanelWidgetOne> createState() => _PanelWidgetOneState(shop, controller);
}

class _PanelWidgetOneState extends State<PanelWidgetOne> {
  //String selectedOption = 'Info';
  ScrollController controller;
  Shop shop;
  _PanelWidgetOneState(this.shop, this.controller);

  void initState(){
    super.initState();
  }

  /*Widget buildActionChip(String option, BuildContext context){
    final isSelected = selectedOption == option;
    final foregroudColor = isSelected ? Color(0xffF5F6FA) : Color(0xff1A434E);
    final backgroundColor = isSelected ? Color(0xff1A434E) : Color(0xffF5F6FA);

    return ActionChip(
      label: Text(
        option,
        style: TextStyle(
          color: foregroudColor,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      backgroundColor: backgroundColor,
      onPressed: (){
        setState(() {
          selectedOption = option;
        });
      },
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      padding: EdgeInsets.zero,
      children: <Widget>[
        /*SizedBox(height: 12),
        buildDragHandle(),
        SizedBox(height: 18),
        Center(
          child: Text(
            shop.name,
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.black,
            )
          ),
        ),
        SizedBox(height: 15),
        Divider(
          thickness: 2,
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildActionChip('Info', context),
            buildActionChip('Recommendations', context),
          ],
        ),
        //buildAbout(),*/
        //SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
          child: Text(
            'About',
            style: TextStyle(
              color: Color(0xff1A434E),
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
          child: Text(
            shop.description,
            style: TextStyle(
              color: Color(0xff1A434E),
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
          child: Text(
            'Recommendations',
            style: TextStyle(
              color: Color(0xff1A434E),
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
          child: Text(
            'Recommendations list will be here',
            style: TextStyle(
              color: Color(0xff1A434E),
              fontSize: 18,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w200
            ),
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 30, 50, 0),
          child: ElevatedButton.icon(
            icon: Icon(
              Icons.search_outlined,
              color: Color(0xffF5F6FA),
            ),
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              primary: Color(0xff1A434E),
            ),
            label: Text(
              'Other Categories',
              style: TextStyle(
                color: Color(0xffF5F6FA),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              )
            ),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => EndpointScreen(startShop: shop),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  /*Widget buildDragHandle() => GestureDetector(
    child: Center(
      child: Container(
        width: 30,
        height: 5,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    //onTap: togglePanel,
  );*/
}