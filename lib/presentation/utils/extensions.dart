extension DoubleFormating on double {
  String formatDecimal() {
    if (this % 1.0 != 0.0) {
      return toStringAsFixed(2);
    } else {
      return toStringAsFixed(0);
    }
  }
}

extension IntFormatting on int? {
  DateTime fromMinutes() {
    int hours = (this ?? 0) ~/ 60;
    int minutes = (this ?? 0) % 60;

    return DateTime(2024, 1, 1, hours, minutes);
  }
}

const easternArabicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩', 'ص' , 'م' , ''];
const westernArabicDigits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'P', 'M'];

extension StringExtensions on String {
  String convertArabicToEnglishNumerals() {
    String output = this;
    for (int i = 0; i < easternArabicDigits.length - 3; i++) {
      output =
          output.replaceAll(easternArabicDigits[i], westernArabicDigits[i]);
    }
    return output;
  }
  String convertEnglishToArabicNumerals() {
    String output = this;
    for (int i = 0; i < westernArabicDigits.length; i++) {
      output =
          output.replaceAll(westernArabicDigits[i], easternArabicDigits[i]);
    }
    return output;
  }

  String validateNumeralsInput() {
    String output = this;
    if (output.length == 1 &&
        !easternArabicDigits.contains(output[0]) &&
        !westernArabicDigits.contains(output[0])) {
      return '';
    }
    int decimalCount = output.split('').where((char) => char == '.').length;
    if (decimalCount > 1) {
      return output.substring(0, output.length - 1); // Remove last character
    }

    for (var char in output.split('')) {
      if (!westernArabicDigits.contains(char) &&
          char != '.' &&
          !easternArabicDigits.contains(char)) {
        return output.substring(0, output.length - 1);
      }
    }
    return output;
  }
}
