import 'dart:async';
import 'package:themoviedb/core/network/network_error_type.dart';

abstract class NetworkErrorObservable {
  void onNetworkError(NetworkErrorType errorType);
}

class NetworkErrorObserver {
  NetworkErrorObserver._internal() {
    _inicializarStream();
  }

  static NetworkErrorObserver? _instance;

  static NetworkErrorObserver get instance {
    return _instance ?? NetworkErrorObserver._internal();
  }

  final StreamController<NetworkErrorType> _networkStream =
      StreamController<NetworkErrorType>.broadcast();

  final List<NetworkErrorObservable> _listeners = [];

  void adicionarListener({required NetworkErrorObservable listener}) {
    if (_listeners.contains(listener)) {
      return;
    }

    _listeners.add(listener);
  }

  void removerListener({required NetworkErrorObservable listener}) {
    if (_listeners.contains(listener)) {
      _listeners.remove(listener);
    }
  }

  void removerListeners() {
    _listeners.clear();
  }

  void criarNotificacao({required NetworkErrorType errorType}) {
    if (_networkStream.isClosed) {
      return;
    }
    _networkStream.add(errorType);
  }

  void _inicializarStream() {
    _networkStream.stream.listen((final NetworkErrorType errorType) {
      for (final NetworkErrorObservable listener in _listeners) {
        listener.onNetworkError(errorType);
      }
    });
  }

  void dispose() {
    _networkStream.close();
    removerListeners();
  }
}