import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/pages/webinars/detail_webinar_page.dart';
import 'package:unity_disleksia_platform/provider/webinar_recent_provider.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';
import 'package:unity_disleksia_platform/widgets/card_carousel_webinar.dart';
import 'package:url_launcher/url_launcher.dart';

class CarouselInspiratifStoryPage extends StatelessWidget {
  const CarouselInspiratifStoryPage({Key? key}) : super(key: key);

  Widget _buildCarousel() {
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200,
          enlargeCenterPage: true,
          autoPlay: true,
          viewportFraction: 1.0,
        ),
        items: [
          GestureDetector(
            onTap: () {
              _launchUrl(Uri.parse(
                  'https://regional.kompas.com/read/2020/01/06/05554441/kisah-ariel-penyandang-disleksia-yang-sukses-raup-puluhan-juta?page=all'));
            },
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  children: [
                    FancyShimmerImage(
                      imageUrl:
                          'https://storage.googleapis.com/udp_bucket/Carousell-berita-2.png',
                      width: 1000,
                      boxFit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          stops: const [0.1, 0.9],
                          colors: [
                            Colors.black.withOpacity(.8),
                            Colors.black.withOpacity(.0)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 24, left: 24, right: 24),
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Kisah Ariel, Penyandang Disleksia yang Sukses Raup Puluhan Juta',
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2,
                                color: neutral100),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _launchUrl(Uri.parse(
                  'https://nova.grid.id/read/05877991/deddy-corbuzier-dan-anaknya-idap-disleksia-yuk-ketahui-tanda-tanda-disleksia-pada-anak-sejak-dini?page=all'));
            },
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  children: [
                    FancyShimmerImage(
                      imageUrl:
                          'https://storage.googleapis.com/udp_bucket/Carousell-berita-1.png',
                      width: 1000,
                      boxFit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          stops: const [0.1, 0.9],
                          colors: [
                            Colors.black.withOpacity(.8),
                            Colors.black.withOpacity(.0)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 24, left: 24, right: 24),
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Deddy Corbuzier dan Anaknya Idap Disleksia',
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2,
                                color: neutral100),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _launchUrl(Uri.parse(
                  'https://www.cnbcindonesia.com/lifestyle/20191010125615-33-105884/kisah-bos-maskapai-virgin-air-justru-sukses-karena-disleksia'));
            },
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  children: [
                    FancyShimmerImage(
                      imageUrl:
                          'https://storage.googleapis.com/udp_bucket/Carousell-berita.png',
                      width: 1000,
                      boxFit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          stops: const [0.1, 0.9],
                          colors: [
                            Colors.black.withOpacity(.8),
                            Colors.black.withOpacity(.0)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 24, left: 24, right: 24),
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Kisah Bos Maskapai Virgin Air, Justru Sukses karena Disleksia',
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2,
                                color: neutral100),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _launchUrl(_url) async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return _buildCarousel();
  }
}
