// -------------------------
// lib/services/auth_service.dart
// -------------------------

import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _supabase = Supabase.instance.client;

  Future<AuthResponse> signInWithEmail(String email, String password) async {
    return await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<AuthResponse> signUpWithEmail(String email, String password) async {
    return await _supabase.auth.signUp(email: email, password: password);
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  Future<void> resetPassword(String email) async {
    // Supabase sends a password reset email configured in dashboard.
    // The exact dart API may vary by package version. If this call doesn't exist,
    // use the corresponding api call from the supabase_flutter version you added.
    await _supabase.auth.resetPasswordForEmail(email);
  }

  /*
  Future<void> signInWithOAuth(Provider provider) async {
    // Opens the browser for OAuth flow; configure redirect in Supabase.
    await _supabase.auth.signInWithOAuth(provider: provider);
  }
  */
}
