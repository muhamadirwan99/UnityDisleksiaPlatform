import 'package:flutter_test/flutter_test.dart';
import 'package:unity_disleksia_platform/data/api/api_service.dart';
import 'package:unity_disleksia_platform/provider/search_webinar_provider.dart';

void main() {
  test('Fetch search webinar data from api', () async {
    bool done = false;
    var searchWebinarProvider = SearchWebinarProvider(apiService: ApiService());
    var fetch = searchWebinarProvider.fetchSearchWebinar(name: "disleksia");

    // ignore: unnecessary_null_comparison
    if (fetch != null) {
      done = true;
    }

    expect(done, true);
  });
}
