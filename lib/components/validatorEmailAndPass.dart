class Validator {
  String? validateEmail(String? email){
    RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid){
      return '   Please enter a valid email';
    }
    return null;
  }
  String? validatePassword(String? password){
    if (password!.length < 8){
      return '   The password must consist of 8 characters';
    }
    return null;
  }
  String? validateIsEmpty(String? text){
    if (text!.isEmpty) {
      return '   Empty field';
    }
    return null;
  }
  String? validateRepeatPassword(String? repeatPassword, String? firstPassword){
    if (repeatPassword != firstPassword) {
      return '   The password doesn`t match';
    }
    return null;
  }
  String? validateNumberPhone(String? numberPhone){
    if (numberPhone!.length < 12 || !numberPhone.contains('+')) {
      return '   Invalid number: (count = 12 or >) and (+)';
    }
    return null;
  }
}