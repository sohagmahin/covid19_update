import 'package:coronavirustracker/models/cases_cn.dart';
import 'package:coronavirustracker/models/cases_wd.dart';
import 'package:flutter/cupertino.dart';
import 'data_repository.dart';

class CasesProvider extends ChangeNotifier {
  bool _isLoading = true;
  DataRepository dataRepository;

  List<CasesCN> get countryCases {
    return dataRepository.countyCases;
  }

  CasesWD get worldCases {
    return dataRepository.worldCases;
  }

  bool get loadingStatus {
    return _isLoading;
  }

  void setLoadingStatus(bool status) {
    _isLoading = status;
    notifyListeners();
  }

  Future initialCall() async {
    dataRepository = DataRepository();
    await dataRepository.dataRepoInitialCall();
    _isLoading = false;
    notifyListeners();
  }
}
