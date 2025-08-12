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
This webseite is intended to be a playground for date formatting in Dart/Flutter
using the intl package.
<br><br>
On top you can see the playground. Input any format pattern and see the result
immediately.
<br>
In the top right corner you can toggle light/dark mode, set the locale for all
date formatting and play/pause periodic format updates.
<br><br>
The rest of this site is divided into 4 sections:
<ul>
<li><b>Cheatsheet</b>: List of all available format symbols</li>
<li><b>Skeletons</b>: List of all available skeletons. Skeletons are presets with
an own constructor and returns real localized results</li>
<li><b>Reference</b>: Full reference of all usage cases of all format symbols</li>
<li><b>About</b>: About this app</li>
</ul>""";