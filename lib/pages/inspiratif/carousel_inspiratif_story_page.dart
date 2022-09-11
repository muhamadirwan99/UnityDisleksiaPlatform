import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/provider/kisah_provider.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';
import 'package:unity_disleksia_platform/widgets/card_carousel_kisah.dart';
import 'package:url_launcher/url_launcher.dart';

class CarouselInspiratifStoryPage extends StatelessWidget {
  const CarouselInspiratifStoryPage({Key? key}) : super(key: key);

  Widget _buildCarousel() {
    return Consumer<KisahProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          return Padding(
            padding: const EdgeInsets.only(right: 24, left: 24),
            child: CarouselSlider.builder(
              options: CarouselOptions(
                height: 200,
                enlargeCenterPage: true,
                autoPlay: true,
                viewportFraction: 1.0,
              ),
              itemCount: state.result.data.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                var kisah = state.result.data[itemIndex];
                return GestureDetector(
                  onTap: () {
                    _launchUrl(Uri.parse(kisah.link));
                  },
                  child: CardCarouselKisah(kisah: kisah),
                );
              },
            ),
          );
        } else if (state.state == ResultState.NoData) {
          return Center(
            child: SvgPicture.asset(
              "assets/illustrations/noconnection.svg",
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
