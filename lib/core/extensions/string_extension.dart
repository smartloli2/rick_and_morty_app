extension StringExtension on String {
  String get capitalize {
    if (isEmpty) return '';
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

extension NullableStringExtension on String? {
  static final RegExp whitespacePattern = RegExp(r'\s');

  bool get hasWhitespaces => whitespacePattern.hasMatch(this ?? '');

  /// Returns true if string is: null, empty or whitespace string.
  bool get isNullEmptyOrWhitespace =>
      this == null || this!.isEmpty || this!.trim().isEmpty;
}
