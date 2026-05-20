//! esse aqui nunca muda, sempre ira usar os mesmo.

import 'package:shelf/shelf.dart';

abstract class Middlewares {
  late Handler innerHandler;

  Handler handler(Handler innerHandler) {
    this.innerHandler = innerHandler;
    return execute;
  }

  Future<Response> execute(Request request);
}

Middleware maxSizeMiddleware() {
  const int maxFileSizeBytes = 5 * 1024 * 1024;
  return (Handler handler) {
    return (Request request) async {
      final contentLength = request.contentLength;

      if (contentLength != null && contentLength > maxFileSizeBytes) {
        return Response(413, body: 'Payload muito grande');
      }

      return handler(request);
    };
  };
}
