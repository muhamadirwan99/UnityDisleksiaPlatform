import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/pages/videos/detail_video_page.dart';
import 'package:unity_disleksia_platform/pages/videos/video_menu_page.dart';
import 'package:unity_disleksia_platform/provider/database_video_provider.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';
import 'package:unity_disleksia_platform/widgets/card_list_video.dart';

class VideoTab extends StatefulWidget {
  const VideoTab({Key? key}) : super(key: key);

  @override
  State<VideoTab> createState() => _VideoTabState();
}

class _VideoTabState extends State<VideoTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseVideoProvider>(
      builder: (context, provider, child) {
        if (provider.state == ResultState.Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (provider.state == ResultState.HasData) {
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: provider.bookmarks.length,
            padding: const EdgeInsets.only(left: 24, right: 24, top: 32),
            itemBuilder: (context, index) {
              var video = provider.bookmarks[index];
              return GestureDetector(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      children: [
                        CardListVideo(video: video),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, DetailVideoPage.routeName,
                      arguments: video);
                },
              );
            },
          );
        } else if (provider.state == ResultState.NoData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/illustrations/video-bookmark-empty.svg",
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, VideoMenuPage.routeName);
                },
                child: Text(
                  "Tambahkan Video Pembelajaran?",
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.2,
                        color: blue500),
                  ),
                ),
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ],
          );
        } else if (provider.state == ResultState.Error) {
          return Center(child: Text(provider.message));
        } else {
          return const Center(child: Text(''));
        }
      },
    );
  }
}
