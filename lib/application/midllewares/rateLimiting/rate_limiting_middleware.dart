import 'dart:developer';

import 'package:shelf/shelf.dart';

class RateLimitingMiddleware {
  final int limit;
  final Duration timeWindow;
  final Map<String, int> ipRequestCount = {};
  final Map<String, DateTime> lastRequestTime = {};

  RateLimitingMiddleware({
    this.limit = 2,
    this.timeWindow = const Duration(seconds: 10),
  });

  Middleware get middleware {
    return (Handler innerHandler) {
      return (Request request) async {
        String ip = request.context['remote_addr']?.toString() ?? 'unknown_ip';
        if (ip == 'unknown_ip') {
          ip = request.headers['x-forwarded-for']?.split(',').first.trim() ??
              'unknown_ip';
        }

        DateTime currentTime = DateTime.now();

        log('Requisição de IP: $ip, Hora: $currentTime');

        if (ipRequestCount.containsKey(ip)) {
          if (currentTime
                  .difference(lastRequestTime[ip]!)
                  .compareTo(timeWindow) >
              0) {
            ipRequestCount[ip] = 0;
            log('Contagem resetada para o IP: $ip');
          }

          ipRequestCount[ip] = ipRequestCount[ip]! + 1;
          lastRequestTime[ip] = currentTime;

          print('Contagem de requisições para o IP $ip: ${ipRequestCount[ip]}');

          if (ipRequestCount[ip]! > limit) {
            return Response.forbidden('Too many requests');
          }
        } else {
          ipRequestCount[ip] = 1;
          lastRequestTime[ip] = currentTime;
        }

        return innerHandler(request);
      };
    };
  }
}
