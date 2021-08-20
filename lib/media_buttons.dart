import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';

class MediaButtons extends StatefulWidget {
  const MediaButtons({Key? key}) : super(key: key);

  @override
  _MediaButtonsState createState() => _MediaButtonsState();
}

class _MediaButtonsState extends State<MediaButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      GestureDetector(
          child: Text("Create an account",
              style: TextStyle(
                  decoration: TextDecoration.underline, color: Colors.blue)),
          onTap: () {
            // do what you need to do when "Click here" gets clicked
        }),
        SizedBox(height: 20,),

        SignInButton(buttonType: ButtonType.facebook,
        onPressed: () {},
        ),
        SignInButton(buttonType: ButtonType.google, 
        onPressed: () {},
        ),
        SignInButton(buttonType: ButtonType.twitter, 
        onPressed: () {})
        

      ])
    );
  }
}
