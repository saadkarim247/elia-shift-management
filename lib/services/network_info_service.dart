import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfoService {
  Future<bool> get isConnected;
}

class NetworkInfoServiceImpl implements NetworkInfoService {
  late final Connectivity connectivity;

  NetworkInfoServiceImpl({Connectivity? checker}) {
    connectivity = checker ?? Connectivity();
  }

  @override
  Future<bool> get isConnected async {
    var list = await connectivity.checkConnectivity();
    for (var element in list) {
      if (element == ConnectivityResult.none) {
        return false;
      }
    }
    return true;
  }
}
