import 'package:coronavirustracker/provider/cases_provider.dart';
import 'package:coronavirustracker/widgets/data_table_screen.dart';
import 'package:coronavirustracker/widgets/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<CasesProvider>(context, listen: false).initialCall();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Coronavirus statistics!'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: PieChartScreen()),
            Expanded(child: DataTableScreen()),
          ],
        ));
  }
}
