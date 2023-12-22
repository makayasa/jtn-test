class TransactionTypeHelper {
  TransactionTypeHelper._();
  // const String IN;

  static const int MASUK = 1;
  static const int KELUAR = 2;
  static const int PINDAH = 3;

  static String helperCode(int code) {
    if (code == 1) {
      return 'MASUK';
    } else if (code == 2) {
      return 'KELUAR';
    } else {
      return 'PINDAH';
    }
  }

  static int helperString(String code) {
    code = code.toUpperCase();
    if (code == 'MASUK') {
      return MASUK;
    } else if (code == 'KELUAR') {
      return KELUAR;
    } else {
      return PINDAH;
    }
  }
}
