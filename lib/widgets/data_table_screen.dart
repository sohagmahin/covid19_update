import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cases_provider.dart';

class DataTableScreen extends StatelessWidget {
  Widget _buildFlag(String imageUrl) {
    return Container(
      width: 15,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image:
            DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
      ),
    );
  }

  Row countryNameWithFlag(String str, String imageUrl) {
    return Row(
      children: <Widget>[
        Text(str.length >= 9 ? str.replaceAll(' ', '\n') : str),
        _buildFlag(imageUrl)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Consumer<CasesProvider>(
        child: Center(
          child: CircularProgressIndicator(),
        ),
        builder: (context, casesModel, ch) {
          var casesCountryList = casesModel.casesCn;
          return casesModel.loadingStatus
              ? ch
              : ListView(
                  children: <Widget>[
                    DataTable(
                        columnSpacing: 12,
                        columns: [
                          DataColumn(label: Text('ID')),
                          DataColumn(label: Text('Country')),
                          DataColumn(label: Text('Confirmed')),
                          DataColumn(label: Text('Deaths')),
                          DataColumn(label: Text('Recovered')),
                        ],
                        rows: List.generate(casesCountryList.length, (i) {
                          return DataRow(
                            cells: [
                              DataCell(Text((i + 1).toString())),
                              DataCell(countryNameWithFlag(
                                  casesCountryList[i].countryName,
                                  casesCountryList[i].imageUrl)),
                              DataCell(Text(
                                  casesCountryList[i].confirmed.toString())),
                              DataCell(
                                  Text(casesCountryList[i].deaths.toString())),
                              DataCell(Text(
                                  casesCountryList[i].recovered.toString())),
                            ],
                          );
                        }))
                  ],
                );
        },
      ),
    );
  }
}
