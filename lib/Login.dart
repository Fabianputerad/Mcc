import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'home.dart';
import 'List.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Login';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          actions: <Widget>[
            IconButton(
          // ignore: prefer_const_constructors
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data 
//to the form.
class MyCustomFormState extends State<MyCustomForm> {
  bool validateStructure(String value){
        String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])';
        RegExp regExp = new RegExp(pattern);
        return regExp.hasMatch(value);
  }
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  String? password;
  bool _passwordVisible=false;
bool _passwordVisible2=false;
  @override
  void initState() {
    _passwordVisible = false;
    _passwordVisible2 = false;
  }

  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [  
          TextFormField(
            decoration: const InputDecoration(
                labelText: 'email',
                hintText: 'Michael123@email.com',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            
            obscureText: !_passwordVisible,
            decoration:  InputDecoration(
                labelText: 'Password',
                
                suffixIcon: IconButton(
                  icon: 
                    Icon(
                      !_passwordVisible ? Icons.visibility: Icons.visibility_off,
                      color: Colors.blueAccent,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                ),
            ),
            
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              else if(!validateStructure(value)){
                return 'Password must contains at least 1 upper, lower, and number character';
              }
              password = value;
              return null;
            },
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please input valid data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}