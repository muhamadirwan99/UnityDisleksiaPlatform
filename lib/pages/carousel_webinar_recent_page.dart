import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/pages/detail_webinar_page.dart';
import 'package:unity_disleksia_platform/provider/webinar_recent_provider.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';
import 'package:unity_disleksia_platform/widgets/card_carousel_webinar.dart';
import 'package:unity_disleksia_platform/widgets/card_recent_webinar.dart';

class CarouselWebinarRecentPage extends StatelessWidget {
  Widget _buildCarouselWebinar() {
    return Consumer<WebinarRecentProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(child: CircularProgressIndicator());
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
                var webinar = state.result.data[itemIndex];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, DetailWebinarPage.routeName,
                        arguments: webinar);
                  },
                  child: CardCarouselWebinar(webinar: webinar),
                );
              },
            ),
          );
        } else if (state.state == ResultState.NoData) {
          return Center(
            child: SvgPicture.asset(
              "assets/illustrations/webinar-empty.svg",
            ),
          );
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
    return _buildCarouselWebinar();
  }
}
