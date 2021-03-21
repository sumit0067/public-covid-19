class WorldModule {
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int todayRecovered;
  int active;
  int critical;
  int tests;

  WorldModule(
      {this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.todayRecovered,
      this.active,
      this.critical,
      this.tests});

  factory WorldModule.toJson(Map<String, dynamic> map) {
    return WorldModule(
      cases: map['cases'],
      todayCases: map['todayCases'],
      deaths: map['deaths'],
      todayDeaths: map['todayDeaths'],
      recovered: map['recovered'],
      todayRecovered: map['todayRecovered'],
      active: map['active'],
      critical: map['critical'],
      tests: map['tests'],
    );
  }
}
