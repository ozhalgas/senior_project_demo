import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:senior_project_demo/screens/map_screen.dart';
import 'package:senior_project_demo/data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:senior_project_demo/model/categories.dart';
//import 'package:senior_project_demo/model/shop.dart';
import 'package:senior_project_demo/model/category_shops.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  const Home({ Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? img;
  List<String> _categList = [];

  Future<List<String>> fetchCategList() async {
    final url = Uri.parse("https://shopping-app-mega-silkway.herokuapp.com/");
    final response = await http.get(url);

    if(response.statusCode == 200){
      List<String> categList = Categories.fromJson(json.decode(response.body)).categories;
      return categList;
    }else return ["error"];
  }

  Future<CategoryShops> fetchShopList(String categorie) async {
    final url = Uri.parse("https://shopping-app-mega-silkway.herokuapp.com/categories/" + categorie);
    final response = await http.get(url);

    //if(response.statusCode == 200){
      //List<String> shopIDList = CategoryShops.fromJson(json.decode(response.body)).categoryShops;
      CategoryShops shops = CategoryShops.fromJson(json.decode(response.body));
      //print(shopIDList);
      //return shopIDList;
      return shops;
    //}else return CategoryShops();
  }

  Future pickImage(BuildContext context, source) async {
    try{
      final nav = Navigator.of(context);
      final img = await ImagePicker().pickImage(source: source);
      if(img != null){
        final imgTempPath = File(img.path);
        print(imgTempPath);
        await nav.push(
          MaterialPageRoute(
            builder: (context) => MapScreen(shop: Shop('Summit Sport', 'Australian sportswear and sports equipment shop. It focuses on delivering ‘Best-In-Game’ products.', '2')),
          ),
        );
        this.img = imgTempPath;
      }
    }on PlatformException catch(e){
      print("Failed to print image: $e");  
    }
  }
  
  String query = '';

  void initState(){
    super.initState();
    fetchCategList().then((categList){
      setState((){
        _categList = categList;
      });
    });
  }

  //final List<Categorie> data = dataForExpandableWidget;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double width = queryData.size.width;
    double height = queryData.size.height;

    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              showSearch(
                context: context, 
                delegate: ShopSearch()
              );
            }, 
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget> [
            //CupertinoSearchTextField(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) => Card(
                  color: Color(0xff68B0AB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FutureBuilder<CategoryShops>(
                    future: fetchShopList(_categList[index]),
                    builder: (context, snapshot){
                      if(snapshot.data != null){
                        final categoryData = snapshot.data;
                        return ExpandableWidget(_categList[index], categoryData!.categoryShops);
                      }else return Container(
                        child: Center(
                          child: Text("Loading..."),
                        ),
                      );
                    }, 
                  ),
                ),
                itemCount: _categList.length,
              ),
            ),
            /*Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) => Card(
                  color: Color(0xff68B0AB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ExpandableWidget(_categList[index], fetchShopList(_categList[index])),
                ),
                itemCount: _categList.length,
              ),
            ),*/
            SizedBox(
              width: width * 70 / 360, 
              height: height * 70 / 640,
              child: FloatingActionButton(
                onPressed: (){
                  //Navigator.pushNamed(context, '/camera');
                  pickImage(context, ImageSource.camera);
                },
                foregroundColor: Color(0xffF5F6FA),
                child: const Icon(
                  Icons.camera_alt_rounded,
                  //TO FIX
                  size: 34,
                ),
                backgroundColor: Color(0xff1A434E),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

//Widget displaying Categories, which can be expanded
class ExpandableWidget extends StatelessWidget {
  const ExpandableWidget(this.category, this.shopIDList);
  final String category;
  //final List<String> shopIDList;

  //final Categorie categorie;
  final List<String> shopIDList;

  showShop(BuildContext context, String shopID){
    return new ListTile(
      title: Text(
        shopID,
        style: TextStyle(
          fontSize: 20,
          color: Color(0xffF5F6FA),
        ),
      ),
      onTap: () {
        /*Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => MapScreen(shop: shop),
          ),
        );*/
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Theme(
      data: ThemeData(
        dividerColor: Colors.transparent, 
        primarySwatch: Colors.red,
      ),
      child: ExpansionTile(
        //backgroundColor: Color(0xff68B0AB),
        key: PageStorageKey<String>(category),
        title: Text(
          category,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xffF5F6FA),
          ),
        ),
        children: shopIDList.map<Widget>((shopID) => showShop(context, shopID)).toList(),
      ),
    );
  }
}

//whole class for Searching. Now uses global data.dart
class ShopSearch extends SearchDelegate<String>{

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        }, 
        icon: Icon(
          Icons.clear, 
          color: Colors.black,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      }, 
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    final suggestionList = query.isEmpty ? allShops : allShops.where((shop) => shop.name.toLowerCase().contains(query.toLowerCase())).toList(); 
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          onTap: (){
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(
                builder: (context) => MapScreen(shop: suggestionList[index])
              ),
            );
          },
          leading: Icon(
            Icons.local_grocery_store_outlined,
            color: Colors.black,
          ),
          title: Text(
            suggestionList[index].name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
        ),
        itemCount: suggestionList.length,
      ),
    );
  }
}