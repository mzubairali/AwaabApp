// -------------------------
// lib/pages/staff_login_page.dart
// -------------------------

import 'package:flutter/material.dart';
//import 'package:cmsapp/data/forgot_password_page.dart';
//import 'package:cmsapp/data/forgot_password_page.dart';
import 'package:cmsapp/old/staff/staff_dashboard_page.dart';
import 'package:cmsapp/old/tenant/ten_dashboard_page.dart';
import 'services/storage_service.dart';
import 'services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _StaffLoginPageState();
}

final String title = "";

class _StaffLoginPageState extends State<LoginPage> {
  final emailController = TextEditingController(text: 'mzali11@hotmail.com');
  final passwordController = TextEditingController(text: '1234');
  final StorageService _storage = StorageService();
  final AuthService _auth = AuthService();

  bool rememberMe = false;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    final savedEmail = await _storage.readCredentials('staff_email');
    final savedPassword = await _storage.readCredentials('staff_password');
    if (savedEmail != null && savedPassword != null) {
      setState(() {
        emailController.text = savedEmail;
        passwordController.text = savedPassword;
        rememberMe = true;
      });
    }
  }

  Future<void> _signIn() async {
    setState(() => loading = true);
    try {
      final res = await _auth.signInWithEmail(
        emailController.text.trim(),
        passwordController.text,
      );
      if (res.session != null) {
        if (rememberMe) {
          await _storage.saveCredentials(
            'staff_email',
            emailController.text.trim(),
          );
          await _storage.saveCredentials(
            'staff_password',
            passwordController.text,
          );
        } else {
          await _storage.deleteCredentials('staff_email');
          await _storage.deleteCredentials('staff_password');
        }
        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              if (widget.title == 'Staff') {
                return StaffDashboardPage(title: 'ss');
              }
              return TenantDashboardPage(title: 'ss');
            },
          ),
        );
        //Navigator.pushReplacementNamed(context, DashboardPage());
      } else {
        _showMessage('Login failed.');
      }
    } catch (e) {
      _showMessage('Error: $e');
    } finally {
      setState(() => loading = false);
    }
  }

  void _showMessage(String m) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(m)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.title} Portal')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: '${widget.title} e-mail'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            Row(
              children: [
                Checkbox(
                  value: rememberMe,
                  onChanged: (v) => setState(() => rememberMe = v ?? false),
                ),
                const Text('Remember me'),
                const Spacer(),
                /*
                TextButton(
                  onPressed: () {
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ForgotPasswordPage();
                        },
                      ),
                    );
                    
                  },
                  child: const Text('Forgot password?'),
                ),
                */
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: loading ? null : _signIn,
                child:
                    loading
                        ? const CircularProgressIndicator()
                        : const Text('Sign In'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
