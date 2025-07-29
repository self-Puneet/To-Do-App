// make a abstract class for network info with function isf the network is connected or not.

abstract class NetworkInfo {
  Future<bool> isConnected();
}
