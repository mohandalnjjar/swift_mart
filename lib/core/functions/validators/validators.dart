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
    if (RegExp(r'^(?=.*[A-Za-z])(?=.*\d).+$').hasMatch(value!)) {
      return null;
    } else {
      return "Strong valid password";
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

  //description Validator
  static String? descriptionValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a description';
    } else if (value.length < 15) {
      return 'Description must be at least 15 characters long';
    } else if (value.length > 500) {
      return 'Description must be 500 characters or less';
    } else {
      return null;
    }
  }
}
