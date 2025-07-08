import 'package:date_format_playground/data/reference_models.dart';


/// Get display name of given [FormatType]
String getFormatTypeName(FormatType formatType) => switch (formatType) {
  FormatType.number => "Number",
  FormatType.text => "Text",
  FormatType.textAndNumber => "Text & Number",
};


/// Get display name of given [ReferenceSectionSubsection]
String getReferenceSectionName(ReferenceSectionSubsection section) => switch (section) {
  ReferenceSectionSubsection.year => "Year",
  ReferenceSectionSubsection.month => "Month",
  ReferenceSectionSubsection.day => "Day",
  ReferenceSectionSubsection.hour => "Hour",
  ReferenceSectionSubsection.minute => "Minute",
  ReferenceSectionSubsection.secondAndFractional => "Second & Fractional Second",
  ReferenceSectionSubsection.rawText => "Raw Text",
  ReferenceSectionSubsection.other => "Other",
};


/// Get reference section data for given [ReferenceSectionSubsection]
List<ReferenceSectionCardData> getReferenceSectionCardData(ReferenceSectionSubsection section) => switch (section) {
  ReferenceSectionSubsection.year => [
    ReferenceSectionCardData(
      "Year", FormatType.number, "y",
      [
        ReferenceSectionCardRowData("y", "Year as a number"),
        ReferenceSectionCardRowData("yy", "Short year (only last 2 digits)"),
        ReferenceSectionCardRowData("yyyy", "Full year, displayed with 4 digits"),
        ReferenceSectionCardRowData("yyyyy", "5 or more characters: full year as a number with at least n digits, padded with leading zeros"),
      ],
    ),
  ],
  ReferenceSectionSubsection.month => [
    ReferenceSectionCardData(
      "Month", FormatType.textAndNumber, "M",
      [
        ReferenceSectionCardRowData("M", "Month in year as a number"),
        ReferenceSectionCardRowData("MM", "Month in year as a 2-digit number with leading zero"),
        ReferenceSectionCardRowData("MMM", "Short form of month name (3 letters)"),
        ReferenceSectionCardRowData("MMMM", "Long name of month"),
        ReferenceSectionCardRowData("MMMMM", "First letter of month name"),
        ReferenceSectionCardRowData("MMMMMM", "6 or more characters: month in year with at least n digits, padded with leading zeros"),
      ],
    ),
    ReferenceSectionCardData(
      "Standalone month", FormatType.textAndNumber, "L",
      [
        ReferenceSectionCardRowData("LLL", "Short form of standalone month name (3 letters)"),
        ReferenceSectionCardRowData("LLLL", "Long standalone month name"),
        ReferenceSectionCardRowData("LLLLL", "First letter of standalone month name"),
      ],
    ),
  ],
  ReferenceSectionSubsection.day => [
    ReferenceSectionCardData(
      "Day", FormatType.number, "d",
      [
        ReferenceSectionCardRowData("d", "Day in month as a number"),
        ReferenceSectionCardRowData("dd", "2 or more characters: day in month as a number with at least n digits, padded with leading zeros if necessary"),
      ],
    ),
    ReferenceSectionCardData(
      "Standalone day", FormatType.number, "c",
      [
        ReferenceSectionCardRowData("ccc", "Short standalone day name"),
        ReferenceSectionCardRowData("cccc", "Long standalone day name"),
        ReferenceSectionCardRowData("ccccc", "First letter of standalone day name"),
      ],
    ),
    ReferenceSectionCardData(
      "Weekday", FormatType.text, "E",
      [
        ReferenceSectionCardRowData("E", "Short form of EEE; displays short weekday name"),
        ReferenceSectionCardRowData("EEE", "Short weekday name"),
        ReferenceSectionCardRowData("EEEE", "Long weekday name"),
        ReferenceSectionCardRowData("EEEEE", "First letter of weekday name"),
      ],
    ),
    ReferenceSectionCardData(
      "Day in year", FormatType.text, "D",
      [
        ReferenceSectionCardRowData("D", "Day in year as a number"),
        ReferenceSectionCardRowData("DDDD", "2 or more characters: day in year as a number with at least n digits, padded with leading zeros if necessary"),
      ],
    ),
  ],
  ReferenceSectionSubsection.hour => [
    ReferenceSectionCardData(
      "Hour in am/pm", FormatType.number, "h/K",
      [
        ReferenceSectionCardRowData("h", "Hour in am/pm as a number (1-12)"),
        ReferenceSectionCardRowData("hh", "2 or more characters: hour in am/pm (1-12) as a number with at least n digits, padded with leading zeros if necessary"),
        ReferenceSectionCardRowData("K", "Hour in am/pm as a number (0-11)"),
        ReferenceSectionCardRowData("KK", "2 or more characters: hour in am/pm (0-11) as a number with at least n digits, padded with leading zeros if necessary"),
      ],
    ),
    ReferenceSectionCardData(
      "Hour in day", FormatType.number, "H/k",
      [
        ReferenceSectionCardRowData("H", "Hour in day as a number (0-23)"),
        ReferenceSectionCardRowData("HH", "2 or more characters: hour in day (0-23) as a number with at least n digits, padded with leading zeros if necessary"),
        ReferenceSectionCardRowData("k", "Hour in day as a number (1-24)"),
        ReferenceSectionCardRowData("kk", "2 or more characters: hour in day (1-24) as a number with at least n digits, padded with leading zeros if necessary"),
      ],
    ),
  ],
  ReferenceSectionSubsection.minute => [
    ReferenceSectionCardData(
      "Minute", FormatType.number, "m",
      [
        ReferenceSectionCardRowData("m", "Minute in hour as a number"),
        ReferenceSectionCardRowData("mm", "2 or more characters: minute in hour as a number with at least n digits, padded with leading zeros if necessary"),
      ],
    ),
  ],
  ReferenceSectionSubsection.secondAndFractional => [
    ReferenceSectionCardData(
      "Second", FormatType.number, "s",
      [
        ReferenceSectionCardRowData("s", "Second in minute as a number"),
        ReferenceSectionCardRowData("ss", "2 or more characters: second in minute as a number with at least n digits, padded with leading zeros if necessary"),
      ],
    ),
    ReferenceSectionCardData(
      "Fractional second", FormatType.number, "S",
      [
        ReferenceSectionCardRowData("S", "Short form of SSS; displays fractional seconds as a 3-digit number"),
        ReferenceSectionCardRowData("SSS", "Fractional second as a 3-digit number"),
        ReferenceSectionCardRowData("SSSS", "4 or more characters: fractional second as a 3-digit number with trailing zeros"),
      ],
    ),
  ],
  ReferenceSectionSubsection.rawText => [
    ReferenceSectionCardData(
      "Raw text", FormatType.text, "'",
      [
        ReferenceSectionCardRowData("'some text'", "Escapes raw text"),
        ReferenceSectionCardRowData("''", "Single quote"),
      ],
    ),
  ],
  ReferenceSectionSubsection.other => [
    ReferenceSectionCardData(
      "AM/PM marker", FormatType.text, "a",
      [ReferenceSectionCardRowData("a", "AM/PM marker")],
    ),
    ReferenceSectionCardData(
      "Quarter", FormatType.textAndNumber, "Q",
      [
        ReferenceSectionCardRowData("Q", "Quarter as a number"),
        ReferenceSectionCardRowData("QQ", "Quarter as a 2-digit number with leading zero"),
        ReferenceSectionCardRowData("QQQ", "Short form of quarter (Q1-Q4)"),
        ReferenceSectionCardRowData("QQQQ", "Full name of quarter"),
        ReferenceSectionCardRowData("QQQQQ", "5 or more characters: quarter as a number with at least n digits, padded with leading zeros"),
      ],
    ),
    ReferenceSectionCardData(
      "Era", FormatType.text, "G",
      [
        ReferenceSectionCardRowData("G", "Short era name"),
        ReferenceSectionCardRowData("GGGG", "Long era name"),
      ],
    ),
  ],
};