import 'package:flutter/material.dart';
import 'package:senior_project_demo/data.dart';
import 'package:senior_project_demo/widgets/panel_widget.dart';
import 'package:senior_project_demo/widgets/panel_widget_one.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({ Key? key, required this.shop}) : super(key: key);

  final Shop shop;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.12;

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, 
        ),
        backgroundColor:  Color(0xffF5F6FA),
        title: Text(
          'Map',
          style: TextStyle(
            color: Colors.black,
          ),
        )
      ),
      body: SlidingUpPanel(
        //controller: panelController,
        minHeight: panelHeightClosed,
        borderRadius: BorderRadius.vertical(top: Radius.circular(18.0)),
        parallaxEnabled: true,
        parallaxOffset: 0.5,
        body: Container(
          decoration: BoxDecoration(
            color:  Color(0xffF5F6FA),
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(height:300),
              //VOT MESTO 
              Text(
                'Map will be here',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              //Image.network('https://drive.google.com/uc?export=view&id=1a6jtJbagIu4nx3cm3zZzfx8d2GcBC3zT'),
            ],
          ),
        ),
        panelBuilder: (controller) => buildSlidingPanel(controller: controller),
      ),
    );
  }

  Widget buildSlidingPanel({required ScrollController controller}){
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: buildTabBar(),
        body: TabBarView(
          children: [
            PanelWidget(
              controller: controller,
              //panelController: panelController,
              shop: widget.shop,
            ),
            PanelWidgetOne(
              controller: controller,
              //panelController: panelController,
              shop: widget.shop,
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget buildTabBar(){
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        widget.shop.name,
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.black,
        )
      ),
      centerTitle: true,
      backgroundColor: Color(0xffF5F6FA),
      bottom: TabBar(
        unselectedLabelColor: Color(0xff1A434E),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Color(0xff1A434E),
        ),
        tabs: [
          Tab(
            child:  Text(
              'Info',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          Tab(
            child:  Text(
              'Recommendations',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
        ]
      ),
    );
  }
}