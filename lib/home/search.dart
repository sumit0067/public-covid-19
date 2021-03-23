import 'package:covid_19/home/countryDetails.dart';
import 'package:covid_19/module/CountryModule.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Future<List<Welcome>> getAllCountry() async {
    final response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries'));
    if (response.statusCode == 200) {
      String jsonResponse = response.body;
      return welcomeFromJson(jsonResponse);
    } else {
      print('data fail to get');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.chevron_left_rounded),
        ),
        title: Text('Search'),
      ),
      body: Container(
        child: FutureBuilder<List<Welcome>>(
          future: getAllCountry(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      var cases = snapshot.data[index].cases;
                      var todayCases = snapshot.data[index].todayCases;
                      var deaths = snapshot.data[index].deaths;
                      var todayDeaths = snapshot.data[index].todayDeaths;
                      var recovered = snapshot.data[index].recovered;
                      var todayRecovered = snapshot.data[index].todayRecovered;
                      var active = snapshot.data[index].active;
                      var critical = snapshot.data[index].critical;
                      var tests = snapshot.data[index].tests;
                      var population = snapshot.data[index].population;
                      var image = snapshot.data[index].countryInfo.flag;
                      var countryName = snapshot.data[index].country;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CountryDetails(
                            countryName: countryName,
                            image: image,
                            population: population,
                            tests: tests,
                            critical: critical,
                            active: active,
                            todayRecovered: todayRecovered,
                            recovered: recovered,
                            todayDeaths: todayDeaths,
                            todayCases: todayCases,
                            cases: cases,
                            deaths: deaths,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(snapshot
                                          .data[index].countryInfo.flag))),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: Container(
                                child: Text(
                                  snapshot.data[index].country,
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
