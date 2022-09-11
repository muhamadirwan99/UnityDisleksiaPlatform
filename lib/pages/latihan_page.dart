import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/pages/latihan/angka_page.dart';
import 'package:unity_disleksia_platform/pages/latihan/huruf_page.dart';
import 'package:unity_disleksia_platform/pages/latihan/instruksi_page.dart';

class LatihanPage extends StatelessWidget {
  static const routeName = '/latihanPage';

  const LatihanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Latihan',
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.2,
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
            Navigator.pop(context);
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
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0,
                                color: neutral100),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Ayo kita bermain sambil belajar ",
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                                color: neutral100),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset(
                      "assets/illustrations/latihanhome.svg",
                      width: 146,
                      height: 134,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: neutral100,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
                child: Column(
                  children: [
                    ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/icon-angka.svg",
                              color: neutral100,
                              height: 60,
                              width: 60,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Materi Angka",
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0,
                                          color: neutral100),
                                    ),
                                  ),
                                  Text(
                                    "Belajar Mengenal dan Menulis Angka",
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.25,
                                          color: neutral100),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: red600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, AngkaPage.routeName);
                      },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/icon-huruf.svg",
                              color: neutral100,
                              height: 60,
                              width: 60,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Materi Huruf",
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0,
                                          color: neutral100),
                                    ),
                                  ),
                                  Text(
                                    "Belajar Mengenal dan Menulis Huruf",
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.25,
                                          color: neutral100),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xffFFAA00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, HurufPage.routeName);
                      },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/icon-instruksi.svg",
                              color: neutral100,
                              height: 60,
                              width: 60,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Instruksi",
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0,
                                          color: neutral100),
                                    ),
                                  ),
                                  Text(
                                    "Informasi cara bermain",
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.25,
                                          color: neutral100),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: blue400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
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
