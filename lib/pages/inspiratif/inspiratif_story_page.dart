import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/provider/kisah_provider.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';
import 'package:unity_disleksia_platform/widgets/card_kisah.dart';
import 'package:unity_disleksia_platform/widgets/skeleton.dart';
import 'package:url_launcher/url_launcher.dart';

class InspiratifStoryPage extends StatelessWidget {
  const InspiratifStoryPage({Key? key}) : super(key: key);

  Widget _buildPage() {
    return Consumer<KisahProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return SizedBox(
            height: 96,
            child: ListView.separated(
              padding: const EdgeInsets.only(left: 24, right: 24),
              scrollDirection: Axis.vertical,
              itemCount: 3,
              itemBuilder: (context, index) => const Skeleton(
                width: 380,
                height: 96,
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 24),
            ),
          );
        } else if (state.state == ResultState.HasData) {
          return SizedBox(
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 24, right: 24),
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: state.result.data.length,
              itemBuilder: (context, index) {
                var kisah = state.result.data[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: GestureDetector(
                        child: CardKisah(kisah: kisah),
                        onTap: () {
                          _launchUrl(Uri.parse(kisah.link));
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Divider(
                        color: neutral200,
                        thickness: 2,
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        } else if (state.state == ResultState.NoData) {
          return Center(
            child: SvgPicture.asset(
              "assets/illustrations/noconnection.svg",
            ),
          );
        } else if (state.state == ResultState.Error) {
          return Center(
            child: SvgPicture.asset(
              "assets/illustrations/noconnection.svg",
            ),
          );
        } else {
          return const Center(child: Text(''));
        }
      },
    );
  }

  void _launchUrl(_url) async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return _buildPage();
  }
}
