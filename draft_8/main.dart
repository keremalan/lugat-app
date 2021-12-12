import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() { runApp(MyApp()); }

TermCategories term1 = TermCategories(0, 'Teknoloji', 'Teknoloji ile alakalı terimler', 'url');

List <TermCategories> categoryList = [
  TermCategories(0,"Teknoloji", "Teknoloji ile alakalı terimler","url"),
  TermCategories(1,"Tasarım", "Tasarım ile alakalı terimler","url"),
  TermCategories(2,"Yazılım", "Yazılım ile alakalı terimler","url"),
  TermCategories(3,"Yapay Zeka", "Yapay Zeka ile alakalı terimler","url"),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lügat',
      initialRoute: '/',
      routes: {
        '/technology': (context) => const TechCategory(),
        '/design': (context) => const DesignCategory(),
        '/software': (context) => const SoftwareCategory(),
        '/ai': (context) => const AiCategory(),
      },
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
  List<Widget> data = [HomeTab(), BookmarkTab(), ProfileTab(), TechCategory(), DesignCategory(), SoftwareCategory(), AiCategory(),];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
            "Lügat",
            style:
            TextStyle(
              fontSize: 20,
            ),
        ),
        trailing: GestureDetector(
          child: Icon(CupertinoIcons.search),
          onTap: (){},
        ),
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
        child: Padding(
          padding: EdgeInsets.only(top: 140),
          child: Column(
            children: <Widget> [
              Padding(
                padding: EdgeInsets.only(bottom: 48),
                child: Column(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text(
                        "lügat",
                        style: TextStyle(
                          fontFamily: 'AbrilFatface',
                          fontSize: 72,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 0),
                      child: Text(
                        "Terimler sözlüğü.",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 300,
                height: 90,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 48),
                  child: CupertinoSearchTextField(
                    placeholder: "Aramak istediğiniz terimi girin",
                    onChanged: (String value) {
                      print('The text has changed to: $value');
                    },
                    onSubmitted: (String value) {
                      print('Submitted text: $value');
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => TechCategory())
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 32),
                        child: Column(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                "https://www.upload.ee/image/13711001/griditem__1_.png",
                                height: 130,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 6),
                              child: Text(
                                "Teknoloji",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => DesignCategory())
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              "https://www.upload.ee/image/13711049/griditem__5_.png",
                              height: 130,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Text(
                              "Tasarım",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => SoftwareCategory())
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 32),
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              "https://www.upload.ee/image/13711172/griditem__7_.png",
                              height: 130,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Text(
                              "Yazılım",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => AiCategory())
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.network(
                            "https://www.upload.ee/image/13711150/griditem__6_.png",
                            height: 130,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: Text(
                            "Yapay Zeka",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
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
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => HomeTab())
            );
          },
          child: const Text(
              "Ana sayfa'ya dön Teknoloji",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class DesignCategory extends StatelessWidget {
  const DesignCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => HomeTab())
            );
          },
          child: const Text(
            "Ana sayfa'ya dön Tasarım",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class SoftwareCategory extends StatelessWidget {
  const SoftwareCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => HomeTab())
            );
          },
          child: const Text(
            "Ana sayfa'ya dön Yazılım",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class AiCategory extends StatelessWidget {
  const AiCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => HomeTab())
            );
          },
          child: const Text(
            "Ana sayfa'ya dön Yapay Zeka",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class TermCategories {
  int id;
  String name;
  String description;
  String imagePath;

  TermCategories(this.id, this.name, this.description, this.imagePath,);
}