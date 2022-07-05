import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/pages/latihan_angka_page.dart';

class AngkaButton extends StatelessWidget {
  final String value;

  const AngkaButton({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, LatihanAngkaPage.routeName,
              arguments: value);
        },
      ),
    );
  }
}
