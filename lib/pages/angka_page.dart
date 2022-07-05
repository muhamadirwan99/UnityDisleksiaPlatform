import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/widgets/angka_button.dart';
import 'package:unity_disleksia_platform/widgets/huruf_button.dart';

class AngkaPage extends StatelessWidget {
  static const routeName = '/angkaPage';

  const AngkaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Materi Angka',
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
                "assets/illustrations/angka.svg",
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
                      "Pilih Angka",
                      style: myTextTheme.headline3,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AngkaButton(value: '1'),
                        AngkaButton(value: '2'),
                        AngkaButton(value: '3'),
                        AngkaButton(value: '4'),
                        AngkaButton(value: '5'),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AngkaButton(value: '6'),
                        AngkaButton(value: '7'),
                        AngkaButton(value: '8'),
                        AngkaButton(value: '9'),
                        AngkaButton(value: '10'),
                      ],
                    )
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
