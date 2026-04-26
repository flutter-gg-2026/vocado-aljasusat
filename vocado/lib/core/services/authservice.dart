import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
@lazySingleton
class AuthService {
  final SupabaseClient _supabase;

  AuthService(this._supabase);

  Future<User?> getCurrentUser() async {
    final session = _supabase.auth.currentSession;

    if (session == null) {
      return null;
    }

    final isExpired = session.expiresAt != null &&
        DateTime.now().isAfter(
          DateTime.fromMillisecondsSinceEpoch(session.expiresAt! * 1000),
        );

    if (isExpired) {
      final response = await _supabase.auth.refreshSession();

      if (response.session == null) {
        return null;
      }
    }

    return _supabase.auth.currentUser;
  }
}