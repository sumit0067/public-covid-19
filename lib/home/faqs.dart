import 'package:covid_19/dataSourse.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQ extends StatefulWidget {
  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
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
        title: Text('FAQS'),
      ),
      body: ListView.builder(
        itemCount: DataSource.questionAnswers.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              DataSource.questionAnswers[index]['question'],
              style: GoogleFonts.montserrat(
                color: Colors.lightBlue,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  DataSource.questionAnswers[index]['answer'],
                  style: GoogleFonts.montserrat(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600   ,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
