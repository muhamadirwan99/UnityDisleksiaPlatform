import 'package:flutter/material.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/widgets/myappbar.dart';
import 'package:unity_disleksia_platform/widgets/myflexible_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, isScrolled) {
        return [
          SliverAppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            expandedHeight: 180.0,
            backgroundColor: blue500,
            floating: true,
            snap: false,
            pinned: true,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24 * 2),
                bottomRight: Radius.circular(24 * 2),
              ),
            ),
            title: MyAppBar(),
            flexibleSpace: FlexibleSpaceBar(
              background: MyFlexibleAppBar(),
            ),
          ),
        ];
      },
      body: Center(
        child: Text("home"),
      ),
    );
  }
}
