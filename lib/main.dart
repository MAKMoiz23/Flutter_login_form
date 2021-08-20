import 'package:flutter/material.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';
import './check.dart';
import './media_buttons.dart';
import './password.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Image.asset(
                'assets/images/login.png',
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(padding: EdgeInsets.only(left: 20, right: 20, bottom: 20), child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.perm_identity_outlined),
                    hintText: 'Enter Name'),
                    
              ),
              ),

              Password(),

              CheckBox(),

              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
                child: Text('LogIn',),
              ),
              MediaButtons()
              
            ],
          ),
      )),
    );
  }
}
