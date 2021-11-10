mixin DecodeModelMixin {
  T tryDecode<T>(T Function() decodeFunction,
      {required T Function(dynamic) orElse}) {
    try {
      return decodeFunction();
    } catch (exception) {
      return orElse.call(exception);
    }
  }
}
