import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/pages/webinars/detail_webinar_page.dart';
import 'package:unity_disleksia_platform/provider/webinar_provider.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';
import 'package:unity_disleksia_platform/widgets/card_list_webinar.dart';

class WebinarListPage extends StatelessWidget {
  const WebinarListPage({Key? key}) : super(key: key);

  Widget _buildWebinar() {
    return Consumer<WebinarProvider>(
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
              var webinar = state.result.data[index];
              return GestureDetector(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
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
          return Center(child: Text(state.message));
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
