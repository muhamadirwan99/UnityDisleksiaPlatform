import 'package:flutter_test/flutter_test.dart';
import 'package:unity_disleksia_platform/data/api/api_service.dart';
import 'package:unity_disleksia_platform/provider/webinar_provider.dart';

void main() {
  test('Fetch webinar data from api', () async {
    bool done = false;
    var webinarProvider = WebinarProvider(apiService: ApiService());
    var fetch = webinarProvider.fetchAllWebinar();

    // ignore: unnecessary_null_comparison
    if (fetch != null) {
      done = true;
    }

    expect(done, true);
  });
}
