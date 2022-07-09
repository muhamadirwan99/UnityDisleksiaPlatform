import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/model/video_model.dart';
import 'package:unity_disleksia_platform/widgets/card_modul.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../provider/database_provider.dart';

class DetailVideoPage extends StatefulWidget {
  static const routeName = '/detailVideoPage';

  final Video video;

  const DetailVideoPage({required this.video});

  @override
  State<DetailVideoPage> createState() => _DetailVideoPageState();
}

class _DetailVideoPageState extends State<DetailVideoPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    var url = "https://www.youtube.com/watch?v=" + widget.video.idYt;

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        mute: false,
        loop: false,
        autoPlay: true,
      ),
    );
  }

  @override
  void deactivate() {
    _controller.pause();

    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
            future: provider.isBookmarked(widget.video.id),
            builder: (context, snapshot) {
              var isBookmarked = snapshot.data ?? false;
              return YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: _controller,
                ),
                builder: (context, player) => Scaffold(
                  appBar: AppBar(
                    title: Text(
                      'Detail Video',
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
                        Navigator.pop(context);
                      },
                    ),
                    actions: [
                      isBookmarked
                          ? IconButton(
                              icon: SvgPicture.asset(
                                "assets/icons/bookmark-fill.svg",
                                color: blue500,
                                height: 32,
                                width: 32,
                              ),
                              onPressed: () =>
                                  provider.removeBookmark(widget.video.id),
                            )
                          : IconButton(
                              icon: SvgPicture.asset(
                                "assets/icons/bookmark.svg",
                                color: neutral900,
                                height: 32,
                                width: 32,
                              ),
                              onPressed: () =>
                                  provider.addBookmark(widget.video),
                            ),
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 24, right: 24, top: 16),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: player,
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.video.name,
                              style: myTextTheme.headline2,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            widget.video.desc,
                            style: myTextTheme.bodyText1,
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          CardModul(video: widget.video),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
