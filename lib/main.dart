import 'package:flutter/material.dart';
import 'package:my_first_app/word_list_page.dart';

// The main() method uses arrow (=>) notation. Use arrow notation for one-line functions or methods.
void main() => runApp(MyApp());

// The app extends StatelessWidget, which makes the app itself a widget.
// In Flutter, almost everything is a widget, including alignment, padding, and layout.
class MyApp extends StatelessWidget {
  // A widget’s main job is to provide a build() method
  // that describes how to display the widget in terms of other, lower level widgets.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // The Scaffold widget, from the Material library,
      // provides a default app bar, and a body property
      // that holds the widget tree for the home screen.
      // The widget subtree can be quite complex.
      home: WordListPage(),
    );
  }
}

