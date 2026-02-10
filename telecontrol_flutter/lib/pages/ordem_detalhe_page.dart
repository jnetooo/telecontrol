import 'package:flutter/material.dart';
import '../services/api_client.dart';

class OrdemDetalhePage extends StatefulWidget {
  final int ordemId;
  const OrdemDetalhePage({super.key, required this.ordemId});

  @override
  State<OrdemDetalhePage> createState() => _OrdemDetalhePageState();
}

class _OrdemDetalhePageState extends State<OrdemDetalhePage> {
  final ApiClient _api = ApiClient();

  bool _loading = true;
  bool _saving = false;
  String? _error;

  Map<String, dynamic>? _ordem;

  final _defeitoCtrl = TextEditingController();
  final _solucaoCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _carregar();
  }

  @override
  void dispose() {
    _defeitoCtrl.dispose();
    _solucaoCtrl.dispose();
    super.dispose();
  }

  Future<void> _carregar() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final ordem = await _api.buscarOrdem(widget.ordemId);
      setState(() => _ordem = ordem);

      _defeitoCtrl.text = ordem["defeito"]?.toString() ?? "";
      _solucaoCtrl.text = ordem["solucao"]?.toString() ?? "";
    } catch (e) {
      setState(() => _error = "Não foi possível carregar o detalhe da ordem.");
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _salvar() async {
    setState(() {
      _saving = true;
      _error = null;
    });

    try {
      await _api.atualizarOrdem(
        id: widget.ordemId,
        defeito: _defeitoCtrl.text,
        solucao: _solucaoCtrl.text,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Salvo com sucesso.")),
      );

      await _carregar();
    } catch (e) {
      setState(() => _error = "Falha ao salvar. Tente novamente.");
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ordem #${widget.ordemId}"),
        backgroundColor: const Color(0xFF0B5ED7),
        foregroundColor: Colors.white,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!))
              : _ordem == null
                  ? const Center(child: Text("Sem dados."))
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _InfoCard(ordem: _ordem!),
                          const SizedBox(height: 14),

                          const Text("Defeito",
                              style: TextStyle(fontWeight: FontWeight.w700)),
                          const SizedBox(height: 6),
                          TextField(
                            controller: _defeitoCtrl,
                            maxLines: 4,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Descreva o defeito...",
                            ),
                          ),
                          const SizedBox(height: 14),

                          const Text("Solução",
                              style: TextStyle(fontWeight: FontWeight.w700)),
                          const SizedBox(height: 6),
                          TextField(
                            controller: _solucaoCtrl,
                            maxLines: 4,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Descreva a solução...",
                            ),
                          ),
                          const SizedBox(height: 18),

                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: _saving ? null : _salvar,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0B5ED7),
                                foregroundColor: Colors.white,
                              ),
                              child: Text(_saving ? "Salvando..." : "Salvar"),
                            ),
                          ),
                        ],
                      ),
                    ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final Map<String, dynamic> ordem;
  const _InfoCard({required this.ordem});

  @override
  Widget build(BuildContext context) {
    final status = ordem["status"]?.toString() ?? "ABERTA";
    final codigo = ordem["codigo"]?.toString() ?? "";
    final consumidor = ordem["consumidor"]?.toString() ?? "";
    final produto = ordem["produto"]?.toString() ?? "";

    return Container(
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
                  codigo.isEmpty ? "Ordem de Serviço" : codigo,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0x1F0B5ED7),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: const Color(0x330B5ED7)),
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
            const SizedBox(height: 8),
            Text("Consumidor: $consumidor"),
          ],
          if (produto.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(
              "Produto: $produto",
              style: const TextStyle(color: Colors.black54),
            ),
          ],
        ],
      ),
    );
  }
}