import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/pages/webinars/detail_webinar_page.dart';
import 'package:unity_disleksia_platform/provider/webinar_provider.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';
import 'package:unity_disleksia_platform/widgets/card_list_webinar.dart';
import 'package:unity_disleksia_platform/widgets/skeleton.dart';

class WebinarListPage extends StatelessWidget {
  const WebinarListPage({Key? key}) : super(key: key);

  Widget _buildWebinar() {
    return Consumer<WebinarProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return SizedBox(
            height: 96,
            child: ListView.separated(
              padding: const EdgeInsets.only(right: 24, left: 24, bottom: 14),
              scrollDirection: Axis.vertical,
              itemCount: 6,
              itemBuilder: (context, index) => const Skeleton(
                width: 380,
                height: 96,
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
            ),
          );
        } else if (state.state == ResultState.HasData) {
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: state.result.data.length,
            itemBuilder: (context, index) {
              var webinar = state.result.data[index];
              return GestureDetector(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        CardListWebinar(webinar: webinar),
                        const SizedBox(
                          height: 16,
                        ),
                        const Divider(
                          color: neutral200,
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, DetailWebinarPage.routeName,
                      arguments: webinar);
                },
              );
            },
          );
        } else if (state.state == ResultState.NoData) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 180),
              child: SvgPicture.asset(
                "assets/illustrations/webinar-empty.svg",
              ),
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
