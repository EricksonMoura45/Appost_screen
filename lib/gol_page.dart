import 'package:flutter/material.dart';
import 'package:flutter_application_1/enum/tipo_gol.dart';
import 'package:flutter_application_1/shared/themes.dart';

class GolPage extends StatefulWidget {
  const GolPage({super.key});

  @override
  State<GolPage> createState() => _GolPageState();
}

class _GolPageState extends State<GolPage> {

  String? valorSelecionado = 'Champions League - 22/23';

  List itens = [
    'Champions League - 22/23',
    'La Liga - 22/23',
    'Copa Del Rey - 22/23'
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildDropDown(),
          ),
          const SizedBox(height: 24),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: _buildTela(),
          ),
        ],
      ),
    );
  }

  Widget _buildTela() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Gols no Campeonato',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 20),
          _buildGolsFeitos('12', '1,5'),
          const SizedBox(height: 12),
          _buildGolsSofridos('5', '1,5'),
          const SizedBox(height: 12),
          _buildGolsTotais('6', '1,5'),
          const SizedBox(height: 32),
          //adicionar bordas redondas
          const Divider(
            color: Color(0xff161745),
            thickness: 8,
          ),
          const SizedBox(height: 32),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: _buildMediaGol(),
          ),
          const SizedBox(height: 32),
          const Divider(
            color: Color(0xff161745),
            thickness: 8,
          ),
          const SizedBox(height: 34),
          _buildGolsQuinzeMinutos(),
          const SizedBox(height: 32),
          const Divider(
            color: Color(0xff161745),
            thickness: 8,
          ),
          const SizedBox(height: 32),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: _buildHistoricoGols(),
          ),
          const SizedBox(height: 30),
        ],
      );
  //Dropdown de seleção dos campeonatos
  Widget _buildDropDown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Themes.azulClaro,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          gapPadding: 0,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          gapPadding: 0,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          gapPadding: 0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          gapPadding: 0,
        ),
      ),
      elevation: 0,
      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
      dropdownColor: Themes.azulClaro,
      value: valorSelecionado,
      items: itens.map((e) {
        return DropdownMenuItem<String>(
          value: e,
          child: Row(
            children: [
              Image.asset('assets/icons/trofeu.png', scale: 3),
              const SizedBox(width: 5),
              Text(
                e,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        );
      }).toList(),
      onChanged: (e) {
        setState(() {
          valorSelecionado = e;
        });
      },
    );
  }
  
  //Widget de histórico de Gols
  Widget _buildHistoricoGols() {
    return Column(
      children: [
        const Text(
          'Jogos que não fez gols',
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildDetalhe('4', '30', TipoGol.CASA),
            _buildBarraVertical(45),
            _buildDetalhe('5', '10', TipoGol.FORA),
            _buildBarraVertical(45),
            _buildDetalhe('5', '40', TipoGol.GERAL)
          ],
        ),
        const SizedBox(height: 32),
        const Divider(
          color: Color(0xff161745),
          thickness: 8,
        ),
        const SizedBox(height: 32),
        const Text(
          'Jogos que não sofreu gols',
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildDetalhe('4', '30', TipoGol.CASA),
            _buildBarraVertical(45),
            _buildDetalhe('5', '10', TipoGol.FORA),
            _buildBarraVertical(45),
            _buildDetalhe('5', '40', TipoGol.GERAL)
          ],
        ),
        const SizedBox(height: 32),
        const Divider(
          color: Color(0xff161745),
          thickness: 8,
        ),
        const SizedBox(height: 32),
        const Text(
          'Tempo médio para realizar 1º gol',
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildDetalhe('15', '30', TipoGol.CASA, temPorcentagem: false),
            _buildBarraVertical(45),
            _buildDetalhe('35', '10', TipoGol.FORA, temPorcentagem: false),
            _buildBarraVertical(45),
            _buildDetalhe('29', '40', TipoGol.GERAL, temPorcentagem: false)
          ],
        ),
        const SizedBox(height: 32),
        const Divider(
          color: Color(0xff161745),
          thickness: 8,
        ),
        const SizedBox(height: 32),
        const Text(
          'Tempo médio para sofrer 1º gol',
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildDetalhe('51', '30', TipoGol.CASA, temPorcentagem: false),
            _buildBarraVertical(45),
            _buildDetalhe('31', '10', TipoGol.FORA, temPorcentagem: false),
            _buildBarraVertical(45),
            _buildDetalhe('48', '40', TipoGol.GERAL, temPorcentagem: false)
          ],
        )
      ],
    );
  }

  Widget _buildDetalhe(String qnt, String porcentagem, TipoGol tipoGol,
      {bool temPorcentagem = true}) {
    String titulo = '';
    Color corTexto;
    Color corPorcentagem;
    switch (tipoGol) {
      case TipoGol.CASA:
        titulo = tipoGol.nome;
        corTexto = Themes.verdeClaro;
        corPorcentagem = Themes.verdeEscuro;
        break;
      case TipoGol.FORA:
        titulo = tipoGol.nome;
        corTexto = Themes.azulClaro;
        corPorcentagem = Themes.azulEscuro;
        break;
      case TipoGol.GERAL:
        titulo = tipoGol.nome;
        corTexto = Themes.amareloClaro;
        corPorcentagem = Themes.amareloEscuro;
        break;
      default:
        corTexto = Themes.verdeClaro;
        corPorcentagem = Themes.verdeEscuro;
        break;
    }
    return Column(
      children: [
        Text(titulo, style: TextStyle(fontSize: 12, color: corTexto)),
        temPorcentagem
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(qnt, style: TextStyle(fontSize: 24, color: corTexto)),
                  Text('$porcentagem%',
                      style: TextStyle(fontSize: 12, color: corPorcentagem)),
                ],
              )
            : Text(
                '$qnt\'',
                style: TextStyle(fontSize: 32, color: corTexto),
              )
      ],
    );
  }

  Widget _buildGolsQuinzeMinutos() => Column(
        children: [
          const Text(
            'Gols a cada 15 minutos',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          const SizedBox(height: 20),
          _cardDetalhesMinutos('00', '15', '2', '1', '3'),
          const SizedBox(height: 12),
          _cardDetalhesMinutos('16', '30', '9', '9', '18'),
          const SizedBox(height: 12),
          _cardDetalhesMinutos('31', '45', '0', '1', '1'),
        ],
      );

  Widget _cardDetalhesMinutos(String minutoInicial, String minutoFinal,
      String marcados, String sofridos, String totais) {
    bool isEmpate = double.parse(marcados) == double.parse(sofridos);
    bool isPerda = double.parse(marcados) < double.parse(sofridos);
    Color corBorda = isPerda
        ? Themes.vermelhoClaro
        : isEmpate
            ? Themes.amareloClaro
            : Themes.verdeClaro;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 10, color: corBorda),
          right: BorderSide(width: 1, color: corBorda),
          top: BorderSide(width: 1, color: corBorda),
          bottom: BorderSide(width: 1, color: corBorda),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
      child: Row(
        children: [
          _buildWatch(minutoInicial, minutoFinal),
          const SizedBox(width: 20),
          _buildBarraVertical(100),
          const SizedBox(width: 20),
          _buildQntGol(marcados, sofridos, totais),
        ],
      ),
    );
  }

  Widget _buildQntGol(String marcados, String sofridos, String totais) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              marcados,
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
            Text(
              sofridos,
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
            Text(
              totais,
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Gols marcados',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: 85,
              height: 4,
              child: LinearProgressIndicator(
                color: Themes.verdeClaro,
                backgroundColor: Colors.transparent,
                value: (double.parse(marcados) / 10),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              TipoGol.SOFRIDOS.nome,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: 85,
              height: 4,
              child: LinearProgressIndicator(
                color:Themes.vermelhoClaro,
                backgroundColor: Colors.transparent,
                value: (double.parse(sofridos) / 10),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              TipoGol.TOTAIS.nome,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: 85,
              height: 4,
              child: LinearProgressIndicator(
                color: const Color(0xff0236EC),
                backgroundColor: Colors.transparent,
                value: (double.parse(totais) / 10),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQntGolSugestaoDois(String qntGol, TipoGol tipoGol) {
    String titulo = '';
    Color corBarra = Themes.verdeClaro;
    switch (tipoGol) {
      case TipoGol.FEITOS:
        titulo = 'Gols marcados';
        corBarra =Themes.verdeClaro;
        break;
      case TipoGol.SOFRIDOS:
        titulo = tipoGol.nome;
        corBarra =Themes.vermelhoClaro;
        break;
      case TipoGol.TOTAIS:
        titulo = tipoGol.nome;
        corBarra = const Color(0xff0236EC);
        break;
      default:
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          qntGol,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: 85,
              height: 4,
              child: LinearProgressIndicator(
                color: corBarra,
                backgroundColor: Colors.transparent,
                value: (double.parse(qntGol) / 10),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildWatch(String minutoInicial, String minutoFinal) => Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildBarraHorizontal(20),
              const SizedBox(width: 12),
              Image.asset('assets/icons/watch.png', scale: 2),
              const SizedBox(width: 12),
              _buildBarraHorizontal(20),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                '$minutoInicial\'',
                style: const TextStyle(color: Colors.white, fontSize: 22),
              ),
              const SizedBox(width: 5),
              _buildBarraHorizontal(5),
              const SizedBox(width: 5),
              Text(
                '$minutoFinal\'',
                style: const TextStyle(color: Colors.white, fontSize: 22),
              ),
            ],
          ),
        ],
      );

  Widget _buildMediaGol() => Column(
        children: [
          const Text(
            'Média de 1 gol a cada',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  _buildEstatisticas('Chutes totais', '6,4', Themes.amareloClaro),
                  const SizedBox(height: 20),
                  _buildEstatisticas('Chutes no alvo', '2,3', Themes.azulClaro),
                ],
              ),
              const SizedBox(width: 40),
              Column(
                children: [
                  _buildBarraVertical(70),
                  const SizedBox(height: 20),
                  _buildBarraVertical(70)
                ],
              ),
              const SizedBox(width: 20),
              Column(
                children: [
                  _buildEstatisticas('Ataques', '8,3', Themes.verdeClaro),
                  const SizedBox(height: 20),
                  _buildEstatisticas('Ataques perigosos', '3,1', Themes.vermelhoClaro),
                ],
              ),
            ],
          ),
        ],
      );

  Widget _buildEstatisticas(String titulo, String valor, Color cor) => Column(
        children: [
          Text(
            titulo,
            style: TextStyle(fontSize: 12, color: cor),
          ),
          const SizedBox(height: 5),
          Text(
            valor,
            style: TextStyle(fontSize: 32, color: cor),
          ),
        ],
      );

  Widget _buildGolsTotais(String golTotal, String golTotalDecimal) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Gols Totais',
                style: TextStyle(color: Themes.azulClaro, fontSize: 12),
              ),
              RichText(
                text: TextSpan(
                    text: golTotal,
                    style: const TextStyle(color: Themes.azulClaro, fontSize: 44),
                    children: [
                      TextSpan(
                        text: golTotalDecimal,
                        style: const TextStyle(color: Themes.azulEscuro, fontSize: 14),
                      )
                    ]),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  _buildGolsCasaFora(true, '12', '1,3'),
                  const SizedBox(width: 70),
                  _buildGolsCasaFora(false, '6', '0,6'),
                ],
              ),
              const SizedBox(height: 5),
              //vai de 0 a 1
              _buildBarras(0.8, 0.6, TipoGol.TOTAIS),
            ],
          ),
        ],
      );

  Widget _buildGolsSofridos(String golSofrido, String golSofridoDecimal) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Gols Sofridos',
                style: TextStyle(color: Themes.vermelhoClaro, fontSize: 12),
              ),
              RichText(
                text: TextSpan(
                    text: golSofrido,
                    style: const TextStyle(color: Themes.vermelhoClaro, fontSize: 44),
                    children: [
                      TextSpan(
                        text: golSofridoDecimal,
                        style: const TextStyle(
                            color: Themes.vermelhoEscuro, fontSize: 14),
                      )
                    ]),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  _buildGolsCasaFora(true, '12', '1,3'),
                  const SizedBox(width: 70),
                  _buildGolsCasaFora(false, '6', '0,6'),
                ],
              ),
              const SizedBox(height: 5),
              //vai de 0 a 1
              _buildBarras(0.2, 0.4, TipoGol.SOFRIDOS),
            ],
          ),
        ],
      );

  Widget _buildGolsFeitos(String golFeito, String golFeitoDecimal) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Gols feitos',
                style: TextStyle(color: Themes.verdeClaro, fontSize: 12),
              ),
              RichText(
                text: TextSpan(
                    text: golFeito,
                    style: const TextStyle(color: Themes.verdeClaro, fontSize: 44),
                    children: [
                      TextSpan(
                        text: golFeitoDecimal,
                        style:
                            const TextStyle(color: Themes.verdeEscuro, fontSize: 14),
                      )
                    ]),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  _buildGolsCasaFora(true, '12', '1,3'),
                  const SizedBox(width: 70),
                  _buildGolsCasaFora(false, '6', '0,6'),
                ],
              ),
              const SizedBox(height: 5),
              //vai de 0 a 1
              _buildBarras(0.6, 0.3, TipoGol.FEITOS),
            ],
          ),
        ],
      );
      
  //Widget para criar as barras de porcentagem/estatiticas
  Widget _buildBarras(double? valorCasa, double? valorFora, TipoGol tipoGol) {
    Color casa, fora, background;
    switch (tipoGol) {
      case TipoGol.FEITOS:
        casa = Themes.verdeClaro;
        fora = Themes.verdeEscuro;
        background = const Color(0xff003540);
        break;
      case TipoGol.SOFRIDOS:
        casa = Themes.vermelhoClaro;
        fora = Themes.vermelhoEscuro;
        background = const Color(0xff4B0700);
        break;
      case TipoGol.TOTAIS:
        casa = Themes.azulClaro;
        fora = Themes.azulEscuro;
        background = const Color(0xff161745);
        break;
      default:
        casa = Themes.verdeClaro;
        fora = Themes.verdeEscuro;
        background = const Color(0xff003540);
        break;
    }
    return Row(
      children: [
        Transform.flip(
          flipX: true,
          child: SizedBox(
            width: 100,
            height: 12,
            child: LinearProgressIndicator(
              color: casa,
              backgroundColor: background,
              value: valorCasa,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 100,
          height: 12,
          child: LinearProgressIndicator(
            color: fora,
            value: valorFora,
            backgroundColor: background,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGolsCasaFora(bool isCasa, String gol, String golDecimal) =>
      Column(
        children: [
          Text(
            isCasa ? 'Casa' : 'Fora',
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                gol,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                golDecimal,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      );

  Widget _buildBarraVertical([double? height = 30]) => Container(
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(color: Color(0xff141660), width: 1.5),
          ),
        ),
        height: height,
        child: const Text(''),
      );

  Widget _buildBarraHorizontal([double? width = 30]) => Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xff141660), width: 1.5),
          ),
        ),
        height: 0,
        width: width,
        child: const Text(''),
      );
}
