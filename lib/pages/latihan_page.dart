import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/pages/angka_page.dart';
import 'package:unity_disleksia_platform/pages/huruf_page.dart';
import 'package:unity_disleksia_platform/pages/instruksi_page.dart';
import 'package:unity_disleksia_platform/pages/menu_page.dart';

class LatihanPage extends StatelessWidget {
  static const routeName = '/latihanPage';

  const LatihanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Latihan',
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
            "assets/icons/arrow-left.svg",
            color: neutral100,
            height: 32,
            width: 32,
          ),
          onPressed: () {
            Navigator.pushNamed(context, MenuPage.routeName);
          },
        ),
      ),
      backgroundColor: blue500,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hallo, Sahabat 👋", // Headline 2
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.8,
                                color: neutral100),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Ayo kita bermain sambil belajar ",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.5,
                                color: neutral100),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: SvgPicture.asset(
                      "assets/illustrations/latihanhome.svg",
                      width: 142,
                      height: 134,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: new BoxDecoration(
                color: neutral100,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(32),
                  topRight: const Radius.circular(32),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
                child: Column(
                  children: [
                    ElevatedButton(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/icon-angka.svg",
                              color: neutral100,
                              height: 60,
                              width: 60,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              "Materi Angka",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -2.1,
                                    color: neutral100),
                              ),
                            )
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: red600,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(16.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, AngkaPage.routeName);
                      },
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/icon-huruf.svg",
                              color: neutral100,
                              height: 60,
                              width: 60,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              "Materi Huruf",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -2.1,
                                    color: neutral100),
                              ),
                            )
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffFFAA00),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(16.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, HurufPage.routeName);
                      },
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/icon-instruksi.svg",
                              color: neutral100,
                              height: 60,
                              width: 60,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              "Instruksi",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -2.1,
                                    color: neutral100),
                              ),
                            )
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: blue400,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(16.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, InstruksiPage.routeName);
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
