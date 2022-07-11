import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/pages/detail_webinar_page.dart';
import 'package:unity_disleksia_platform/provider/database_webinar_provider.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';
import 'package:unity_disleksia_platform/widgets/card_list_webinar.dart';

class WebinarTab extends StatefulWidget {
  const WebinarTab({Key? key}) : super(key: key);

  @override
  State<WebinarTab> createState() => _WebinarTabState();
}

class _WebinarTabState extends State<WebinarTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseWebinarProvider>(
      builder: (context, provider, child) {
        if (provider.state == ResultState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (provider.state == ResultState.HasData) {
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: provider.bookmarks.length,
            padding: const EdgeInsets.only(left: 24, right: 24, top: 32),
            itemBuilder: (context, index) {
              var webinar = provider.bookmarks[index];
              return GestureDetector(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      children: [
                        CardListWebinar(webinar: webinar),
                        SizedBox(
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
        } else if (provider.state == ResultState.NoData) {
          return Center(child: Text(provider.message));
        } else if (provider.state == ResultState.Error) {
          return Center(child: Text(provider.message));
        } else {
          return Center(child: Text(''));
        }
      },
    );
  }
}
