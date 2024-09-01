import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static Future push(BuildContext ctx, {required Widget destination}) =>
      Navigator.of(ctx).push(MaterialPageRoute(builder: (_) => destination));
}
