import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:coronavirustracker/models/cases_wd.dart';
import 'package:coronavirustracker/models/cases_cn.dart';

const String urlTotalCases = 'https://corona.lmao.ninja/v2/all#';
const String urlAllCntryCases = 'https://corona.lmao.ninja/v2/countries';

class DataRepository {
  CasesWD _worldCases;
  List<CasesCN> _countyCases = [];

  CasesWD get worldCases => _worldCases;

  List<CasesCN> get countyCases => _countyCases;

  Future<void> dataRepoInitialCall() async {
    await fetchTotalCases();
    await fetchAllCountryCases();
  }

  Future<int> fetchTotalCases() async {
    http.Response response;
    response = await http.get(urlTotalCases);
    Map map = json.decode(response.body);
    _worldCases = CasesWD.fromJson(map);
    return response.statusCode;
  }

  Future<int> fetchAllCountryCases() async {
    http.Response response;
    response = await http.get(urlAllCntryCases);
    List list = json.decode(response.body);
    list.forEach(
        (country) async => _countyCases.add(CasesCN.fromJson(country)));
    return response.statusCode;
  }
}
