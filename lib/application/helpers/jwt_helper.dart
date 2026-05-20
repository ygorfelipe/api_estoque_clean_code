import 'package:jaguar_jwt/jaguar_jwt.dart';

import '../env/config.dart';

sealed class JwtHelper {
  static final String _jwtSecret =
      Env.i.env['JWT_SECRET'] ?? Env.i.env['jwtSecret']!;

  static String generateJWT(int userId) {
    final claimSet = JwtClaim(
      issuer: 'estudo_estoque_db',
      subject: userId.toString(),
      expiry: DateTime.now().add(const Duration(days: 20)),
      notBefore: DateTime.now(),
      issuedAt: DateTime.now(),
      maxAge: const Duration(days: 1),
    );
    return 'Bearer ${issueJwtHS256(claimSet, _jwtSecret)}';
  }

  static JwtClaim getClaims(String token) {
    return verifyJwtHS256Signature(token, _jwtSecret);
  }

  static String refreshToken(String accessToken) {
    final claimSet = JwtClaim(
      issuer: accessToken,
      subject: 'RefreshToken',
      expiry: DateTime.now().add(const Duration(days: 20)),
      // notBefore: DateTime.now().add(Duration(hours: 12)),
      issuedAt: DateTime.now(),
      maxAge: const Duration(days: 25),
    );
    return 'Bearer ${issueJwtHS256(claimSet, _jwtSecret)}';
  }

  static String generateFileJWT({
    required String userId,
    required int expiry,
    required int maxAge,
  }) {
    final claimSet = JwtClaim(
      issuer: 'db_barbershop',
      subject: userId,
      expiry: DateTime.now().add(Duration(seconds: expiry)),
      notBefore: DateTime.now(),
      issuedAt: DateTime.now(),
      maxAge: Duration(seconds: maxAge),
    );

    return issueJwtHS256(claimSet, _jwtSecret);
  }
}
