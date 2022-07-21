import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/pages/webinars/detail_webinar_page.dart';
import 'package:unity_disleksia_platform/provider/webinar_recent_provider.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';
import 'package:unity_disleksia_platform/widgets/card_recent_webinar.dart';
import 'package:unity_disleksia_platform/widgets/skeleton.dart';

class WebinarRecentPage extends StatelessWidget {
  const WebinarRecentPage({Key? key}) : super(key: key);

  Widget _buildWebinar() {
    return Consumer<WebinarRecentProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return SizedBox(
            height: 96,
            child: ListView.separated(
              padding: const EdgeInsets.only(left: 24, right: 24),
              scrollDirection: Axis.vertical,
              itemCount: 3,
              itemBuilder: (context, index) => Skeleton(
                width: 380,
                height: 96,
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 24),
            ),
          );
        } else if (state.state == ResultState.HasData) {
          return SizedBox(
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 24, right: 24),
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: state.result.data.length,
              itemBuilder: (context, index) {
                var webinar = state.result.data[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: GestureDetector(
                    child: CardRecentWebinar(webinar: webinar),
                    onTap: () {
                      Navigator.pushNamed(context, DetailWebinarPage.routeName,
                          arguments: webinar);
                    },
                  ),
                );
              },
            ),
          );
        } else if (state.state == ResultState.NoData) {
          return Center(
            child: SvgPicture.asset(
              "assets/illustrations/webinar-empty.svg",
            ),
          );
        } else if (state.state == ResultState.Error) {
          return Center(
            child: SvgPicture.asset(
              "assets/illustrations/noconnection.svg",
            ),
          );
        } else {
          return const Center(child: Text(''));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildWebinar();
  }
}
