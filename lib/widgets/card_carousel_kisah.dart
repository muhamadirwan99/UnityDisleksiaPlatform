import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/model/kisah_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

class CardCarouselKisah extends StatelessWidget {
  final Kisah kisah;

  const CardCarouselKisah({Key? key, required this.kisah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String _baseUrl = 'http://34.101.40.203:5000/';
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            FancyShimmerImage(
              imageUrl: _baseUrl + kisah.thumbnail,
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
              padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  kisah.name,
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
