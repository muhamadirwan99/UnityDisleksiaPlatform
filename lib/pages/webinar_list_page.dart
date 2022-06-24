import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/provider/webinar_provider.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';
import 'package:unity_disleksia_platform/widgets/card_video.dart';
import 'package:unity_disleksia_platform/widgets/card_webinar.dart';

class WebinarListPage extends StatelessWidget {
  Widget _buildWebinar() {
    return Consumer<WebinarProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          return SizedBox(
            height: 255.0,
            width: 182.0,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 32, right: 16),
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.result.data.length,
              itemBuilder: (context, index) {
                var webinar = state.result.data[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CardWebinar(webinar: webinar)),
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
