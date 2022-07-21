import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/model/webinar_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

class CardCarouselWebinar extends StatelessWidget {
  final Webinar webinar;

  const CardCarouselWebinar({Key? key, required this.webinar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String _baseUrl = 'http://34.128.78.90:5000/';
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            FancyShimmerImage(
              imageUrl: _baseUrl + webinar.thumbnail,
              width: 1000,
              boxFit: BoxFit.cover,
            ),
            // CachedNetworkImage(
            //   imageUrl: _baseUrl + webinar.thumbnail,
            //   imageBuilder: (context, imageProvider) => Container(
            //     width: 1000,
            //     decoration: BoxDecoration(
            //       image: DecorationImage(
            //         image: imageProvider,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            //   placeholder: (context, url) => Container(
            //     width: 1000,
            //     color: neutral200,
            //   ),
            // ),

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
              padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  webinar.name,
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
    );
  }
}
