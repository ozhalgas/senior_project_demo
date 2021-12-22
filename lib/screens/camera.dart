//THIS WIDGET IS NOT USED. 
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:senior_project_demo/data.dart';
import 'map_screen.dart';

class Camera extends StatefulWidget {
  const Camera({ Key? key , required this.camera,}) : super(key: key);

  final CameraDescription camera;

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController controller;
  late Future<void> initializeControllerFuture;
  
  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.camera, ResolutionPreset.medium);
    initializeControllerFuture = controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    MediaQueryData queryData = MediaQuery.of(context);
    double width = queryData.size.width;
    double height = queryData.size.height;
    Map<int, Color> color = {
      900: Color.fromRGBO(26, 67, 78, 1.0)
    };
    MaterialColor primaryColor = MaterialColor(0xFF1A434E, color);
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(//Padding(
        //padding: EdgeInsets.symmetric(horizontal: width*20/360),
        child: Column(
          children: [
            FutureBuilder<void>(
              future: initializeControllerFuture,
              builder: (context, snapshot){
                if (snapshot.connectionState == ConnectionState.done){
                  // If the Future is complete, display the preview.
                  return CameraPreview(controller);
                }else{
                  // Otherwise, display a loading indicator.
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Transform.scale(
        scale: 1.5,
        child: FloatingActionButton(
          onPressed: (){
            /*Navigator.pushReplacement(
              context, 
              MaterialPageRoute(
                builder: (context) => MapScreen(shop: Shop('Basconi', 'Description of Basconi', '2')),
              ),
            );*/
          },
          foregroundColor: primaryColor,
          child: const Icon(
            Icons.camera_alt_rounded,
          ),
          backgroundColor: Colors.blueGrey[50],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}