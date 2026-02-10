import 'package:flutter/material.dart';
import '../services/api_client.dart';
import '../storage/token_storage.dart';
import 'login_page.dart';
import 'ordem_detalhe_page.dart';

class OrdensPage extends StatefulWidget {
  const OrdensPage({super.key});

  @override
  State<OrdensPage> createState() => _OrdensPageState();
}

class _OrdensPageState extends State<OrdensPage> {
  final ApiClient _api = ApiClient();

  bool _loading = true;
  String? _error;
  List<dynamic> _ordens = [];

  @override
  void initState() {
    super.initState();
    _carregar();
  }

  Future<void> _carregar() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final ordens = await _api.listarOrdensAbertas();
      setState(() => _ordens = ordens);
    } catch (e) {
      setState(() => _error = "Não foi possível carregar as ordens.");
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _sair() async {
    await TokenStorage.clearToken();
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ordens Abertas"),
        backgroundColor: const Color(0xFF0B5ED7),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: _sair,
            icon: const Icon(Icons.logout),
            tooltip: "Sair",
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _carregar,
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : _error != null
                ? ListView(
                    children: [
                      const SizedBox(height: 80),
                      Center(child: Text(_error!)),
                      const SizedBox(height: 12),
                      Center(
                        child: ElevatedButton(
                          onPressed: _carregar,
                          child: const Text("Tentar novamente"),
                        ),
                      ),
                    ],
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(12),
                    itemCount: _ordens.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final o = _ordens[index];

                      final id = (o["id"] as num).toInt();
                      final codigo = o["codigo"]?.toString() ?? "OS $id";
                      final status = o["status"]?.toString() ?? "ABERTA";
                      final produto = o["produto"]?.toString() ?? "";
                      final consumidor = o["consumidor"]?.toString() ?? "";

                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => OrdemDetalhePage(ordemId: id),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x11000000),
                                blurRadius: 18,
                                offset: Offset(0, 8),
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      codigo,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: const Color(0x1F0B5ED7),
                                      borderRadius: BorderRadius.circular(999),
                                      border: Border.all(
                                          color: const Color(0x330B5ED7)),
                                    ),
                                    child: Text(
                                      status,
                                      style: const TextStyle(
                                        color: Color(0xFF0B5ED7),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (consumidor.isNotEmpty) ...[
                                const SizedBox(height: 6),
                                Text(consumidor),
                              ],
                              if (produto.isNotEmpty) ...[
                                const SizedBox(height: 6),
                                Text(
                                  produto,
                                  style: const TextStyle(color: Colors.black54),
                                ),
                              ],
                            ],
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}