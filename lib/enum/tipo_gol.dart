enum TipoGol { FEITOS, SOFRIDOS, TOTAIS, CASA, FORA, GERAL }

extension TipoGolExtension on TipoGol {
  String get nome {
    switch (this) {
      case TipoGol.FEITOS:
        return 'Gols Feitos';
      case TipoGol.SOFRIDOS:
        return 'Gols Sofridos';
      case TipoGol.TOTAIS:
        return 'Gols Totais';
      case TipoGol.CASA:
        return 'Casa';
      case TipoGol.FORA:
        return 'Fora';
      case TipoGol.GERAL:
        return 'Geral';
    }
  }
}
