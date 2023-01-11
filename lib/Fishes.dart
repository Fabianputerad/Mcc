import 'package:flutter/material.dart';


void main() {
  runApp(new MaterialApp(home: new Page3()));
}

class Page3 extends StatefulWidget {
  @override
  Page3State createState() => new Page3State();
}

class Page3State extends State<Page3> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
            title:  Text("Pages"),
            backgroundColor: Colors.blue,
            ),
        bottomNavigationBar:  Material(
            color: Colors.blue,
            child:  TabBar(controller: controller, tabs: const <Tab>[
               Tab(text: "Salt Water"),
               Tab(text: "Fresh Water")
            ])),
        body:  TabBarView(controller: controller, children: <Widget>[
           First(),
           Second(),
        ]),
          floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Page3()));
          }, 
          child: const Icon(Icons.add),
          ),
    );
  }
}
class First extends StatefulWidget {
  @override
  FirstState createState() => new FirstState();
}

class FirstState extends State<First> with SingleTickerProviderStateMixin {
  late TabController controller1;
  @override
  Widget build(BuildContext context) {
    return new Column(children: [
      new Expanded(
        child: new Card(
            child: new Center(
                child: new Icon(Icons.favorite,
                    size: 150.0, color: Colors.blue))),
      ),
      new Expanded(
        child: new Card(
            child: new Center(
                child: new Icon(Icons.favorite,
                    size: 150.0, color: Colors.blue))),
      ),
    ]);
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(children: [
      new Expanded(
        child: new Card(
            child: new Center(
                child: new Icon(Icons.favorite,
                    size: 150.0, color: Colors.blue))),
      ),
      new Expanded(
        child: new Card(
            child: new Center(
                child: new Icon(Icons.favorite,
                    size: 150.0, color: Colors.blue))),
      ),
    ]);
  }
}

