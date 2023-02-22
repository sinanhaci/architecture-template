import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

typedef NetworkCallBack = void Function(NetworkResult result);

abstract class INetworkStatusManager {
  Future<NetworkResult> checkNetworkFirstTime();
  void handleNetworkChange(NetworkCallBack onChange);
  void dispose();
}

enum NetworkResult {
  on,
  off;

  static NetworkResult checkConnectivityResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.mobile:
      case ConnectivityResult.vpn:
      case ConnectivityResult.other:
        return NetworkResult.on;
      case ConnectivityResult.none:
        return NetworkResult.off;
    }
  }
}