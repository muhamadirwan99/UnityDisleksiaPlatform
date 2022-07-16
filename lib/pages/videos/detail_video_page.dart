import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/model/video_model.dart';
import 'package:unity_disleksia_platform/pages/bookmarks/bookmark_page.dart';
import 'package:unity_disleksia_platform/widgets/card_modul.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../provider/database_video_provider.dart';

class DetailVideoPage extends StatefulWidget {
  static const routeName = '/detailVideoPage';

  final Video video;

  const DetailVideoPage({Key? key, required this.video}) : super(key: key);

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
    return Consumer<DatabaseVideoProvider>(
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
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
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
                              onPressed: () {
                                provider.addBookmark(widget.video);
                                final snackBar = SnackBar(
                                  backgroundColor: blue100,
                                  behavior: SnackBarBehavior.floating,
                                  content: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Berhasil ditambahkan',
                                        style: GoogleFonts.roboto(
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.5,
                                              color: neutral900),
                                        ),
                                      ),
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0.0,
                                            shadowColor: Colors.transparent,
                                            primary: blue100,
                                            onPrimary: neutral400,
                                          ),
                                          onPressed: () {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();

                                            Navigator.pushNamed(
                                                context, BookmarkPage.routeName,
                                                arguments: 0);
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Lihat',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.roboto(
                                                    textStyle: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        letterSpacing: 0.2,
                                                        color: blue500),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              SvgPicture.asset(
                                                "assets/icons/chevron-right.svg",
                                                color: blue500,
                                                height: 24,
                                                width: 24,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }),
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
                          const SizedBox(
                            height: 32,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.video.name,
                              style: myTextTheme.headline3,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            widget.video.desc,
                            style: myTextTheme.bodyText1,
                          ),
                          const SizedBox(
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
