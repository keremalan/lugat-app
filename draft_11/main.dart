import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() { runApp(MyApp()); }

TermCategories term1 = TermCategories(0, 'Teknoloji', 'Teknoloji ile alakalı terimler', 'url');

List <TermCategories> categoryList = [
  TermCategories(0,'Teknoloji', 'Teknoloji ile alakalı terimler','https://www.upload.ee/image/13711001/griditem__1_.png'),
  TermCategories(1,'Tasarım', 'Tasarım ile alakalı terimler','https://www.upload.ee/image/13711049/griditem__5_.png'),
  TermCategories(2,'Yazılım', 'Yazılım ile alakalı terimler','https://www.upload.ee/image/13711172/griditem__7_.png'),
  TermCategories(3,'Yapay Zeka', 'Yapay Zeka ile alakalı terimler','https://www.upload.ee/image/13711150/griditem__6_.png'),
];

Term term0 = Term(0, 'Metaverse', 'Açıklama', 'url');

List <Term> termList = [
  Term(0, 'Metaverse', 'Açıklama', 'https://www.upload.ee/image/13716801/metaverse.jpeg'),
  Term(1, 'Metaverse', 'Açıklama', 'https://www.upload.ee/image/13716801/metaverse.jpeg'),
  Term(2, 'Metaverse', 'Açıklama', 'https://www.upload.ee/image/13716801/metaverse.jpeg'),
  Term(3, 'Metaverse', 'Açıklama', 'https://www.upload.ee/image/13716801/metaverse.jpeg'),
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
            SingleChildScrollView(
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
        child: Row(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 450),
                  ),
                  Padding(
                  padding: EdgeInsets.only(left: 119),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      textStyle: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                    child: Text('Kayıtlı terimlerim'),
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 600,
                            color: Colors.white30,
                              child: Column(
                                children: <Widget>[
                                  Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 16),
                                        child:
                                            Text("Kaydettiklerim",
                                            style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w600,
                                            )
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(100),
                                              child: Image.network(
                                                "https://www.upload.ee/image/13716859/metaverse_1.png",
                                                height: 60,
                                                width: 60,
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(right: 54),
                                                  child: Text(
                                                    "Metaverse",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 4, left: 28),
                                                  child: Text(
                                                    "Metaverse ile ilgili açıklama",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(100),
                                              child: Image.network(
                                                "https://www.upload.ee/image/13716859/metaverse_1.png",
                                                height: 60,
                                                width: 60,
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(right: 54),
                                                  child: Text(
                                                    "Metaverse",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 4, left: 28),
                                                  child: Text(
                                                    "Metaverse ile ilgili açıklama",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(100),
                                              child: Image.network(
                                                "https://www.upload.ee/image/13716859/metaverse_1.png",
                                                height: 60,
                                                width: 60,
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(right: 54),
                                                  child: Text(
                                                    "Metaverse",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 4, left: 28),
                                                  child: Text(
                                                    "Metaverse ile ilgili açıklama",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(100),
                                              child: Image.network(
                                                "https://www.upload.ee/image/13716859/metaverse_1.png",
                                                height: 60,
                                                width: 60,
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(right: 54),
                                                  child: Text(
                                                    "Metaverse",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 4, left: 28),
                                                  child: Text(
                                                    "Metaverse ile ilgili açıklama",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(100),
                                              child: Image.network(
                                                "https://www.upload.ee/image/13716859/metaverse_1.png",
                                                height: 60,
                                                width: 60,
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(right: 54),
                                                  child: Text(
                                                    "Metaverse",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 4, left: 28),
                                                  child: Text(
                                                    "Metaverse ile ilgili açıklama",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                        },
                      );
                    },
                  )
                  ),
                ],
              ),
            ),
          ],
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
      body: ListView.builder(
        itemCount: categoryList.length,
        itemBuilder: (context, index){
          return Container(
            child: Column(
              children: <Widget>[
                Image.network(
                  "${categoryList[index].imagePath}",
                ),
                Text(categoryList[index].name),
                Text(categoryList[index].description),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Term {
  int id;
  String name;
  String description;
  String imagePath;

  Term(this.id, this.name, this.description, this.imagePath);
}


class TermCategories {
  int id;
  String name;
  String description;
  String imagePath;

  TermCategories(this.id, this.name, this.description, this.imagePath,);
}