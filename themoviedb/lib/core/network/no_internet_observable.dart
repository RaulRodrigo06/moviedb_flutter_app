import 'dart:async';

enum NoInternetScreenStatus { open, closed }

abstract class NoInternetScreenObservable {
  void onStatusChanged(NoInternetScreenStatus status);
}

class NoInternetScreenObserver {
  NoInternetScreenObserver._() {
    _inicializarStream();
  }

  static NoInternetScreenObserver? _instance;

  static NoInternetScreenObserver get instance {
    return _instance ?? NoInternetScreenObserver._();
  }

  final StreamController<NoInternetScreenStatus> _jogoStream =
      StreamController<NoInternetScreenStatus>.broadcast();

  Stream<NoInternetScreenStatus> get onStatusChanged => _jogoStream.stream;

  final List<NoInternetScreenObservable> _listeners = [];

  void adicionarListener({required NoInternetScreenObservable listener}) {
    if (_listeners.contains(listener)) {
      return;
    }

    _listeners.add(listener);
  }

  void removerListener({required NoInternetScreenObservable listener}) {
    if (_listeners.contains(listener)) {
      _listeners.remove(listener);
    }
  }

  void removerListeners() {
    _listeners.clear();
  }

  void criarNotificacao({required NoInternetScreenStatus statusNovo}) {
    if (_jogoStream.isClosed) {
      return;
    }
    _jogoStream.add(statusNovo);
  }

  void _inicializarStream() {
    _jogoStream.stream.listen(
      (final NoInternetScreenStatus statusNovo) {
        for (final NoInternetScreenObservable listener in _listeners) {
          listener.onStatusChanged(statusNovo);
        }
      },
    );
  }

  void dispose() {
    _jogoStream.close();
    removerListeners();
  }
}
