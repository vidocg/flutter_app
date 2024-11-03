class Validator {
  static password(String? value) {
    bool isValid = value != null && value.isNotEmpty;
    return isValid ? null : "Password should not be blank";
  }

  static email(String? value) {
    bool isValid = value != null && value.isNotEmpty;
    return isValid ? null : "Email should not be blank";
  }
}
