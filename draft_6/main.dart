import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() { runApp(MyApp()); }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lügat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState()
  {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> data = [HomeTab(), BookmarkTab(), ProfileTab(), TechCategory()];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text("Lügat"),
        ),
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Ana Sayfa",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: "Favorilerim",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profil",
              )
            ],
          ),
          tabBuilder: (context, index) {
            return CupertinoTabView(
              builder: (context) {
                return data[index];
              },
            );
          },
        ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/tech');
          },
          child: const Text(
            "Ana Sayfa",
            style:TextStyle(
                fontSize: 20
            ) ,
          ),
        ),
      ),
    );
  }
}

class BookmarkTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        child: const Text(
          "Bookmarklarım",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        child: const Text(
          "Profil",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class TechCategory extends StatelessWidget {
  const TechCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        child: const Text(
          "Annen",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}