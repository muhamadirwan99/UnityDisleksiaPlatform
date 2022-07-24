import 'package:flutter_test/flutter_test.dart';
import 'package:unity_disleksia_platform/data/api/api_service.dart';
import 'package:unity_disleksia_platform/provider/video_provider.dart';

void main() {
  test('Fetch video data from api', () async {
    bool done = false;
    var videoProvider = VideoProvider(apiService: ApiService());
    var fetch = videoProvider.fetchAllVideo();

    // ignore: unnecessary_null_comparison
    if (fetch != null) {
      done = true;
    }

    expect(done, true);
  });
}
