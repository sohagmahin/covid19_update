import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CautionTypeWriter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _originalWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding:  EdgeInsets.only(left: _originalWidth*0.015, right: _originalWidth*0.010),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TypewriterAnimatedTextKit(
            speed: Duration(milliseconds: 300),
            onTap: () {
              print("Tap Event");
            },
            totalRepeatCount: 1000,
            text: [
              "Stay at home",
              "Wash your hands frequently",
              "Maintain social distancing",
              "Avoid touching eyes, nose and mouth"
            ],
            textStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.height*0.025,
                fontStyle: FontStyle.italic,
                fontFamily: 'Merienda',
                color: Colors.orange),
            textAlign: TextAlign.center,
            alignment: AlignmentDirectional.topStart // or Alignment.topLeft
            ),
      ),
    );
  }
}
