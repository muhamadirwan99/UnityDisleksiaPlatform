import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/model/webinar_model.dart';

class CardWebinar extends StatefulWidget {
  final Webinar webinar;

  const CardWebinar({Key? key, required this.webinar}) : super(key: key);

  @override
  State<CardWebinar> createState() => _CardWebinarState();
}

class _CardWebinarState extends State<CardWebinar> {
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
      height: 210.0,
      width: 182.0,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 166,
                height: 166,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(_baseUrl + widget.webinar.thumbnail),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.webinar.name,
                style: myTextTheme.headline5,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  dateFormat.format(widget.webinar.date),
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0,
                        color: blue800),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        elevation: 3,
      ),
    );
  }
}
