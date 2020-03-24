import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CautionTypeWriter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 15.0, right: 10.0),
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
