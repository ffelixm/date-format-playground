import 'package:date_format_playground/data/skeletons_models.dart';

final skeletonsExplaination1 = 
"Skeletons are predefined format patterns. Each of them has its own ICU name "
"which defines its meaning. What distinguishes them from normal format patterns "
"is that they are parsed as a whole. Because of this, they can also be localized "
"as a whole. In contrast to a normal pattern like <code>'M/d/y'</code> which "
"when parsed consists of year, month and day seperated by slashes in all "
"locales, the parsing process of skeletons considers cultural differences in "
"the presentation of dates. So the example format would be parsed as "
"<code>7/11/2025</code> in all locales. The skeleton <code>yMd</code> would be "
"parsed in German for example as <code>11.7.2025</code> which fits better into "
"the respective language."
"<br><br>"
"To use skeletons, just use the named constructor of <code>DateTime</code> for "
"a specific skeleton. You can also pass in the format pattern or the ICU name "
"(which is available as constant in the intl library) into the <code>format</code> "
"function:";

final skeletonsExampleCode = """
DateFormat.yMd('de').format(DateTime.now());
DateFormat(YEAR_NUM_MONTH_DAY, 'es').format(DateTime.now());
DateFormat('yMd', 'fr').format(DateTime.now());""";

final skeletonsExplaination2 =
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