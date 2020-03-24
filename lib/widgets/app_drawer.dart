import 'package:flutter/material.dart';
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Covid19'),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('About'),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('About'),
                      content: Text(
                          'Build by Flutter!\nCreated by SOHAG\nFacebook: fb.com/sohagmahin\nEmail: sohagmahin@gmail.com'),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
