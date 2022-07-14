import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/pages/latihan/latihan_huruf_page.dart';

class HurufButton extends StatelessWidget {
  final String value;

  const HurufButton({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      width: 58,
      child: ElevatedButton(
        child: Text(
          value,
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: 0,
                color: neutral100),
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: blue500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, LatihanHurufPage.routeName,
              arguments: value);
        },
      ),
    );
  }
}
