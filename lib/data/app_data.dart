import 'package:date_format_playground/data/app_models.dart';

/// Get name of home view section
String getSectionName(HomeViewSection section) => switch (section) {
  HomeViewSection.cheatsheet => "Cheatsheet",
  HomeViewSection.skeletons => "Skeletons",
  HomeViewSection.reference => "Reference",
  HomeViewSection.about => "About",
};