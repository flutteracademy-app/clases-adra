class Validator {
  Validator();

  String? email(String? value) {
    String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Email Válido';
    } else {
      return null;
    }
  }

  String? name(String? value) {
    String pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Name invalid';
    } else {
      return null;
    }
  }

  String? password(String? value) {
    String pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Password Valido';
    } else {
      return null;
    }
  }
}
