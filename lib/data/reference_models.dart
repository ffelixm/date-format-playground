/// Enum of all reference section sub-sections
enum ReferenceSectionSubsection {
  year,                // y
  month,               // M, L
  day,                 // d, c, E, D
  hour,                // h, H, k, K
  minute,              // m
  secondAndFractional, // s, S
  rawText,             // ', ''
  other,               // a, Q, G
}


/// Data for a single reference section card
class ReferenceSectionCardData {
  /// Title of this format pattern card
  final String title;

  /// [FormatType] of this format pattern card
  final FormatType formatType;

  /// Basic Format pattern
  final String formatPattern;

  /// List of rows for different format pattern usage cases
  final List<ReferenceSectionCardRowData> rows;

  ReferenceSectionCardData(this.title, this.formatType, this.formatPattern, this.rows);
}


/// Data for a single row of a reference section card
class ReferenceSectionCardRowData {
  /// Usage case specific format pattern
  final String formatPattern;

  /// Description/Explanaition of this usage case
  final String description;

  ReferenceSectionCardRowData(this.formatPattern, this.description);
}


/// Type of format pattern (number/text/text&number)
enum FormatType {
  number,
  text,
  textAndNumber,
}