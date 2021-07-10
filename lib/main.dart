import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appbar',
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Appbar icon menu'),
          centerTitle: true,
          elevation: 0.0,
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   onPressed: () {
          //     print('menu button is clicked');
          //   },
          // ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                print('shopping cart button is clicked');
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('search button is clicked');
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/logo.png'),
                  backgroundColor: Colors.white,
                ),
                otherAccountsPictures: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/logo.png'),
                    backgroundColor: Colors.white,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/logo.png'),
                    backgroundColor: Colors.white,
                  ),
                ],
                accountName: Text('HJEONG'),
                accountEmail: Text('hjeong@gmail.com'),
                onDetailsPressed: () {
                  print('arrow is clicked');
                },
                decoration: BoxDecoration(
                    color: Colors.red[200],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0))),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.grey[700],
                ),
                title: Text('Home'),
                onTap: () {
                  print('Home is clicked');
                },
                trailing: Icon(Icons.add),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.grey[700],
                ),
                title: Text('Setting'),
                onTap: () {
                  print('Setting is clicked');
                },
                trailing: Icon(Icons.add),
              ),
              ListTile(
                leading: Icon(
                  Icons.question_answer,
                  color: Colors.grey[700],
                ),
                title: Text('Q&A'),
                onTap: () {
                  print('Q&A is clicked');
                },
                trailing: Icon(Icons.add),
              )
            ],
          ),
        ),
        body: Builder(
          builder: (BuildContext context) { // 새로운 컨텍스트 할당
            return Center(
              child: FlatButton(
                child: Text('Show me', style: TextStyle(color: Colors.white)),
                color: Colors.red,
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Hello')));
                },
              ),
            );
          },
        ));
  }
}

/*
  BuildContext

  - error "Scaffold.of() called with a context that does not contain a Scaffold"

  - A handle to the location of a widget in the widget tree

  - 모든 위젯은 build method 가 있고 이를 통해 widget tree 를 만들어 나간다
    Widget build(BuildContext context)

  - Each widget has its own BuildContext,
    which becomes the parent of the widget
    returned by the StatelessWidget.build or State.build function
    빌드 컨텍스트는 빌드 메서드에 의해서 리턴된 위젯의 부모가 된다.

  - Scaffold.of(context)
    현재 주어진 context 에서 위로 올라가면서 가장 가까운 Scaffold 를 찾아서 반환하라

  - Something.of(context)
    현재 주어진 context 에서 위로 올라가면서 가장 가까운 Something 을 찾아서 반환하라
 */
