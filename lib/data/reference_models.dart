// https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html
// 
// Symbol   Meaning                Presentation       Example
// ------   -------                ------------       -------
// G        era designator         (Text)             AD
// y        year                   (Number)           1996
// M        month in year          (Text & Number)    July & 07
// L        standalone month       (Text & Number)    July & 07
// d        day in month           (Number)           10
// c        standalone day         (Number)           10
// h        hour in am/pm (1~12)   (Number)           12
// H        hour in day (0~23)     (Number)           0
// m        minute in hour         (Number)           30
// s        second in minute       (Number)           55
// S        fractional second      (Number)           978
// E        day of week            (Text)             Tuesday
// D        day in year            (Number)           189
// a        am/pm marker           (Text)             PM
// k        hour in day (1~24)     (Number)           24
// K        hour in am/pm (0~11)   (Number)           0
// Q        quarter                (Text)             Q3
// '        escape for text        (Delimiter)        'Date='
// ''       single quote           (Literal)          'o''clock'


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
  /// Title of this format code card
  final String title;

  /// [FormatType] of this format code card
  final FormatType formatType;

  /// Basic Format code
  final String formatCode;

  /// List of rows for different format code usage cases
  final List<ReferenceSectionCardRowData> rows;

  ReferenceSectionCardData(this.title, this.formatType, this.formatCode, this.rows);
}


/// Data for a single row of a reference section card
class ReferenceSectionCardRowData {
  /// Usage case specific format code
  final String formatCode;

  /// Description/Explainaition of this usage case
  final String description;

  ReferenceSectionCardRowData(this.formatCode, this.description);
}


/// Type of format code (number/text/text&number)
enum FormatType {
  number,
  text,
  textAndNumber,
}