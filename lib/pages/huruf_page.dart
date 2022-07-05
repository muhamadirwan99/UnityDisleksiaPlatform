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
      ),
      backgroundColor: blue500,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
              child: SvgPicture.asset(
                "assets/illustrations/huruf.svg",
                width: 380,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
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
                    Text(
                      "Pilih Huruf",
                      style: myTextTheme.headline3,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HurufButton(value: 'A'),
                        HurufButton(value: 'B'),
                        HurufButton(value: 'C'),
                        HurufButton(value: 'D'),
                        HurufButton(value: 'E'),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HurufButton(value: 'F'),
                        HurufButton(value: 'G'),
                        HurufButton(value: 'H'),
                        HurufButton(value: 'I'),
                        HurufButton(value: 'J'),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HurufButton(value: 'K'),
                        HurufButton(value: 'L'),
                        HurufButton(value: 'M'),
                        HurufButton(value: 'N'),
                        HurufButton(value: 'O'),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HurufButton(value: 'P'),
                        HurufButton(value: 'Q'),
                        HurufButton(value: 'R'),
                        HurufButton(value: 'S'),
                        HurufButton(value: 'T'),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HurufButton(value: 'U'),
                        HurufButton(value: 'V'),
                        HurufButton(value: 'W'),
                        HurufButton(value: 'X'),
                        HurufButton(value: 'Y'),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: HurufButton(value: 'Z')),
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
