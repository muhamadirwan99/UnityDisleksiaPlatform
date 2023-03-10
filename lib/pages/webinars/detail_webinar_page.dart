import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/model/webinar_model.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:unity_disleksia_platform/pages/bookmarks/bookmark_page.dart';
import 'package:unity_disleksia_platform/provider/database_webinar_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailWebinarPage extends StatefulWidget {
  static const routeName = '/detailWebinarPage';

  final Webinar webinar;

  const DetailWebinarPage({Key? key, required this.webinar}) : super(key: key);

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
    dateFormat = DateFormat.yMMMMd('id');
    timeFormat = DateFormat.Hms('id');
  }

  @override
  Widget build(BuildContext context) {
    const String _baseUrl = 'http://34.101.97.232:5000/';
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
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  Navigator.pop(context);
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 24, left: 24),
                child: Column(
                  children: [
                    FancyShimmerImage(
                      imageUrl: _baseUrl + widget.webinar.thumbnail,
                      height: 380,
                      width: 380,
                      boxFit: BoxFit.fill,
                      boxDecoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.webinar.name,
                        style: myTextTheme.headline3,
                      ),
                    ),
                    const SizedBox(
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
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      widget.webinar.desc,
                      style: myTextTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              height: 56,
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
                            onPressed: () {
                              provider.addBookmark(widget.webinar);
                              final snackBar = SnackBar(
                                backgroundColor: blue100,
                                behavior: SnackBarBehavior.floating,
                                content: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Berhasil ditambahkan',
                                        style: GoogleFonts.roboto(
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.5,
                                              color: neutral900),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0.0,
                                          shadowColor: Colors.transparent,
                                          primary: blue100,
                                          onPrimary: neutral400,
                                        ),
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();

                                          Navigator.pushNamed(
                                              context, BookmarkPage.routeName,
                                              arguments: 1);
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Lihat',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.roboto(
                                                  textStyle: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 0.2,
                                                      color: blue500),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            SvgPicture.asset(
                                              "assets/icons/chevron-right.svg",
                                              color: blue500,
                                              height: 24,
                                              width: 24,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                          ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
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
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.2,
                                    color: neutral100),
                              ),
                            ),
                            const SizedBox(
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
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
