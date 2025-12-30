import "package:cmsapp/data/screens/home_screen.dart";
import "package:flutter/material.dart";
import "package:supabase_flutter/supabase_flutter.dart";

class ExitApp extends StatefulWidget {
  const ExitApp({super.key});

  @override
  State<ExitApp> createState() => _ExitAppState();
}

class _ExitAppState extends State<ExitApp> {
  Future<void> leaveApp(BuildContext context) async {
    final supabase = Supabase.instance.client;
    await supabase.auth.signOut();
    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
        (route) => false,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    //leaveApp(context);
  }

  @override
  Widget build(BuildContext context) {
    // IMPORTANT: exit logic must not run directly inside build().
    // build() can run multiple times, so doing nav here will crash.
    // Instead, schedule it to run after build:
    //if (mounted) {
    Future.microtask(() => leaveApp(context));
    //}

    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
