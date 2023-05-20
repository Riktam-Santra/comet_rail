enum Lang {
  cht,
  cn,
  de,
  en,
  es,
  fr,
  id,
  jp,
  kr,
  pt,
  ru,
  th,
  vi;

  @override
  String toString() {
    switch (this) {
      case Lang.cht:
        return 'cht';
      case Lang.cn:
        return 'cn';
      case Lang.de:
        return 'de';
      case Lang.en:
        return 'en';
      case Lang.es:
        return 'es';
      case Lang.fr:
        return 'fr';
      case Lang.id:
        return 'id';
      case Lang.jp:
        return 'jp';
      case Lang.kr:
        return 'kr';
      case Lang.pt:
        return 'pt';
      case Lang.ru:
        return 'ru';
      case Lang.th:
        return 'th';
      case Lang.vi:
        return 'vi';
    }
  }
}
