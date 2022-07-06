import 'package:appinio_code_challenge/data/mock_data/mock_resume_data.dart';
import 'package:appinio_code_challenge/data/models/resume_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

/// my resume tab
class ResumeTab extends StatelessWidget {
  ResumeTab({Key? key}) : super(key: key);
  final ResumeData data = ResumeData.fromJson(mockResumeData);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
            left: 8, top: MediaQuery.of(context).size.height * 0.1),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(context),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                child: Text(
                  "Personal Info",
                  style: GoogleFonts.questrial(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    _buildItemFiled("Phone", data.phone, context),
                    const Text('|'),
                    _buildItemFiled("Email", data.email, context),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: _buildItemFiled("Address", data.address, context),
              ),
              _buildHyperLinkFiles("LinkedIn", data.linkedIn, context),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    _buildItemFiled("Sex", data.sex, context),
                    const Text('|'),
                    _buildItemFiled("Date of birth", data.birthDate, context),
                  ],
                ),
              ),
            ]),
      );

  Widget _buildItemFiled(String title, String value, BuildContext context) =>
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Text(
              "$title: ",
              style: GoogleFonts.questrial(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.height * 0.013,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              value,
              style: GoogleFonts.questrial(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.height * 0.013,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      );

  Widget _buildImage(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.5),
          child: Image.asset(
            'assets/me.jpg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.width * 0.35,
          ),
        ),
      );

  Widget _buildHyperLinkFiles(
          String title, HyperLink link, BuildContext context) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
        child: Row(
          children: [
            Text(
              "$title: ",
              style: GoogleFonts.questrial(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.height * 0.013,
                fontWeight: FontWeight.normal,
              ),
            ),
            GestureDetector(
              onTap: () => _launchUrl(link.url),
              child: Text(
                link.title,
                style: GoogleFonts.questrial(
                  color: Colors.blue,
                  fontSize: MediaQuery.of(context).size.height * 0.013,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      );

  void _launchUrl(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }
}
