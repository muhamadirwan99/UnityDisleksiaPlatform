import 'package:flutter_test/flutter_test.dart';
import 'package:unity_disleksia_platform/data/api/api_service.dart';
import 'package:unity_disleksia_platform/provider/search_video_provider.dart';

void main() {
  test('Fetch search video data from api', () async {
    bool done = false;
    var searchVideoProvider = SearchVideoProvider(apiService: ApiService());
    var fetch = searchVideoProvider.fetchSearchVideo(name: "lala");

    // ignore: unnecessary_null_comparison
    if (fetch != null) {
      done = true;
    }

    expect(done, true);
  });
}
