import 'package:flutter/material.dart';
import './check.dart';
import './media_buttons.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;
import 'package:rflutter_alert/rflutter_alert.dart';
main(){
  runApp(MaterialApp(
    scaffoldMessengerKey: _messangerKey,
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
final _messangerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final email = TextEditingController();
  final password = TextEditingController();
  final bool _obscureText = true;
  var successSnackBar = SnackBar(content: Text('Login Successful!'));

  Future loginUser(context) async{
    var req = <String, String>{
      "email" : email.value.text,
      "password" :password.value.text
    };
    final base = "10.0.2.2:5000";
    final endpoint = "login";
    var uri = Uri.http(base, endpoint);
    var response = await http.post(uri,
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
      },
      body: convert.jsonEncode(req),
    );
    if(response.statusCode == 200){
      Map jsonResponse = convert.jsonDecode(response.body);
      print("the response is $jsonResponse");
      if(jsonResponse.containsKey('success') && jsonResponse['success']){
        _messangerKey.currentState?.showSnackBar(successSnackBar);
      }
      if(jsonResponse.containsKey('error') && jsonResponse['error']){
        _onCustomAnimationAlertPressed(context, 'Error', jsonResponse['message']);
      }
    }

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                controller: email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    
                    prefixIcon: Icon(Icons.perm_identity_outlined),
                    hintText: 'Enter email'),

              ),
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

              CheckBox(),

              ElevatedButton(
                onPressed: () {
                  var loginData = loginUser(context);
                  print("the samlkasdmk $loginData");
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
                child: Text('LogIn',),
              ),
              MediaButtons()
              
            ],
          ),
        )
      ),
    );
  }
}

_onCustomAnimationAlertPressed(context, titl, disc) {
  Alert(
      context: context,
      style: alertStyle,
      type: AlertType.info,
      title: titl,
      desc: disc,
      buttons: [
        DialogButton(
          child: Text(
            "Close",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
}
var alertStyle = AlertStyle(
  animationType: AnimationType.fromTop,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  descStyle: TextStyle(fontWeight: FontWeight.bold),
  descTextAlign: TextAlign.start,
  animationDuration: Duration(milliseconds: 400),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(0.0),
    side: BorderSide(
      color: Colors.grey,
    ),
  ),
  titleStyle: TextStyle(
    color: Colors.red,
  ),
  alertAlignment: Alignment.topCenter,
);