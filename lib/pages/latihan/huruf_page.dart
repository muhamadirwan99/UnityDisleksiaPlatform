import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/widgets/huruf_button.dart';

class HurufPage extends StatelessWidget {
  static const routeName = '/hurufPage';

  const HurufPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Materi Huruf',
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
                          "Ayo kita bermain sambil belajar mengenal huruf",
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
                      "assets/illustrations/huruf.svg",
                      width: 107,
                      height: 118,
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
              width: MediaQuery.of(context).size.width,
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
                    Text(
                      "Pilih Huruf",
                      style: myTextTheme.headline3,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        HurufButton(value: 'A'),
                        HurufButton(value: 'B'),
                        HurufButton(value: 'C'),
                        HurufButton(value: 'D'),
                        HurufButton(value: 'E'),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        HurufButton(value: 'F'),
                        HurufButton(value: 'G'),
                        HurufButton(value: 'H'),
                        HurufButton(value: 'I'),
                        HurufButton(value: 'J'),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        HurufButton(value: 'K'),
                        HurufButton(value: 'L'),
                        HurufButton(value: 'M'),
                        HurufButton(value: 'N'),
                        HurufButton(value: 'O'),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        HurufButton(value: 'P'),
                        HurufButton(value: 'Q'),
                        HurufButton(value: 'R'),
                        HurufButton(value: 'S'),
                        HurufButton(value: 'T'),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        HurufButton(value: 'U'),
                        HurufButton(value: 'V'),
                        HurufButton(value: 'W'),
                        HurufButton(value: 'X'),
                        HurufButton(value: 'Y'),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: const HurufButton(value: 'Z')),
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
