class Validator {
  static var instance = Validator();

  bool emailValidator(String value) {
    bool showMessage;
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-\_]+(\.[a-zA-Z]+)*$");

    if (emailRegExp.hasMatch(value)) {
      showMessage = false;
    } else {
      showMessage = true;
    }
    return showMessage;
  }

  bool phoneValidator(String value) {
    bool showMessage;
    RegExp _anyLetter = RegExp(r'[A-Za-z]');
    final RegExp _phoneRegExp = RegExp(r'^\d{7,15}$');

    if (!_anyLetter.hasMatch(value) && _phoneRegExp.hasMatch(value)) {
      showMessage = false;
    } else {
      showMessage = true;
    }
    return showMessage;
  }

  bool passwordValidator(String value) {
    bool showMessage;

    if (value.length >= 8) {
      showMessage = false;
    } else {
      showMessage = true;
    }
    return showMessage;
  }

  bool generalValidator(String value) {
    bool showMessage;

    if (value.isEmpty) {
      showMessage = true;
    } else {
      showMessage = false;
    }
    return showMessage;
  }
  bool numbarValidator(String value) {
    bool showMessage;
    RegExp _anyLetter = RegExp(r'[A-Za-z]');
    RegExp _englishNumbers =  RegExp(r'[0-9]');

    if (!_anyLetter.hasMatch(value)) {
      showMessage = false;
    } else {
      showMessage = true;
    }
    return showMessage;
  }

  bool textLanguageTypeValidator(String value) {
    bool showMessage;
    final RegExp _alphaExp = RegExp('[a-zA-Z]');

    if (!_alphaExp.hasMatch(value)) {
      showMessage = true;
    } else {
      showMessage = false;
    }
    return showMessage;
  }

  bool dateValidator(String value) {
    bool showMessage;

    if (value.isEmpty) {
      showMessage = true;
    } else {
      showMessage = false;
    }
    return showMessage;
  }

  String formatPhoneNumber(String phoneNumber) {
    print("Before:"+phoneNumber);
    if (phoneNumber.startsWith('+9660')) {
      phoneNumber = phoneNumber.replaceFirst('0', '');
    }
    print("After:"+phoneNumber);
    return phoneNumber;
  }

  bool checkPriceValue(value) {
    bool showMessage;


    if (value < 10000) {
      showMessage = true;
    } else {
      showMessage = false;
    }
    return showMessage;
  }

  String replacePlusWithCountryCode(String phoneNumber) {


    if (phoneNumber.startsWith('+')) {
      String fullNum = "00${phoneNumber.substring(1)}";
      print("fullNum $fullNum");
      return fullNum;
    } else {
      return phoneNumber;
    }
  }

}
