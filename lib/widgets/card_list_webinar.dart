import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/model/webinar_model.dart';

class CardListWebinar extends StatefulWidget {
  final Webinar webinar;

  const CardListWebinar({Key? key, required this.webinar}) : super(key: key);

  @override
  State<CardListWebinar> createState() => _CardListWebinarState();
}

class _CardListWebinarState extends State<CardListWebinar> {
  late DateFormat dateFormat;
  late DateFormat timeFormat;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('id');
    timeFormat = DateFormat.Hms('id');
  }

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
                        widget.webinar.name,
                        style: myTextTheme.headline5,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        dateFormat.format(widget.webinar.date),
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
                  imageUrl: _baseUrl + widget.webinar.thumbnail,
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
