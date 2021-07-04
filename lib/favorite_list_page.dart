import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class FavoriteListPage extends StatelessWidget {
  final List<WordPair> favorites;

  // 생성자, List<WordPair> 를 인수로 반드시 넘겨줘야 함. key 는 optional
  const FavoriteListPage(this.favorites, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(favorites.toString());
    return Scaffold(
        appBar: AppBar(
          title: Text("Favorite list"),
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(favorites[index].asCamelCase),
            );
          },
          itemCount: favorites.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              thickness: 1,
              color: Colors.grey[300],
              height: 5,
              indent: 16,
              endIndent: 16,
            );
          },
        )
    );
  }

}
