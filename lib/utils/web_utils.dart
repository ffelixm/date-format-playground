import 'package:web/web.dart' as web;

const String formatPatternParam = 'pattern';

/// Retrieve the format param from URL
String? getFormatPatternParam() {
  var formatParam = Uri.base.queryParameters[formatPatternParam];

  if (formatParam != null) {
    return Uri.decodeQueryComponent(formatParam);
  }
  return null;
}

/// Generate a share URL for a given [formatPattern]
String getFormatPatternShareUrl(String formatPattern) {
  return '${Uri.base.origin}${Uri.base.path}?$formatPatternParam=${Uri.encodeQueryComponent(formatPattern)}';
}

/// Update current URL according to given [formatPattern]
void updateFormatPattern(String formatPattern) {
  final uri = Uri.base;
  
  // Copy current query paramters
  var newQueryParameters = Map<String, String>.from(uri.queryParameters);
  // Remove old format param and add new one only if it is not empty
  newQueryParameters.remove(formatPatternParam);
  if (formatPattern.isNotEmpty) {
    newQueryParameters[formatPatternParam] = formatPattern;
  }

  // Generate new URL: add params if not empty, otherwise set no params
  String newUrl;
  if (newQueryParameters.isEmpty) {
    newUrl = uri.origin + uri.path;
  } else {
    newUrl = uri.replace(queryParameters: newQueryParameters).toString();
  }

  // Set new URL
  web.window.history.replaceState(null, '', newUrl);
}