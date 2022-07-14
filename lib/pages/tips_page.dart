import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/provider/tips_disleksia_provider.dart';
import 'package:unity_disleksia_platform/provider/tips_pembelajaran_provider.dart';
import 'package:unity_disleksia_platform/provider/tips_peningkatan_provider.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';
import 'package:unity_disleksia_platform/widgets/list_tips.dart';

class TipsPage extends StatelessWidget {
  static const routeName = '/tipsPage';

  const TipsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tips & Trik',
          style: myTextTheme.headline5,
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
      body: const TipsList(),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class TipsList extends StatelessWidget {
  const TipsList({Key? key}) : super(key: key);

  SliverPersistentHeader _header(String text) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        minHeight: 76,
        maxHeight: 100,
        child: Container(
          color: blue500,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(24),
            child: Text(
              text,
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0,
                    color: neutral100),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _header('Pembelajaran'),
        SliverList(
          delegate: SliverChildListDelegate(<Widget>[
            _buildTipsPembelajaran(),
          ]),
        ),
        _header('Peningkatan Minat'),
        SliverList(
          delegate: SliverChildListDelegate(<Widget>[
            _buildTipsPeningkatan(),
          ]),
        ),
        _header('Disleksia'),
        SliverList(
          delegate: SliverChildListDelegate(<Widget>[
            _buildTipsDisleksia(),
          ]),
        ),
      ],
    );
  }

  _buildTipsPembelajaran() {
    return Consumer<TipsPembelajaranProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: state.result.data.length,
            itemBuilder: (context, index) {
              var tips = state.result.data[index];
              return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ListTips(tips: tips));
            },
          );
        } else if (state.state == ResultState.NoData) {
          return Center(child: Text(state.message));
        } else if (state.state == ResultState.Error) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text(''));
        }
      },
    );
  }

  _buildTipsPeningkatan() {
    return Consumer<TipsPeningkatanProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: state.result.data.length,
            itemBuilder: (context, index) {
              var tips = state.result.data[index];
              return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ListTips(tips: tips));
            },
          );
        } else if (state.state == ResultState.NoData) {
          return Center(child: Text(state.message));
        } else if (state.state == ResultState.Error) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text(''));
        }
      },
    );
  }

  _buildTipsDisleksia() {
    return Consumer<TipsDisleksiaProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: state.result.data.length,
            itemBuilder: (context, index) {
              var tips = state.result.data[index];
              return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ListTips(tips: tips));
            },
          );
        } else if (state.state == ResultState.NoData) {
          return Center(child: Text(state.message));
        } else if (state.state == ResultState.Error) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text(''));
        }
      },
    );
  }
}
