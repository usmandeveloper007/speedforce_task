import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class ConnectivityService {
  ConnectivityService._() {
    if (hasInternet == null) {
      checkConnectionStatus(verifyIt: true);
    }
  }

  static final ConnectivityService _instance = ConnectivityService._();

  factory ConnectivityService() {
    return _instance;
  }

  bool? hasInternet;

  Future<bool?> checkConnectionStatus({bool verifyIt = false}) async {
    final Connectivity connectivity = Connectivity();
    List<ConnectivityResult> connectivityResult =
        await connectivity.checkConnectivity();
    if (connectivityResult.last == ConnectivityResult.wifi) {
      hasInternet = true;
      return hasInternet;
    } else if (connectivityResult.last == ConnectivityResult.mobile) {
      if (verifyIt) {
        try {
          final result = await http
              .get(Uri.parse('https://www.google.com'))
              .timeout(const Duration(seconds: 5));
          if (result.statusCode == 200) {
            ///data available
            hasInternet = true;
            return hasInternet;
          } else {
            ///data not available
            hasInternet = false;
            return hasInternet;
          }
        } catch (_) {
          ///data not available
          hasInternet = false;
          return hasInternet;
        }
      } else {
        hasInternet = true;
        return hasInternet;
      }
    } else {
      hasInternet = false;
      return hasInternet;
    }
  }
}
