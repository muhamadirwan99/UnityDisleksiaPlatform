import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/model/kisah_model.dart';

class CardKisah extends StatelessWidget {
  final Kisah kisah;

  const CardKisah({Key? key, required this.kisah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String _baseUrl = 'http://34.101.97.232:5000/';

    return Card(
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
                        kisah.name,
                        style: myTextTheme.headline5,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        kisah.sumber,
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
                  imageUrl: _baseUrl + kisah.thumbnail,
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
    );
  }
}
