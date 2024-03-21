import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom_app_bar.dart';
import 'package:flutter_application_1/gol_page.dart';
import 'package:flutter_application_1/outra_tela.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _paginaSelecionada = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: const Color(0xff000232),
          appBar: buildCustomAppBar(
              context,
              (index) => setState(() {
                    _paginaSelecionada = index;
                  })),
          body: SafeArea(child: _mudarPagina()),
        ),
      ),
    );
  }

  Widget _mudarPagina() {
    switch (_paginaSelecionada) {
      case 2:
        return const GolPage();
      default:
        return const OutraTela();
    }
  }
}
