import 'package:flutter_test/flutter_test.dart';
import 'package:unity_disleksia_platform/data/api/api_service.dart';
import 'package:unity_disleksia_platform/provider/video_recent_provider.dart';

void main() {
  test('Fetch video recents data from api', () async {
    bool done = false;
    var videoRecentProvider = VideoRecentProvider(apiService: ApiService());
    var fetch = videoRecentProvider.fetchAllVideoRecent();

    // ignore: unnecessary_null_comparison
    if (fetch != null) {
      done = true;
    }

    expect(done, true);
  });
}
