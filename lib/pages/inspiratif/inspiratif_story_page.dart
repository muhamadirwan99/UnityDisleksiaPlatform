import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/pages/webinars/detail_webinar_page.dart';
import 'package:unity_disleksia_platform/provider/webinar_recent_provider.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';
import 'package:unity_disleksia_platform/widgets/card_recent_webinar.dart';
import 'package:unity_disleksia_platform/widgets/skeleton.dart';
import 'package:url_launcher/url_launcher.dart';

class InspiratifStoryPage extends StatelessWidget {
  const InspiratifStoryPage({Key? key}) : super(key: key);

  Widget _buildPage() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
          child: GestureDetector(
            child: Card(
              color: neutral100,
              elevation: 0,
              child: SizedBox(
                height: 85,
                width: 380,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Kisah Ariel, Penyandang Disleksia yang Sukses Raup Puluhan Juta',
                                style: myTextTheme.headline5,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'Kompas.com',
                                style: myTextTheme.caption,
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      flex: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: FancyShimmerImage(
                          imageUrl:
                              'https://storage.googleapis.com/udp_bucket/kisah-2.png',
                          height: 85,
                          width: 85,
                          boxFit: BoxFit.cover,
                          alignment: Alignment.topRight,
                          boxDecoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              _launchUrl(Uri.parse(
                  'https://regional.kompas.com/read/2020/01/06/05554441/kisah-ariel-penyandang-disleksia-yang-sukses-raup-puluhan-juta?page=all'));
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 24, left: 24, bottom: 16),
          child: Divider(
            color: neutral200,
            thickness: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
          child: GestureDetector(
            child: Card(
              color: neutral100,
              elevation: 0,
              child: SizedBox(
                height: 85,
                width: 380,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Deddy Corbuzier dan Anaknya Idap Disleksia',
                                style: myTextTheme.headline5,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'Nova.grid.id',
                                style: myTextTheme.caption,
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      flex: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: FancyShimmerImage(
                          imageUrl:
                              'https://storage.googleapis.com/udp_bucket/kisah-1.png',
                          height: 85,
                          width: 85,
                          boxFit: BoxFit.cover,
                          alignment: Alignment.topRight,
                          boxDecoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              _launchUrl(Uri.parse(
                  'https://nova.grid.id/read/05877991/deddy-corbuzier-dan-anaknya-idap-disleksia-yuk-ketahui-tanda-tanda-disleksia-pada-anak-sejak-dini?page=all'));
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 24, left: 24, bottom: 16),
          child: Divider(
            color: neutral200,
            thickness: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
          child: GestureDetector(
            child: Card(
              color: neutral100,
              elevation: 0,
              child: SizedBox(
                height: 85,
                width: 380,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Kisah Bos Maskapai Virgin Air, Justru Sukses karena Disleksia',
                                style: myTextTheme.headline5,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'cnbcindonesia.com',
                                style: myTextTheme.caption,
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      flex: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: FancyShimmerImage(
                          imageUrl:
                              'https://storage.googleapis.com/udp_bucket/kisah.png',
                          height: 85,
                          width: 85,
                          boxFit: BoxFit.cover,
                          alignment: Alignment.topRight,
                          boxDecoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              _launchUrl(Uri.parse(
                  'https://www.cnbcindonesia.com/lifestyle/20191010125615-33-105884/kisah-bos-maskapai-virgin-air-justru-sukses-karena-disleksia'));
            },
          ),
        ),
      ],
    );
  }

  void _launchUrl(_url) async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return _buildPage();
  }
}
