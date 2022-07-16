import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/pages/bookmarks/bookmark_page.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0, top: 0, left: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(
              "Hallo, Sahabat 👋",
              style: myTextTheme.headline1,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, BookmarkPage.routeName);
            },
            icon: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: blue600,
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/icons/bookmark-variation.svg",
                  color: neutral100,
                  height: 16,
                  width: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
