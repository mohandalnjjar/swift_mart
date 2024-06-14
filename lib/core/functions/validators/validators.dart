abstract class Validators {
  //email validator
  static String? emailValidator(String? value) {
    if (RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(value!)) {
      return null;
    } else {
      return "enter a valid email";
    }
  }

  //Password validator
  static String? passwordValidator(String? value) {
    if (RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
        .hasMatch(value!)) {
      return null;
    } else {
      return "enter a valid password";
    }
  }

  //name validator
  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter Corrct Name';
    } else if (value.length < 3 || value.length > 20) {
      return 'Enter Name between 3 to 20 characters';
    } else {
      return null;
    }
  }
}
 