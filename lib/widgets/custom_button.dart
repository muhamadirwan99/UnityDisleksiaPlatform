import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unity_disleksia_platform/common/style.dart';

class CustomButton extends StatelessWidget {
  final String value;

  const CustomButton({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 52,
      child: ElevatedButton(
        child: Text(value, style: myTextTheme.headline1),
        style: ElevatedButton.styleFrom(
          primary: blue500,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
