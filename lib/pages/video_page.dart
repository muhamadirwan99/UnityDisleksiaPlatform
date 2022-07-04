import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/api/api_service.dart';
import 'package:unity_disleksia_platform/pages/home_page.dart';
import 'package:unity_disleksia_platform/pages/menu_page.dart';
import 'package:unity_disleksia_platform/pages/video_list_page.dart';
import 'package:unity_disleksia_platform/provider/video_provider.dart';

import '../utils/result_state.dart';
import '../widgets/card_list_video.dart';
import 'detail_video_page.dart';

class VideoPage extends StatefulWidget {
  static const routeName = '/videoPage';

  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Video',
          style: myTextTheme.headline3,
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
            Navigator.pushNamed(context, MenuPage.routeName);
          },
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16, right: 24, left: 24, bottom: 14),
                  child: ChangeNotifierProvider<VideoProvider>(
                    create: (_) => VideoProvider(apiService: ApiService()),
                    child: Consumer<VideoProvider>(
                      builder: (context, state, _) {
                        if (state.state == ResultState.Loading) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state.state == ResultState.HasData) {
                          List<dynamic> listData = state.result.data;

                          return Column(
                            children: [
                              TextField(
                                onChanged: ((value) {
                                  final suggestions =
                                      state.result.data.where((video) {
                                    final videoTitle = video.name.toLowerCase();
                                    final input = value.toLowerCase();
                                    return videoTitle.contains(input);
                                  }).toList();
                                }),
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.6,
                                      color: neutral500),
                                ),
                                decoration: InputDecoration(
                                  hintText: "Pencarian",
                                  hintStyle: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: -0.6,
                                        color: neutral500),
                                  ),
                                  prefixIcon: Icon(Icons.search),
                                  prefixIconColor: neutral500,
                                  filled: true,
                                  fillColor: neutral100,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              ListView.builder(
                                physics: const ClampingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listData.length,
                                itemBuilder: (context, index) {
                                  var video = listData[index];

                                  return GestureDetector(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: CardListVideo(video: video),
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, DetailVideoPage.routeName,
                                          arguments: video);
                                    },
                                  );
                                },
                              ),
                            ],
                          );
                        } else if (state.state == ResultState.NoData) {
                          return Center(child: Text(state.message));
                        } else if (state.state == ResultState.Error) {
                          return Center(child: Text(state.message));
                        } else {
                          return Center(child: Text(''));
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
