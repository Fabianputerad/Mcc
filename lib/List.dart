import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'Fishes.dart';

class List extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new ListState();
  }
}
class ListState extends State<List>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("List"), 
        actions: <Widget>[
          IconButton(
              icon: const Icon(
              Icons.logout,
              color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Page3()));
            },
            child: const Card(
              elevation: 10,
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child:  ListTile(
                  leading: Icon(Icons.image) ,
                  title:  Text("Garden",                 
                  ),
                  subtitle: Text("a planned space, usually outdoors...."),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Page3()));
            },
            child: const Card(
              elevation: 10,
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child:  ListTile(
                  leading: Icon(Icons.image) ,
                  title: Text("Kitchen",),
                  subtitle: Text("a room equipped for preparing and cooking food"),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Page3()));
            },
            child: const Card(
              elevation: 10,
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child:  ListTile(
                  leading: Icon(Icons.image) ,
                  title: Text("Living Room",
                  ),
                  subtitle: Text("as a place for formal entertaining"),
                ),
              ),
            ),
          ),
        ],)
      ),
    );
    
  }
}   
