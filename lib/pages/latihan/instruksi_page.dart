import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class InstruksiPage extends StatefulWidget {
  static const routeName = '/instruksiPage';

  const InstruksiPage({Key? key}) : super(key: key);

  @override
  State<InstruksiPage> createState() => _InstruksiPageState();
}

class _InstruksiPageState extends State<InstruksiPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    var url = "https://www.youtube.com/watch?v=FSWl_JAvROo";

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        mute: false,
        loop: false,
        autoPlay: false,
      ),
    );
  }

  @override
  void deactivate() {
    _controller.pause();

    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
      ),
      builder: (context, player) => Scaffold(
          appBar: AppBar(
            title: Text(
              'Instruksi',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.2,
                    color: neutral100),
              ),
            ),
            titleTextStyle: const TextStyle(color: neutral900),
            elevation: 0,
            backgroundColor: blue500,
            leading: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/arrow-left.svg",
                color: neutral100,
                height: 32,
                width: 32,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          backgroundColor: blue500,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: neutral100,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Materi",
                            style: myTextTheme.headline4,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Materi ini ditujukan bagi anak-anak atau siswa yang mengalami kesulitan dalam belajar untuk mengenal huruf abjad dan angka. Materi ini diharapkan dapat memudahkan siswa agar lebih cermat dalam memahami huruf dan angka melalui pendekatan visualisasi aksi. Orangtua atau guru diharapkan dapat mendampingi siswanya selama kegiatan belajar agar lebih efektif dan mendapatkan hasil yang maksimal.",
                            style: myTextTheme.bodyText2,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Pengenalan Latihan",
                            style: myTextTheme.headline4,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Pada menu latihan ini, orang tua atau guru dapat membantu dan membimbing anak untuk mengenal huruf dan angka dengan cara membantu anak atau siswa untuk bisa menuliskan huruf atau angka sesuai dengan contoh.",
                            style: myTextTheme.bodyText2,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: player,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Cara Bermain",
                            style: myTextTheme.headline4,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ListTile(
                          leading: Text(
                            "1.",
                            style: myTextTheme.bodyText2,
                          ),
                          minLeadingWidth: 10,
                          title: Text(
                            'Pilih Angka atau Huruf yang ingin dipelajari atau dilatih.',
                            style: myTextTheme.bodyText2,
                          ),
                        ),
                        ListTile(
                          leading: Text(
                            "2.",
                            style: myTextTheme.bodyText2,
                          ),
                          minLeadingWidth: 10,
                          title: Text(
                            'Lakukan latihan menulis uruf sesuai dengan contoh yang ditampilkan pada halaman Latihan.',
                            style: myTextTheme.bodyText2,
                          ),
                        ),
                        ListTile(
                          leading: Text(
                            "3.",
                            style: myTextTheme.bodyText2,
                          ),
                          minLeadingWidth: 10,
                          title: Text(
                            'Lakukan latihan secara rutin dan berurutan agar mendapatkan hasil maksimal.',
                            style: myTextTheme.bodyText2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
