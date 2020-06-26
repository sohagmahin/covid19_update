import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'caution_typewriter.dart';
import 'indicator.dart';
import 'package:provider/provider.dart';
import '../provider/cases_provider.dart';

class PieChartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex;
  @override
  void initState() {
    Provider.of<CasesProvider>(context, listen: false).initialCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding:
            EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Consumer<CasesProvider>(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                      builder: (context, model, ch) {
                        return model.loadingStatus
                            ? ch
                            : Container(child: _buildPieChart(model));
                      }),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _buildLabelText(),
                    _buildIndicators(),
                  ],
                ),
              ],
            ),
            CautionTypeWriter(),
          ],
        ),
      ),
    );
  }

  Widget _buildPieChart(CasesProvider model) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.33,
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
            setState(() {
              if (pieTouchResponse.touchInput is FlLongPressEnd ||
                  pieTouchResponse.touchInput is FlPanEnd) {
                touchedIndex = -1;
              } else {
                touchedIndex = pieTouchResponse.touchedSectionIndex;
              }
            });
          }),
          borderData: FlBorderData(
            show: false,
          ),
          sectionsSpace: 0,
          centerSpaceRadius: MediaQuery.of(context).size.height * 0.04,
          sections: showingSections(
            model.worldCases.confirmed,
            model.worldCases.deaths,
            model.worldCases.recovered,
          ),
        ),
      ),
    );
  }

  Text _buildLabelText() {
    return Text(
      'World Covid19',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        shadows: <Shadow>[
          Shadow(
            offset: Offset(6.0, 6.0),
            blurRadius: 3.0,
            color: Colors.green,
          ),
          Shadow(
            offset: Offset(6.0, 6.0),
            blurRadius: 8.0,
            color: Color.fromARGB(125, 0, 0, 255),
          ),
        ],
      ),
    );
  }

  Column _buildIndicators() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        SizedBox(
          height: 4,
        ),
        Indicator(
          color: Color(0xfff8b250),
          text: 'Confirmed',
          isSquare: true,
        ),
        SizedBox(
          height: 4,
        ),
        Indicator(
          color: Color(0xffE71C23),
          text: 'Deaths',
          isSquare: true,
        ),
        SizedBox(
          height: 4,
        ),
        Indicator(
          color: Color(0xff13d38e),
          text: 'Recovered',
          isSquare: true,
        ),
        SizedBox(
          height: 18,
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections(
      int confirmedValue, int deathsValue, int recoveredValue) {
    double _originalWidth = MediaQuery.of(context).size.width;
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 20 : 13;
      final double radius =
          isTouched ? _originalWidth * 0.15 : _originalWidth * 0.12;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: confirmedValue.toDouble(),
            title: confirmedValue.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xffE71C23),
            value: deathsValue.toDouble(),
            title: deathsValue.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: recoveredValue.toDouble(),
            title: recoveredValue.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }
}
