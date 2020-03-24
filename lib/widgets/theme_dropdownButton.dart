import 'package:coronavirustracker/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeDropdownButton extends StatefulWidget {
  @override
  _ThemeDropdownButtonState createState() => _ThemeDropdownButtonState();
}

class _ThemeDropdownButtonState extends State<ThemeDropdownButton> {
  @override
  Widget build(BuildContext context) {
    var themeObj = Provider.of<ThemeProvider>(context, listen: false);
    bool themeFlag = themeObj.isDarkTheme;
    String selectedItem = themeFlag ? 'Dark' : 'Light';
    return DropdownButton<String>(
        value: selectedItem,
        underline: Container(),
        items: [
          DropdownMenuItem(
            child: Text(
              'Dark',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            value: 'Dark',
          ),
          DropdownMenuItem(
            child: Text(
              'Light',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            value: 'Light',
          )
        ],
        onChanged: (value) {
          setState(() {
            if (value == 'Dark' && selectedItem == 'Light' ||
                value == 'Light' && selectedItem == 'Dark') {
              themeObj.toggleTheme();
            }
            selectedItem = value;
          });
        });
  }
}
