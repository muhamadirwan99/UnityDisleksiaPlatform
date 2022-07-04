import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unity_disleksia_platform/common/style.dart';

class BookmarkPage extends StatelessWidget {
  static const routeName = '/bookmarkPage';

  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Bookmark',
            style: myTextTheme.headline3,
          ),
          titleTextStyle: const TextStyle(color: neutral900),
          elevation: 0,
          backgroundColor: neutral100,
          leading: IconButton(
            icon: SvgPicture.asset(
              "assets/icons/arrow-left.svg",
              color: neutral900,
              height: 32,
              width: 32,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Text("bookmark page"),
        ));
  }
}
