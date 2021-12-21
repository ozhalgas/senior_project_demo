import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:senior_project_demo/screens/map_screen.dart';
import 'package:senior_project_demo/data.dart';
import 'package:senior_project_demo/screens/navigation_screen.dart';

class EndpointScreen extends StatefulWidget {
  const EndpointScreen({ Key? key, required this.startShop}) : super(key: key);

  final Shop startShop;

  @override
  _EndpointScreenState createState() => _EndpointScreenState(startShop);
}

class _EndpointScreenState extends State<EndpointScreen> {

  Shop startShop;
  _EndpointScreenState(this.startShop);
  
  String query = '';

  void initState(){
    super.initState();
  }

  final List<Categorie> data = dataForExpandableWidget;
 
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
          'Select Endpoint',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              showSearch(
                context: context, 
                delegate: ShopSearch(startShop),
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
                  child: ExpandableWidget(data[index], startShop),
                ),
                itemCount: data.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Widget for expandable categories. Uses global data.dart
class ExpandableWidget extends StatelessWidget {
  const ExpandableWidget(this.categorie, this.startShop);

  final Categorie categorie;
  final Shop startShop;

  showShop(BuildContext context, Shop shop){
    return new ListTile(
      title: Text(
        shop.name,
        style: TextStyle(
          fontSize: 20,
          color:  Color(0xffF5F6FA),
        ),
      ),
      onTap: () {
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(
            builder: (context) => NavigationScreen(startShop: startShop, endShop: shop),
          ),
        );
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
        key: PageStorageKey<Categorie>(categorie),
        title: Text(
          categorie.categorieName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xffF5F6FA),
          ),
        ),
        children: categorie.listShops.map<Widget>((shop) => showShop(context, shop)).toList(),
      ),
    );
  }
}

//whole class for Searching. Now uses global data.dart
class ShopSearch extends SearchDelegate<String>{

  final Shop startShop;

  ShopSearch(this.startShop);

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
                builder: (context) =>  NavigationScreen(startShop: startShop, endShop: suggestionList[index]),
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