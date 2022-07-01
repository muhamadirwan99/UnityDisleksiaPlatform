import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/model/webinar_model.dart';
import 'package:intl/date_symbol_data_local.dart';

class DetailWebinarPage extends StatefulWidget {
  static const routeName = '/detailWebinarPage';

  final Webinar webinar;

  const DetailWebinarPage({required this.webinar});

  @override
  State<DetailWebinarPage> createState() => _DetailWebinarPageState();
}

class _DetailWebinarPageState extends State<DetailWebinarPage> {
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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Webinar',
          style: myTextTheme.headline3,
        ),
        titleTextStyle: const TextStyle(color: neutral900),
        elevation: 0,
        backgroundColor: neutral100,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: neutral900,
            size: 32,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 24, left: 24),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    _baseUrl + widget.webinar.thumbnail,
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.webinar.name,
                    style: myTextTheme.headline2,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    dateFormat.format(widget.webinar.date),
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.3,
                          color: blue800),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  widget.webinar.desc,
                  style: myTextTheme.bodyText1,
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Daftar",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0,
                                color: neutral100),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset(
                          "assets/icons/send.svg",
                          color: neutral100,
                          height: 24,
                          width: 24,
                        ),
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: blue500,
                    minimumSize: const Size.fromHeight(50),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8),
                    ),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
