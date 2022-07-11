import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/model/webinar_model.dart';

class CardListWebinar extends StatefulWidget {
  final Webinar webinar;

  const CardListWebinar({required this.webinar});

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
    dateFormat = new DateFormat.yMMMMd('id');
    timeFormat = new DateFormat.Hms('id');
  }

  @override
  Widget build(BuildContext context) {
    const String _baseUrl = 'http://34.128.78.90:5000/';
    return Container(
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
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.webinar.name,
                    style: myTextTheme.headline5,
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
          SizedBox(
            width: 16,
          ),
          Expanded(
            flex: 0,
            child: Container(
              height: 85,
              width: 85,
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(_baseUrl + widget.webinar.thumbnail),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
