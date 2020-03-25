import 'dart:io';
import 'package:coronavirustracker/provider/cases_provider.dart';
import 'package:coronavirustracker/widgets/data_table_screen.dart';
import 'package:coronavirustracker/widgets/pie_chart.dart';
import 'package:coronavirustracker/widgets/theme_dropdownButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  final RefreshController _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitDialog(context),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Covid19 Update'),
            centerTitle: true,
            actions: <Widget>[ThemeDropdownButton()],
          ),
          drawer: AppDrawer(),
          body: SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            onRefresh: () async {
              var casesProviderObj =
                  Provider.of<CasesProvider>(context, listen: false);
              casesProviderObj.setLoadingStatus(true);
              await casesProviderObj.initialCall();
              _refreshController.refreshCompleted();
            },
            child: Column(
              children: <Widget>[
                Expanded(child: PieChartScreen()),
                Expanded(child: DataTableScreen()),
              ],
            ),
          )),
    );
  }

  Future<bool> exitDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?'),
        actions: <Widget>[
          FlatButton(
            child: Text('No'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FlatButton(
            child: Text('Yes'),
            onPressed: () => exit(0),
          ),
        ],
      ),
    );
  }
}
