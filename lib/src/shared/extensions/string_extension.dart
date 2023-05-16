extension StringExtension on String {
  String captalize() {
    String text = this;
    if (text == null || text.isEmpty) {
      return text;
    }
    return text.substring(0, 1).toUpperCase() + text.substring(1);
  }
}
