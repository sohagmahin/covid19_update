import 'dart:convert';
import 'package:coronavirustracker/models/cases_cn.dart';
import 'package:coronavirustracker/models/cases_wd.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CasesProvider extends ChangeNotifier {
  bool _isLoading = true;
  CasesWD _casesWD;
  List<CasesCN> _countyCases = [];

  List<CasesCN> get casesCn {
    return _countyCases;
  }

  CasesWD get casesWD {
    return _casesWD;
  }

  bool get loadingStatus {
    return _isLoading;
  }

  void setLoadingStatus(bool status) {
    _isLoading = status;
    notifyListeners();
  }

  Future fetchTotalCases() async {
    http.Response response;
    response = await http.get('https://corona.lmao.ninja/all#');
    Map map = json.decode(response.body);
    _casesWD = CasesWD.fromJson(map);
  }

  Future fetchAllCountryCases() async {
    http.Response response;
    response = await http.get('https://corona.lmao.ninja/countries');
    List list = json.decode(response.body);
    list.forEach((country) {
      _countyCases.add(CasesCN.fromJson(country));
    });
  }

  Future initialCall() async {
    await fetchTotalCases();
    await fetchAllCountryCases();
    _isLoading = false;
    notifyListeners();
  }
}
