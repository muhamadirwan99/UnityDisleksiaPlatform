import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/pages/instruksi_page.dart';

class LatihanHurufPage extends StatelessWidget {
  static const routeName = '/latihanHurufPage';

  final String value;

  const LatihanHurufPage({required this.value});

  @override
  Widget build(BuildContext context) {
    print(value);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Huruf',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.8,
                color: neutral100),
          ),
        ),
        titleTextStyle: const TextStyle(color: neutral900),
        elevation: 0,
        backgroundColor: blue500,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/nav.svg",
            color: neutral100,
            height: 32,
            width: 32,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/information.svg",
              color: neutral100,
              height: 32,
              width: 32,
            ),
            onPressed: () {
              Navigator.pushNamed(context, InstruksiPage.routeName);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
        child: Column(
          children: [
            Container(
              height: 300,
              width: 380,
              decoration: new BoxDecoration(
                color: blue100,
                borderRadius: new BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Contoh",
                        style: myTextTheme.headline3,
                      ),
                    ),
                    Text(
                      value,
                      style: myTextTheme.headline1,
                    ),
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
