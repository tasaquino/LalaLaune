import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppConfig {
  static const supabaseUrl = '';
  static const supabaseAnonKey = '';
  static const supabaseJwtSecret = '';
  static const passageAppID = '';
  static const passageApiKey = '';

  Future<void> initializeSupabaseWith(String userID) async {
    final expiration = DateTime.now().add(const Duration(days: 7));
    final payload = {
      'userId': userID,
      'exp': expiration.millisecondsSinceEpoch,
    };
    final jwt = JWT(payload);
    final token = jwt.sign(SecretKey(AppConfig.supabaseJwtSecret));

    await Supabase.initialize(
        url: AppConfig.supabaseUrl,
        anonKey: AppConfig.supabaseAnonKey,
        headers: {'Authorization:': 'Bearer $token'});
  }
}
