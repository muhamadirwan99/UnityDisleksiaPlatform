import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/pages/detail_webinar_page.dart';
import 'package:unity_disleksia_platform/provider/webinar_provider.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';
import 'package:unity_disleksia_platform/widgets/card_webinar.dart';

class WebinarRecentPage extends StatelessWidget {
  Widget _buildWebinar() {
    return Consumer<WebinarProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          return SizedBox(
            height: 270.0,
            width: 182.0,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 20, right: 16),
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.result.data.length,
              itemBuilder: (context, index) {
                var webinar = state.result.data[index];
                return GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CardWebinar(webinar: webinar)),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, DetailWebinarPage.routeName,
                        arguments: webinar);
                  },
                );
              },
            ),
          );
        } else if (state.state == ResultState.NoData) {
          return Center(child: Text(state.message));
        } else if (state.state == ResultState.Error) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text(''));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildWebinar();
  }
}
