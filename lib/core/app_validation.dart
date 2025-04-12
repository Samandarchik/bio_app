class AppValidation {
  static emailValidate(String email) {
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\.)+[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])*$");
    final validation = regex.hasMatch(email);
    return validation;
  }

  static mobileNumberValidate(String mobileNumber) {
    RegExp regex = RegExp(r"(^(?:[+0]9)?[0-9]{1,12}$)");
    final validation = regex.hasMatch(mobileNumber);
    return validation;
  }
  static  mobileNumberUzbValidate(String mobileNumber) {
    RegExp regex = RegExp(
        r"^(?:\+998|998)?(?:33|55|77|88|90|91|93|94|95|97|98|99|20)[0-9]{7}$"
    );
    return regex.hasMatch(mobileNumber);
  }

  static passwordValidate(String password) {
    RegExp regex = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
    final validation = regex.hasMatch(password);
    return validation;
  }
}