import 'package:date_format_playground/data/skeletons_models.dart';

final skeletonsExplanation1 = 
"Skeletons are predefined date and time format patterns, each with its own ICU "
"name that defines its meaning. Unlike regular format patterns, skeletons are "
"interpreted as a whole, which allows them to be fully localized across different "
"languages and regions. "
"By contrast, a normal pattern like <code>'M/d/y'</code> always represents the same "
"structure—month, day, and year separated by slashes—regardless of locale. "
"This means that the date <code>7/11/2025</code> would always look the same in all "
"locales when using that pattern. "
"Skeletons, however, automatically adjust to cultural date conventions. For example, "
"the skeleton <code>yMd</code> (in English formatted as <code>7/11/2025</code>) would "
"be formatted as <code>11.7.2025</code> in German, which aligns better with local expectations."
"<br><br>"
"To use skeletons, call the named constructor of <code>DateFormat</code> for the desired "
"skeleton. You can also pass a format pattern or an ICU skeleton name directly "
"(intl library provides these as constants) to the <code>format</code> function:";


final skeletonsExampleCode = """
DateFormat.yMd('de').format(DateTime.now());
DateFormat(YEAR_NUM_MONTH_DAY, 'es').format(DateTime.now());
DateFormat('yMd', 'fr').format(DateTime.now());""";

final skeletonsExplanation2 =
"Don't forget to initialize locales before using them! To do this, just "
"call <code>initializeDateFormatting()</code> in <code>main</code>.";


List<String> get skeletonsDataTitles => [
  "ICU name",
  "Format pattern",
  "Formatted DateTime",
];

/// List of all available skeletons
/// 
/// Data source: https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html
List<SkeletonData> get skeletonsData => [
  SkeletonData("DAY",                         "d"),
  SkeletonData("ABBR_WEEKDAY",                "E"),
  SkeletonData("WEEKDAY",                     "EEEE"),
  SkeletonData("ABBR_STANDALONE_MONTH",       "LLL"),
  SkeletonData("STANDALONE_MONTH",            "LLLL"),
  SkeletonData("NUM_MONTH",                   "M"),
  SkeletonData("NUM_MONTH_DAY",               "Md"),
  SkeletonData("NUM_MONTH_WEEKDAY_DAY ",      "MEd"),
  SkeletonData("ABBR_MONTH",                  "MMM"),
  SkeletonData("ABBR_MONTH_DAY",              "MMMd"),
  SkeletonData("ABBR_MONTH_WEEKDAY_DAY",      "MMMEd"),
  SkeletonData("MONTH",                       "MMMM"),
  SkeletonData("MONTH_DAY",                   "MMMMd"),
  SkeletonData("MONTH_WEEKDAY_DAY",           "MMMMEEEEd"),
  SkeletonData("ABBR_QUARTER",                "QQQ"),
  SkeletonData("QUARTER",                     "QQQQ"),
  SkeletonData("YEAR",                        "y"),
  SkeletonData("YEAR_NUM_MONTH",              "yM"),
  SkeletonData("YEAR_NUM_MONTH_DAY",          "yMd"),
  SkeletonData("YEAR_NUM_MONTH_WEEKDAY_DAY ", "yMEd"),
  SkeletonData("YEAR_ABBR_MONTH",             "yMMM"),
  SkeletonData("YEAR_ABBR_MONTH_DAY",         "yMMMd"),
  SkeletonData("YEAR_ABBR_MONTH_WEEKDAY_DAY", "yMMMEd"),
  SkeletonData("YEAR_MONTH",                  "yMMMM"),
  SkeletonData("YEAR_MONTH_DAY",              "yMMMMd"),
  SkeletonData("YEAR_MONTH_WEEKDAY_DAY",      "yMMMMEEEEd"),
  SkeletonData("YEAR_ABBR_QUARTER",           "yQQQ"),
  SkeletonData("YEAR_QUARTER",                "yQQQQ"),
  SkeletonData("HOUR24",                      "H"),
  SkeletonData("HOUR24_MINUTE",               "Hm"),
  SkeletonData("HOUR24_MINUTE_SECOND",        "Hms"),
  SkeletonData("HOUR",                        "j"),
  SkeletonData("HOUR_MINUTE",                 "jm"),
  SkeletonData("HOUR_MINUTE_SECOND  ",        "jms"),
  SkeletonData("MINUTE",                      "m"),
  SkeletonData("MINUTE_SECOND",               "ms"),
  SkeletonData("SECOND",                      "s"),
];