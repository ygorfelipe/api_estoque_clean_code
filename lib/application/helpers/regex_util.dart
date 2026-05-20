sealed class RegexUtil {


  static String cepRegex({required String? cep}) {
    if (cep != null) {
      final resultNumber = cep.replaceAll(RegExp(r'[.-]'), '');

      return resultNumber.toString();
    }
    return '';
  }

  static String removerExtensao(String filename) {
     return filename.replaceFirst(RegExp(r'\.[^.]+$'), '');
  }
}
