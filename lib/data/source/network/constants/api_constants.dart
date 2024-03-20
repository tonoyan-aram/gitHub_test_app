abstract class APIBase {
  static const url = 'https://api.github.com/search';
}

abstract class HeaderParameterKeys {
  static const authorization = "Authorization";
  static const contentType = "Content-Type";
  static const accept = "Accept";
  static const userAgent = "User-Agent";
}

abstract class HeaderValues {
  static const applicationJson = "application/json";
  static const applicationJsonCharsetUtf8 = "application/json, charset=utf-8";
  static const applicationFormUrlencoded = "application/x-www-form-urlencoded";
  static const applicationJsonTextPlain = "application/json, text/plain, */*";
}
