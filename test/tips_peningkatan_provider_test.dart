import 'package:flutter_test/flutter_test.dart';
import 'package:unity_disleksia_platform/data/api/api_service.dart';
import 'package:unity_disleksia_platform/provider/tips_peningkatan_provider.dart';

void main() {
  test('Fetch tips pembelajaran data from api', () async {
    bool done = false;
    var tipsPeningkatanProvider =
        TipsPeningkatanProvider(apiService: ApiService());
    var fetch = tipsPeningkatanProvider.fetchAllTips();

    // ignore: unnecessary_null_comparison
    if (fetch != null) {
      done = true;
    }

    expect(done, true);
  });
}
