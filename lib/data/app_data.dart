import 'package:date_format_playground/data/app_models.dart';

/// Get name of home view section
String getSectionName(HomeViewSection section) => switch (section) {
  HomeViewSection.cheatsheet => "Cheatsheet",
  HomeViewSection.skeletons => "Skeletons",
  HomeViewSection.reference => "Reference",
  HomeViewSection.about => "About",
};

/// Get title of home view section
String getSectionTitle(HomeViewSection section) => switch (section) {
  HomeViewSection.cheatsheet => "Cheatsheet of all format symbols",
  HomeViewSection.skeletons => "List of available format skeletons",
  HomeViewSection.reference => "Reference of all formatting patterns",
  HomeViewSection.about => "About this site",
};

final helpDialogContent = """
This website is a playground for experimenting with date formatting in Dart and Flutter
using the intl package.
<br><br>
At the top of the page, you can find the playground. Enter any format pattern to see the results
instantly.
<br>
In the top-right corner, you can toggle between light and dark modes, set the locale for all
date formatting, and start or pause periodic format updates.
<br><br>
The rest of this site is divided into four sections:
<ul>
<li><b>Cheatsheet</b>: A list of all available format symbols.</li>
<li><b>Skeletons</b>: A list of all available skeletons. Skeletons are predefined patterns with
their own constructors that return fully localized results.</li>
<li><b>Reference</b>: A complete reference of all use cases for every format symbol.</li>
<li><b>About</b>: Information about this app.</li>
</ul>""";