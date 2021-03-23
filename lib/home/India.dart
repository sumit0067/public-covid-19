import 'package:covid_19/module/indiaModule.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class India extends StatefulWidget {
  @override
  _IndiaState createState() => _IndiaState();
}

class _IndiaState extends State<India> {
  Future<IndiaModule> getCountry() async {
    final response = await http
        .get(Uri.parse('https://disease.sh/v3/covid-19/countries/india'));
    if (response.statusCode == 200) {
      String jsonResponse = response.body;
      return indiaFromJson(jsonResponse);
    } else {
      print('data fail to get');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                'India',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FutureBuilder<IndiaModule>(
              future: getCountry(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.5,
                        crossAxisCount: 2,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 5),
                    children: [
                      DataList(
                          'Cases',
                          snapshot.data.cases.toString(),
                          Colors.orange,
                          snapshot.data.todayCases.toString(),
                          Icons.arrow_upward),
                      DataList(
                          'recovered',
                          snapshot.data.recovered.toString(),
                          Colors.deepPurple,
                          snapshot.data.todayRecovered.toString(),
                          Icons.arrow_upward),
                      DataList(
                          'deaths',
                          snapshot.data.deaths.toString(),
                          Colors.grey,
                          snapshot.data.todayDeaths.toString(),
                          Icons.arrow_upward),
                      DataList(
                          'todayCases',
                          snapshot.data.active.toString(),
                          Colors.pinkAccent,
                          snapshot.data.todayCases.toString(),
                          Icons.arrow_upward)
                    ],
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DataList extends StatelessWidget {
  String title, titleData, titles;
  Color color;
  IconData icon;

  DataList(this.title, this.titleData, this.color, [this.titles, this.icon]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: TextAlign.start,
              style: GoogleFonts.montserrat(
                color: color,
                letterSpacing: 1.2,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                titleData,
                style: GoogleFonts.montserrat(
                  color: color,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.green,
                    size: 12,
                  ),
                  Text(
                    titles,
                    style: GoogleFonts.montserrat(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
