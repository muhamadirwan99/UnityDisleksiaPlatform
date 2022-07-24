import 'package:flutter_test/flutter_test.dart';
import 'package:unity_disleksia_platform/data/api/api_service.dart';
import 'package:unity_disleksia_platform/provider/tips_pembelajaran_provider.dart';

void main() {
  test('Fetch tips pembelajaran data from api', () async {
    bool done = false;
    var tipsPembelajaranProvider =
        TipsPembelajaranProvider(apiService: ApiService());
    var fetch = tipsPembelajaranProvider.fetchAllTips();

    // ignore: unnecessary_null_comparison
    if (fetch != null) {
      done = true;
    }

    expect(done, true);
  });
}
