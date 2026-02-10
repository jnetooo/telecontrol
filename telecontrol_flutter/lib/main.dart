import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/ordens_page.dart';
import 'storage/token_storage.dart';

void main() {
  runApp(const TelecontrolApp());
}

class TelecontrolApp extends StatelessWidget {
  const TelecontrolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telecontrol',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0B5ED7)),
        useMaterial3: true,
      ),
      home: const _BootstrapPage(),
    );
  }
}

class _BootstrapPage extends StatefulWidget {
  const _BootstrapPage();

  @override
  State<_BootstrapPage> createState() => _BootstrapPageState();
}

class _BootstrapPageState extends State<_BootstrapPage> {
  bool _loading = true;
  bool _hasToken = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final token = await TokenStorage.readToken();
    setState(() {
      _hasToken = token != null && token.isNotEmpty;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return _hasToken ? const OrdensPage() : const LoginPage();
  }
}