extension StringExtension on String {
  String captalize({bool allWorlds = false}) {
    String text = this;
    if (text.isEmpty) {
      return text;
    }

    if (!allWorlds) {
      return text.substring(0, 1).toUpperCase() + text.substring(1);
    }

    List<String> words = text.split(' ');
    words = words.map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1);
      }
      return '';
    }).toList();

    return words.join(' ');
  }
}
