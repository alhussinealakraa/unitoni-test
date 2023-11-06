class TextFieldValidator {
  static String? validateLastName(String? value) {
    var regExp = RegExp(r"^[A-Za-z\u00c0-\u017e\'\-]+$");
    var errorMsg = 'last_name_empty';
    var minLenErrorMsg = 'last_name_short';
    var maxLenErrorMsg = 'last_name_long';
    var invalidMsg = 'last_name_invalid';
    if (value == null || value == '') {
      return errorMsg;
    }
    return !regExp.hasMatch(value)
        ? invalidMsg
        : (value.length >= 2 && value.length <= 26 && regExp.hasMatch(value))
            ? null
            : (value.isNotEmpty && value.length > 26 && regExp.hasMatch(value))
                ? maxLenErrorMsg
                : minLenErrorMsg;
  }

  // This method check whether phone number is valid or not
  static String? validatePhoneNumber(String? value) {
    var errorMsg = 'phone number should be less than 15 numbers only';
    if (value == null || value.isEmpty) {
      return errorMsg;
    }
    return (value.length > 6 && value.length <= 15) ? null : errorMsg;
  }


  static String? validateText(String? value) {
    var errorMsg = 'field_empty';

    if (value!.isEmpty) {
      return errorMsg;
    }

    return null;
  }


  static String? validateNumber(String? value) {
    var errorMsg = 'field_empty';
    var maxLenErrorMsg = 'number_too_long';

    if (value == null) {
      return errorMsg;
    }

    if (value.length > 9) {
      return maxLenErrorMsg;
    }

    return null;
  }

  // This method check whether user name is valid or not
  static String? validateUserName(String? value) {
    var invalidCharacterError = 'invalid_character';
    var errorMsg = 'user_name_empty';
    var minLenErrorMsg = 'user_name_short';

    if (value == null || value.isEmpty) {
      return errorMsg;
    }
    if (value.length < 3) {
      return minLenErrorMsg;
    } else {
      if (RegExp(r'^[a-zA-Z0-9@]+$').hasMatch(value) &&
          ('@'.allMatches(value).length <= 1)) {
        if (('@'.allMatches(value).length == 1 && value[0] == '@' ||
            ('@'.allMatches(value).isEmpty))) {
          return null;
        }
      }
      return invalidCharacterError;
    }
  }

  // This method check whether description is valid or not
  static String? validateDescription(String? value) {
    var errorMsg = 'description_empty';
    var minLenErrorMsg = 'description_short';
    var maxLenErrorMsg = 'description_long';

    if (value == null) {
      return errorMsg;
    }

    if (value.length < 20) {
      return minLenErrorMsg;
    }

    if (value.length > 300) {
      return maxLenErrorMsg;
    }

    return null;
  }

  // This method check whether document number is valid or not
  static String? validateDocumentNumber(String? value) {
    var errorMsg = 'field_empty';
    var minLenErrorMsg = 'text_short';
    var maxLenErrorMsg = 'text_long';

    if (value == null || value.isEmpty) {
      return errorMsg;
    }

    if (value.length < 3) {
      return minLenErrorMsg;
    }

    if (value.length > 40) {
      return maxLenErrorMsg;
    }

    return null;
  }

  // This method check whether percent is valid or not
  static String? validatePercent(String? value) {
    var errorMsg = 'field_empty';
    var maxLenErrorMsg = 'text_long';
    var percentErrorMsg = 'out_of_range';

    if (value == null || value.isEmpty) {
      return errorMsg;
    }
    if (double.parse(value) > 100 || double.parse(value) < 0) {
      return percentErrorMsg;
    }
    return (value.length <= 2 && value.length > 0) ? null : maxLenErrorMsg;
  }

  // This method check whether first name is valid or not
  static String? validateFirstName(String? value) {
    var errorMsg = 'field_empty';
    var minLenErrorMsg = 'first_name_short';
    var maxLenErrorMsg = 'first_name_long';

    if (value == null) {
      return errorMsg;
    }

    if (value.length < 2) {
      return minLenErrorMsg;
    }

    if (value.length > 40) {
      return maxLenErrorMsg;
    }

    return null;
  }


  // This method check whether second name is valid or not
  static String? validateSecondName(String? value) {
    var errorMsg = 'field_empty';
    var minLenErrorMsg = 'second_name_short';
    var maxLenErrorMsg = 'second_name_long';

    if (value == null) {
      return errorMsg;
    }

    if (value.length < 2) {
      return minLenErrorMsg;
    }

    if (value.length > 40) {
      return maxLenErrorMsg;
    }

    return null;
  }

  // This method check whether family is valid or not
  static String? validateFamilyName(String? value) {
    var errorMsg = 'field_empty';
    var minLenErrorMsg = 'family_name_short';
    var maxLenErrorMsg = 'family_name_long';

    if (value == null) {
      return errorMsg;
    }

    if (value.length < 2) {
      return minLenErrorMsg;
    }

    if (value.length > 40) {
      return maxLenErrorMsg;
    }

    return null;
  }

  // This method check whether expiry date is valid or not
  static String? validateExpiryDate(String? value) {
    var errorMsg = 'field_empty';

    if (value!.isEmpty) {
      return errorMsg;
    }

    return null;
  }

  // This method check whether country is selected or not
  static String? validateNationality(String? value) {
    var errorMsg = 'field_empty';

    if (value!.isEmpty) {
      return errorMsg;
    }

    return null;
  }


  // This method checks whether email is valid or not

  static String? validateEmail(String? value) {
    var errorMsg2 = 'add email_error_message';
    var errorMsg1 = 'email require';

    if (value!.isEmpty) {
      return errorMsg1;
    } else {
      final emailValidate = RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(value);

      if (!emailValidate) {
        return errorMsg2;
      } else {
        return null;
      }
    }
  }

  static String? validateRequiredEmail(String? value) {
    var errorMsg = 'empty_email';
    var errorMsg2 = 'add_email_error_message';

    if (value!.isEmpty) {
      return errorMsg;
    } else {
      final emailValidate = RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(value);

      if (!emailValidate) {
        return errorMsg2;
      } else {
        return null;
      }
    }
  }

  static String? validatePassword(String? value) {
    var errorMsg = 'password require';
    var invalidMsg = 'password invalid_message';
    final regExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,}$');

    if (value == null || value.isEmpty) {
      return errorMsg;
    }
    return /*!regExp.hasMatch(value) ? invalidMsg :*/ null;
  }

  static String? validateConfirmPassword(String? value, String? confirmValue) {
    var errorMsg = 'password require';
    var invalidMsg = 'password_invalid_message';
    var invalidConfirmMsg = 'password does not match';
    final regExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,}$');

    if (value == null || value.isEmpty) {
      return errorMsg;
    }

    var res = /*(regExp.hasMatch(value)) &&*/ !(value == confirmValue)
        ? invalidConfirmMsg
        // : !regExp.hasMatch(value)
        //     ? invalidMsg
            : null;
    return res;
  }
}
