import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() { runApp(MyApp()); }

TermCategories term1 = TermCategories(0, 'Teknoloji', 'Teknoloji ile alakalı terimler', 'url', 'route', 'page');

List <TermCategories> categoryList = [
  TermCategories(0,'Teknoloji', 'Teknoloji ile alakalı terimler','https://www.upload.ee/image/13711001/griditem__1_.png', 'technology', 'TechCategory()',),
  TermCategories(1,'Tasarım', 'Tasarım ile alakalı terimler','https://www.upload.ee/image/13711049/griditem__5_.png', 'design', 'DesignCategory()',),
  TermCategories(2,'Yazılım', 'Yazılım ile alakalı terimler','https://www.upload.ee/image/13711172/griditem__7_.png', 'software', 'SoftwareCategory()',),
  TermCategories(3,'Yapay Zeka', 'Yapay Zeka ile alakalı terimler','https://www.upload.ee/image/13711150/griditem__6_.png', 'ai', 'AiCategory()',),
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
        '/catlist': (context) => const CatList(),
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
  List<Widget> data = [HomeTab(), BookmarkTab(), ProfileTab(), TechCategory(), DesignCategory(), SoftwareCategory(), AiCategory(), CatList(),];
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
        child: SingleChildScrollView(
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
              Column(
                children: [
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 2/ 2,
                        crossAxisSpacing: 14),
                    itemCount: categoryList.length,
                    itemBuilder: (context, index){
                      return Container(
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => ${categoryList[index].page})
                                  );
                                },
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        "${categoryList[index].imagePath}",
                                        height: 140,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 6),
                                      child: Text(
                                        categoryList[index].name,
                                        style: const TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                      },
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
                builder: (context) => CatList())
            );
          },
          child: const Text(
            "CatList'e git",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class CatList extends StatelessWidget {
  const CatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 2/ 2,
                crossAxisSpacing: 14),
            itemCount: categoryList.length,
            itemBuilder: (context, index){
              return Container(
                child: Column(
                  children: <Widget>[
                    Image.network(
                      "${categoryList[index].imagePath}",
                      height: 160,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Text(
                        categoryList[index].name,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


class TermCategories {
  int id;
  String name;
  String description;
  String imagePath;
  String route;
  String page;

  TermCategories(this.id, this.name, this.description, this.imagePath, this.route, this.page,);
}