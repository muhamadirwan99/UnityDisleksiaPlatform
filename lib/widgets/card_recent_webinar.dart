import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/model/webinar_model.dart';

class CardRecentWebinar extends StatefulWidget {
  final Webinar webinar;

  const CardRecentWebinar({Key? key, required this.webinar}) : super(key: key);

  @override
  State<CardRecentWebinar> createState() => _CardRecentWebinarState();
}

class _CardRecentWebinarState extends State<CardRecentWebinar> {
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
    const String _baseUrl = 'http://34.128.78.90:5000/';
    return SizedBox(
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
          const SizedBox(
            width: 16,
          ),
          Expanded(
            flex: 0,
            child: Container(
              height: 85,
              width: 85,
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
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
