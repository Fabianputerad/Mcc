import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project/Fishes.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var fishes = [
    Image.asset('Asset/fresh_angelfish.jpg'),
    Image.asset('Asset/fresh_betta.jpg'),
    Image.asset('Asset/fresh_goldfish.jpg'),
    Image.asset('Asset/salt_banggaicardinalfish.jpg'),
    Image.asset('Asset/salt_clownfish.jpg'),
    Image.asset('Asset/salt_greenchromis.jpg')
   
  ];
  @override
  int _current = 0;
  final CarouselController _controller = CarouselController();
  Widget build(BuildContext context) { 
    return WillPopScope(
        onWillPop: () async {
          bool willLeave = false;
          // show the confirm dialog
          await showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: const Text('Are you sure want to leave?'),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            willLeave = true;
                            Navigator.of(context).pop();
                          },
                          child: const Text('Yes')),
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('No'))
                    ],
                  ));
          return willLeave;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('HE Fish')),
            body: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: fishes,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: fishes.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
          
        ),
        Column(children: const [
    SizedBox(
      height: 50,
    ),
    Center(
      child: Text(
        'HE Fish is an application that shows information about fishes',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
      ),
    ),
  ],),
        Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=> Page3()));
                      },
                      child: Text('Salt Water'),
      

                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> Page3()));
                      },
                      child: Text('Fresh Water'),
                      
                    ),
                    
        )],
      ),])
    ));
  }
}