import 'package:date_format_playground/data/section_models.dart';

/// Get name of home view section
String getSectionName(HomeViewSection section) => switch (section) {
  HomeViewSection.overview => "Overview",
  HomeViewSection.cheatsheet => "Cheatsheet",
  HomeViewSection.skeletons => "Skeletons",
  HomeViewSection.reference => "Reference",
  HomeViewSection.about => "About",
};