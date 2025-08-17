import 'package:flutter/material.dart';

void SnachBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$text')));
}
