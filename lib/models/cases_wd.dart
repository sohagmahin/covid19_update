class CasesWD {
  final int confirmed;
  final int deaths;
  final int recovered;
  CasesWD({this.confirmed, this.deaths, this.recovered});
  factory CasesWD.fromJson(Map map) {
    return CasesWD(
        confirmed: map['cases'],
        deaths: map['deaths'],
        recovered: map['recovered']);
  }
}
