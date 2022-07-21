import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/pages/videos/detail_video_page.dart';
import 'package:unity_disleksia_platform/provider/search_video_provider.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';
import 'package:unity_disleksia_platform/widgets/card_list_video.dart';

class VideoSearchPage extends StatefulWidget {
  static const routeName = '/videoSearchPage';

  const VideoSearchPage({Key? key}) : super(key: key);

  @override
  State<VideoSearchPage> createState() => _VideoSearchPageState();
}

class _VideoSearchPageState extends State<VideoSearchPage> {
  final _searchController = TextEditingController();

  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 34,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 24, top: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 0,
                  child: IconButton(
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
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Consumer<SearchVideoProvider>(
                    builder: (context, state, _) {
                      return TextField(
                        controller: _searchController,
                        onChanged: (String value) {
                          setState(() {
                            name = value;
                          });
                          if (value != '') {
                            state.fetchSearchVideo(name: name);
                          }
                        },
                        cursorColor: neutral900,
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.5,
                              color: neutral900),
                        ),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 12,
                              top: 12,
                              left: 16,
                              right: 16.0,
                            ),
                            child: SizedBox(
                              height: 24,
                              width: 24,
                              child: SvgPicture.asset(
                                "assets/icons/search.svg",
                                color: neutral900,
                              ),
                            ),
                          ),
                          hintText: "Cari Video", //body 1
                          hintStyle: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.5,
                                color: neutral500),
                          ),
                          filled: true,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: neutral400, width: 1),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: blue400, width: 1),
                          ),
                          focusColor: neutral900,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: name.isEmpty
                ? Center(
                    child: SvgPicture.asset(
                      "assets/illustrations/video-search.svg",
                    ),
                  )
                : Padding(
                    padding:
                        const EdgeInsets.only(right: 24, left: 24, bottom: 14),
                    child: Consumer<SearchVideoProvider>(
                      builder: (context, state, _) {
                        if (state.state == ResultState.Loading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state.state == ResultState.HasData) {
                          return ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: state.result!.data.length,
                            itemBuilder: (context, index) {
                              var video = state.result!.data[index];
                              return GestureDetector(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: Column(
                                      children: [
                                        CardListVideo(video: video),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, DetailVideoPage.routeName,
                                      arguments: video);
                                },
                              );
                            },
                          );
                        } else if (state.state == ResultState.NoData) {
                          return Center(
                            child: SvgPicture.asset(
                              "assets/illustrations/video-search-notfound.svg",
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
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
