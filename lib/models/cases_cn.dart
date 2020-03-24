class CasesCN {
  final String countryName;
  final int confirmed;
  final int deaths;
  final int recovered;
  final String imageUrl;
  CasesCN(
      {this.countryName,
      this.confirmed,
      this.deaths,
      this.recovered,
      this.imageUrl});
  factory CasesCN.fromJson(Map map) {
    return CasesCN(
      countryName: map['country'],
      confirmed: map['cases'],
      deaths: map['deaths'],
      recovered: map['recovered'],
      imageUrl: map['countryInfo']['flag'],
    );
  }
}
