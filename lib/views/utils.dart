class Utils {
  static String? upper(String? text) {
    return text != null ? text[0].toUpperCase() + text.substring(1) : text;
  }
}
