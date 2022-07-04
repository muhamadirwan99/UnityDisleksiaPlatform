import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/model/video_model.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class CardModul extends StatefulWidget {
  final Video video;

  const CardModul({required this.video});

  @override
  State<CardModul> createState() => _CardModulState();
}

class _CardModulState extends State<CardModul> {
  Future download(String url) async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      final baseStorage = await getExternalStorageDirectory();

      await FlutterDownloader.enqueue(
        url: url,
        savedDir: baseStorage!.path,
        showNotification: true,
        openFileFromNotification: true,
        saveInPublicStorage: true,
      );
    }
  }

  ReceivePort _port = ReceivePort();

  @override
  void initState() {
    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      if (status == DownloadTaskStatus.complete) {
        print("Download complete");
      }
      setState(() {});
    });

    FlutterDownloader.registerCallback(downloadCallback);
    super.initState();
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    const String _baseUrl = 'http://34.128.78.90:5000/';
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              "Modul " + widget.video.name,
              style: myTextTheme.headline4,
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                download(_baseUrl + widget.video.modul);
              },
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Unduh",
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
        ),
      ),
    );
  }
}
