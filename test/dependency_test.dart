import 'package:coronavirustracker/provider/data_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('World dependency check', () async {
    var result = await DataRepository().fetchTotalCases();
    expect(result, 200);
  });
  test('Country dependency check', () async {
    var result = await DataRepository().fetchAllCountryCases();
    expect(result, 200);
  });
}
