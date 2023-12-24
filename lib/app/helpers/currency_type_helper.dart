class CurrencyTypeHelper {
  CurrencyTypeHelper._();
  // const String IN;

  static const int IDR = 1;
  static const int USD = 2;
  static const int SGD = 3;
  static const int EUR = 4;

  static String helperCode(int code) {
    if (code == 1) {
      return 'IDR';
    } else if (code == 2) {
      return 'USD';
    } else if (code == 3) {
      return 'SGD';
    } else {
      return 'EUR';
    }
  }

  static int helperCurrencySymbol(String symbol) {
    if (symbol == 'Rp') {
      return IDR;
    } else if (symbol == r'$') {
      return USD;
    } else if (symbol == r'S$') {
      return SGD;
    } else {
      return EUR;
    }
  }

  static int helperString(String code) {
    code = code.toUpperCase();
    if (code == 'IDR') {
      return IDR;
    } else if (code == 'USD') {
      return USD;
    } else if (code == 'SGD') {
      return SGD;
    } else {
      return EUR;
    }
  }
}
