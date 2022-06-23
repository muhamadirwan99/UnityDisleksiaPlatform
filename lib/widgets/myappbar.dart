import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unity_disleksia_platform/common/style.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0, top: 0, left: 0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Hallo, Sahabat 👋",
              style: myTextTheme.headline1,
            ),
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: blue600,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/icons/notification.svg",
                      color: neutral100,
                      height: 16,
                      width: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: blue600,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/icons/bookmark.svg",
                      color: neutral100,
                      height: 16,
                      width: 16,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
