import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

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
      home: Scaffold(
          appBar: AppBar(
            title: Text("Startup Name Generator"),
          ),
          body: Center(
            child: RandomWords(),
          )),
    );
  }
}

/**
 * Stateless widgets are immutable, meaning that their properties can’t change—all values are final.
 * Stateful widgets maintain state that might change during the lifetime of the widget.
 *
 * Implementing a stateful widget requires at least two classes:
 * 1) a StatefulWidget class that creates an instance of 2) a State class.
 *
 * The StatefulWidget class is, itself, immutable and can be thrown away and regenerated,
 * but the State class persists over the lifetime of the widget.
 */
class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

/**
 * Prefixing an identifier with an underscore enforces privacy in the Dart language
 * and is a recommended best practice for State objects.
 */
class _RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = [];

  @override
  Widget build(BuildContext context) {
    /**
     * The ListView class provides a builder property, itemBuilder,
     * that’s a factory builder and callback function specified as an anonymous function.
     */
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      if (index >= _suggestions.length) _suggestions.addAll(generateWordPairs().take(10));
      return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair wordPair) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          // leading: Icon(Icons.favorite, color: Colors.redAccent),
          title: Text(wordPair.asCamelCase),
          subtitle: Text(wordPair.asCamelCase),
          trailing: Icon(Icons.favorite, color: Colors.redAccent),
        ),
        Divider(
          thickness: 1,
          color: Colors.grey[300],
          height: 5,
          indent: 16,
          endIndent: 16,
        )
      ],
    );
  }
}
