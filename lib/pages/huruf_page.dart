import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/widgets/custom_button.dart';

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
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
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
                        CustomButton(value: 'A'),
                        CustomButton(value: 'B'),
                        CustomButton(value: 'C'),
                        CustomButton(value: 'D'),
                        CustomButton(value: 'E'),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(value: 'F'),
                        CustomButton(value: 'G'),
                        CustomButton(value: 'H'),
                        CustomButton(value: 'I'),
                        CustomButton(value: 'J'),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(value: 'K'),
                        CustomButton(value: 'L'),
                        CustomButton(value: 'M'),
                        CustomButton(value: 'N'),
                        CustomButton(value: 'O'),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(value: 'P'),
                        CustomButton(value: 'Q'),
                        CustomButton(value: 'R'),
                        CustomButton(value: 'S'),
                        CustomButton(value: 'T'),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(value: 'U'),
                        CustomButton(value: 'V'),
                        CustomButton(value: 'W'),
                        CustomButton(value: 'X'),
                        CustomButton(value: 'Y'),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: CustomButton(value: 'Z')),
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
