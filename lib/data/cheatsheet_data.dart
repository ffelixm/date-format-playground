import 'package:date_format_playground/data/cheatsheet_models.dart';

final cheatsheetNote = 
"The following table provides an overview about all available format symbols. "
"Note that some of these symbols also exist as skeletons, but the examples below "
"are formatted as if the symbols were part of a larger pattern.";

List<String> get cheatsheetDataTitles => [
  "Symbol",
  "Meaning",
  "Output",
  "Example"
];

/// List of format symbols for cheatsheet
/// 
/// Data source: https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html
List<CheatsheetRowData> get cheatsheetData => [
  CheatsheetRowData("G",  "Era designator",        "Text",           "G"),
  CheatsheetRowData("y",  "Year",                  "Number",         "y"),
  CheatsheetRowData("M",  "Month in year",         "Text or Number", "M"),
  CheatsheetRowData("L",  "Standalone month",      "Text or Number", "L"),
  CheatsheetRowData("d",  "Day in month",          "Number",         "d"),
  CheatsheetRowData("c",  "Standalone day",        "Text",           "c"),
  CheatsheetRowData("h",  "Hour in am/pm (1~12)",  "Number",         "h"),
  CheatsheetRowData("H",  "Hour in day (0~23)",    "Number",         "H"),
  CheatsheetRowData("m",  "Minute in hour",        "Number",         "m"),
  CheatsheetRowData("s",  "Second in minute",      "Number",         "s"),
  CheatsheetRowData("S",  "Fractional second",     "Number",         "S"),
  CheatsheetRowData("E",  "Day of week",           "Text",           "E"),
  CheatsheetRowData("D",  "Day in year",           "Number",         "D"),
  CheatsheetRowData("a",  "AM/PM marker",          "Text",           "a"),
  CheatsheetRowData("k",  "Hour in day (1~24)",    "Number",         "k"),
  CheatsheetRowData("K",  "Hour in am/pm (0~11) ", "Number",         "K"),
  CheatsheetRowData("Q",  "Quarter",               "Text or Number", "Q"),
  CheatsheetRowData("'",  "Escape for text",       "Delimiter",      "'text'"),
  CheatsheetRowData("''", "Single quote",          "Literal",        "''"),
];