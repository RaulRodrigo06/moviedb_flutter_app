class MapApiError {
  MapApiError({
    this.statusMessage,
    this.statusCode,
  });

  final String? statusMessage;
  final String? statusCode;

  factory MapApiError.fromJson(Map<String, dynamic> json) {
    return MapApiError(
      statusCode: json['status_code'],
      statusMessage: json['status_message'],
    );
  }
}
