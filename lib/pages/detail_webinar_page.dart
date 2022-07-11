import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/model/webinar_model.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:unity_disleksia_platform/provider/database_webinar_provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
    final Uri _url = Uri.parse(widget.webinar.link);

    return Consumer<DatabaseWebinarProvider>(
        builder: (context, provider, child) {
      return FutureBuilder<bool>(
        future: provider.isBookmarked(widget.webinar.id),
        builder: (context, snapshot) {
          var isBookmarked = snapshot.data ?? false;
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Detail Webinar',
                style: myTextTheme.headline5,
              ),
              titleTextStyle: const TextStyle(color: neutral900),
              elevation: 0,
              backgroundColor: neutral100,
              leading: IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/arrow-left.svg",
                  color: neutral900,
                  height: 32,
                  width: 32,
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
                        style: myTextTheme.headline3,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        dateFormat.format(widget.webinar.date),
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.1,
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
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              height: 56,
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: blue500, width: 2),
                    ),
                    child: isBookmarked
                        ? IconButton(
                            icon: SvgPicture.asset(
                              "assets/icons/bookmark-fill.svg",
                              color: blue500,
                              height: 32,
                              width: 32,
                            ),
                            onPressed: () =>
                                provider.removeBookmark(widget.webinar.id),
                          )
                        : IconButton(
                            icon: SvgPicture.asset(
                              "assets/icons/bookmark.svg",
                              color: neutral900,
                              height: 32,
                              width: 32,
                            ),
                            onPressed: () =>
                                provider.addBookmark(widget.webinar),
                          ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: Container(
                      child: ElevatedButton(
                        onPressed: () {
                          _launchUrl(_url);
                        },
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Daftar",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.2,
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
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }

  void _launchUrl(_url) async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }
}
