import 'package:flutter/material.dart';
import 'package:project/Register.dart';
import 'List.dart';
import 'Login.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'HE Fish',
      home: LoginPage(title: 'Login'),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      body: Column(
        children: [
          Image.asset('Asset/HEFISH.png'),
          Container(       
            height: 200,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: 
              Column(   
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child:
                      ElevatedButton( 
                        style: 
                          const ButtonStyle(
                            //backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
                          ),
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                        }, 
                        child: Row(
                          children: [
                            Expanded(child: Container()),
                            const Text("Login", style: TextStyle(color: Colors.white),),
                            Expanded(child: Container())
                          ],
                       ),
                      ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child:
                      ElevatedButton( 
                        style: 
                          const ButtonStyle(
                          //backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
                          ),
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Register()));
                        }, 
                        child: Row(
                          children: [
                            Expanded(child: Container()),
                            const Text("Register", style: TextStyle(color: Colors.white),),
                            Expanded(child: Container())
                          ],
                        ),
                      ),
                  ),
                ],
            ),
            
           ),
          
         ],
       
      )
    );
  }
}







