import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool _obscureText = true;

  void _init() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                hintText: 'Enter Password'),
                obscureText: _obscureText,
          ),
        ),
        Padding(padding: EdgeInsets.only(right: 20), 
        child: ElevatedButton(onPressed: _init, child: Icon(Icons.remove_red_eye_rounded),)
        )
      ]),
    );
  }
}
