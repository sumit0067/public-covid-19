import 'package:flutter/material.dart';

class CountryDetails extends StatefulWidget {
    var countryName,
      cases,
      todayCases,
      deaths,
      todayDeaths,
      recovered,
      todayRecovered,
      active,
      critical,
      tests,
      population,
      image;

  CountryDetails(
      {this.countryName,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.todayRecovered,
      this.active,
      this.critical,
      this.tests,
      this.population,
      this.image,
      Key key})
      : super(key: key);

  @override
  _CountryDetailsState createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.countryName),
      ),
      body: Column(children: [Text(widget.cases.toString())],),
    );
  }
}
