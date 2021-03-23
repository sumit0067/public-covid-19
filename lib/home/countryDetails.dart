import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CountryDetails extends StatefulWidget {
  final countryName,
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
  List<charts.Series> series;

  List<charts.Series<Cases, String>> _createList() {
    final cases = [
      Cases('case', widget.cases, Colors.pinkAccent),
    ];
    final active = [
      Cases('active', widget.active, Colors.red),
    ];
    final recovered = [
      Cases('recover', widget.todayRecovered, Colors.deepOrange),
    ];
    final deaths = [
      Cases('deaths', widget.todayDeaths, Colors.blue),
    ];
    final tests = [
      Cases('Tests', widget.tests, Colors.lightBlue),
    ];

    return [
      charts.Series<Cases, String>(
        id: 'cases',
        data: cases,
        domainFn: (Cases cases, _) => cases.caseName,
        measureFn: (Cases cases, _) => cases.caseNo,
        colorFn: (Cases cases, _) =>
            charts.ColorUtil.fromDartColor(cases.color),
      ),
      charts.Series<Cases, String>(
        id: 'active',
        data: active,
        domainFn: (Cases cases, _) => cases.caseName,
        measureFn: (Cases cases, _) => cases.caseNo,
        colorFn: (Cases cases, _) =>
            charts.ColorUtil.fromDartColor(cases.color),
      ),
      charts.Series<Cases, String>(
        id: 'recovered',
        data: recovered,
        domainFn: (Cases cases, _) => cases.caseName,
        measureFn: (Cases cases, _) => cases.caseNo,
        colorFn: (Cases cases, _) =>
            charts.ColorUtil.fromDartColor(cases.color),
      ),
      charts.Series<Cases, String>(
        id: 'deaths',
        data: deaths,
        domainFn: (Cases cases, _) => cases.caseName,
        measureFn: (Cases cases, _) => cases.caseNo,
        colorFn: (Cases cases, _) =>
            charts.ColorUtil.fromDartColor(cases.color),
      ),
      charts.Series<Cases, String>(
        id: 'tests',
        data: tests,
        domainFn: (Cases cases, _) => cases.caseName,
        measureFn: (Cases cases, _) => cases.caseNo,
        colorFn: (Cases cases, _) =>
            charts.ColorUtil.fromDartColor(cases.color),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    series = _createList();
    print(widget.todayRecovered);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.chevron_left_rounded),
        ),
        title: Text(widget.countryName),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: size.height / 2.5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: charts.BarChart(
                  series,
                  animate: true,
                  barGroupingType: charts.BarGroupingType.grouped,
                  behaviors: [
                    new charts.SeriesLegend(
                      desiredMaxRows: 2,
                      outsideJustification:
                          charts.OutsideJustification.middleDrawArea,
                      horizontalFirst: false,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GetData {
  String title, titleNo;
  Color color, colorTitle;
}

class Cases {
  final String caseName;
  int caseNo;
  Color color;

  Cases(this.caseName, this.caseNo, this.color);
}
