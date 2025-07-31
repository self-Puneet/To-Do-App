// make a abstract class for network info with function isf the network is connected or not.

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
}

class NetworkInfoImpl implements NetworkInfo {
  // This class would implement the actual logic to check network connectivity.
  @override
  Future<bool> isConnected() async {
    return await InternetConnection().hasInternetAccess;
  }
}
