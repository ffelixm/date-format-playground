import 'package:web/web.dart' as web;

/// Retrieve the format param from URL
String? getFormatParam() {
  var formatParam = Uri.base.queryParameters['format'];

  if (formatParam != null) {
    return Uri.decodeQueryComponent(formatParam);
  }
  return null;
}

/// Generate a share URL for a given [formatCode]
String getFormatShareUrl(String formatCode) {
  return '${Uri.base.origin}${Uri.base.path}?format=${Uri.encodeQueryComponent(formatCode)}';
}

/// Update current URL according to given [formatCode]
void updateFormatParam(String formatCode) {
  final uri = Uri.base;
  
  // Copy current query paramters
  var newQueryParameters = Map<String, String>.from(uri.queryParameters);
  // Remove old format param and add new one only if it is not empty
  newQueryParameters.remove('format');
  if (formatCode.isNotEmpty) {
    newQueryParameters["format"] = formatCode;
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