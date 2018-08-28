class ValidationMixin {
  String validateEmail(String value) {
    if (!value.contains('@')) {
      return 'Please enter valied email address';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length < 4) {
      return 'Password is too short';
    }
    return null;
  }
}
