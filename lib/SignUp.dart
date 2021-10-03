import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final email = TextEditingController();
  final password = TextEditingController();
  final rePassword = TextEditingController();
  final bool _obscureText = true;
  final snackBar = SnackBar(content: Text('Signed In successful!'));

  Future postSigninData() async{
    var req = <String, String>{
      'email': (email.value.text.toString()),
      "password": (password.value.text.toString()) ,
      "rePassword": (password.value.toString())
    };
    final base = "10.0.2.2:5000";
    final endpoint = "addUser";
    var uri = Uri.http(base, endpoint);
    var response = await http.post(uri, 
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
      },
    body: convert.jsonEncode(req),
  );
    if (response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body);
      print('response :$jsonResponse.');
      if(jsonResponse['success']== true){
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>{Navigator.of(context).pop()},
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.white,),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10.0,
          ),
          Image.asset(
            'assets/images/login.png',
            fit: BoxFit.cover,
          ),
          Padding(padding: EdgeInsets.only(left: 20, right: 20), child: TextField(
            controller: email,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.perm_identity_outlined),
                hintText: 'Enter email'),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),

            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(controller: password,
                  decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                hintText: 'Enter password'),
                obscureText: _obscureText,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),

            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(controller: rePassword,
                  decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                hintText: 'Confirm password'),
                obscureText: _obscureText,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),

            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
              onPressed: () {
                postSigninData();
                ScaffoldMessenger.of(context).showSnackBar(snackBar);},
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
              child: Text('SignUp')
                )
              ),
        ],
      ),
    );
  }
}
