class ValidateUtils {

  static bool validatorEmail({required String email}) {
    final RegExp emailValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailValidatorRegExp.hasMatch(email);
  }
}