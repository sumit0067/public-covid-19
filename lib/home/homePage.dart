import 'package:covid_19/dataSourse.dart';
import 'package:covid_19/home/India.dart';
import 'package:covid_19/home/search.dart';
import 'package:covid_19/home/faqs.dart';
import 'package:covid_19/home/world.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covide-19'),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              color: Colors.orange[400],
              padding: EdgeInsets.all(20),
              child: Text(
                DataSource.quote,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            World(),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Search(),
                    ));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Country',
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_outlined,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ),
            India(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FAQ(),
                    ));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: Theme.of(context).primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'FAQ',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                launch('https://covid19responsefund.org');
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: Theme.of(context).primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Donate',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '(open WHO website)',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.chevron_right_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                launch(
                    'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: Theme.of(context).primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Myth Busters',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '(open WHO website)',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.chevron_right_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'We Are Together In The Fight',
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
