import 'dart:async';

import 'package:connectivity/connectivity.dart';

abstract class InternetConnectionChecker {
  Future<bool> isConnected();
}

class InternetConnectionCheckerImpl implements InternetConnectionChecker {
  @override
  Future<bool> isConnected() async {
    final dataConnectionChecker = Connectivity();

    return await dataConnectionChecker.checkConnectivity() !=
        ConnectivityResult.none;
  }
}
