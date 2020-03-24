import 'package:coronavirustracker/widgets/data_table_screen.dart';
import 'package:coronavirustracker/widgets/pie_chart.dart';
import 'package:coronavirustracker/widgets/theme_dropdownButton.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Coronavirus Update'),
          centerTitle: true,
          actions: <Widget>[ThemeDropdownButton()],
        ),
        drawer: Drawer(
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
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: PieChartScreen()),
            Expanded(child: DataTableScreen()),
          ],
        ));
  }
}
