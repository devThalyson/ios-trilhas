import 'package:flutter/material.dart';

Future push({
  required BuildContext context,
  required String route,
  bool replace = false,
  Object? arguments,
}) {
  if (replace) {
    return Navigator.pushReplacementNamed(context, route, arguments: arguments);
  }

  return Navigator.pushNamed(context, route, arguments: arguments);
}
