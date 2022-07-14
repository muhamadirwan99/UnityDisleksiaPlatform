import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/model/tips_model.dart';

class ListTips extends StatelessWidget {
  final Tips tips;

  const ListTips({Key? key, required this.tips}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        tips.name,
        style: GoogleFonts.roboto(
          textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.2,
              color: neutral900),
        ),
      ),
      contentPadding:
          const EdgeInsets.only(bottom: 8, left: 24, right: 24, top: 12),
      subtitle: Container(
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          tips.desc,
          style: myTextTheme.bodyText2,
        ),
      ),
      isThreeLine: true,
    );
  }
}
