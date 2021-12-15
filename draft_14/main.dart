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

Term term0 = Term(0, 0, 'Metaverse', 'Açıklama', 'url');

List <Term> termList = [
  Term(0, 0, 'Metaverse', 'Açıklama', 'https://www.upload.ee/image/13716801/metaverse.jpeg'),
  Term(1, 0, 'Metaverse', 'Açıklama', 'https://www.upload.ee/image/13716801/metaverse.jpeg'),
  Term(2, 0, 'Metaverse', 'Açıklama', 'https://www.upload.ee/image/13716801/metaverse.jpeg'),
  Term(3, 0, 'Metaverse', 'Açıklama', 'https://www.upload.ee/image/13716801/metaverse.jpeg'),
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
        '/term': (context) => const TermPage(),
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
        alignment: Alignment.centerLeft,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 148),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                      "Terim Oluştur",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  MyCustomForm(),
                ],
              ),
            ),
          ],
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
    var terim = 4;
    return Material(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://www.upload.ee/image/13718492/griditem__1_.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 12, right: 8, left: 16, bottom: 8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Günün kelimesi",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 4),
                              child: Text(
                                "Yalın meta-evren",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 230),
                              child: Text(
                                "Tasarım",
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              fit: FlexFit.loose,
                              child: Padding(
                                padding: EdgeInsets.only(left: 6, right: 60, bottom: 8),
                                child: Text(
                                    "Kategori ile ilgili açıklama metni detaylı olarak buraya gelecektir.",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        Row(
                          children: [
                            Text(
                              "Bu kategori $terim terim içeriyor.",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 60),
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(width: 1.0, color: Colors.white),
                                    primary: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                    )
                                ),
                                onPressed: () {},
                                child: Text(
                                  "kelime ekle",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, bottom: 16),
                child: Row(
                  children: [
                    Text(
                      "Terimler",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 22, right: 22),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    "https://www.upload.ee/image/13718541/metaverse_1.png",
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 4, right: 85),
                                  child: Text(
                                    "Metaverse",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                      "Metaverse ile ilgili açıklamalar",
                                      style: TextStyle(
                                        fontSize: 14,
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 36, left: 36),
                child: Divider(color: Colors.grey),
              ),
              Padding(
                padding: EdgeInsets.only(left: 22, right: 22),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    "https://www.upload.ee/image/13718541/metaverse_1.png",
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 4, right: 85),
                                  child: Text(
                                    "Metaverse",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                      "Metaverse ile ilgili açıklamalar",
                                      style: TextStyle(
                                        fontSize: 14,
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 36, left: 36),
                child: Divider(color: Colors.grey),
              ),
              Padding(
                padding: EdgeInsets.only(left: 22, right: 22),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    "https://www.upload.ee/image/13718541/metaverse_1.png",
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 4, right: 85),
                                  child: Text(
                                    "Metaverse",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                      "Metaverse ile ilgili açıklamalar",
                                      style: TextStyle(
                                        fontSize: 14,
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 36, left: 36),
                child: Divider(color: Colors.grey),
              ),
              Padding(
                padding: EdgeInsets.only(left: 22, right: 22),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    "https://www.upload.ee/image/13718541/metaverse_1.png",
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => TermPage())
                                );
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 4, right: 85),
                                    child: Text(
                                      "Metaverse",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text(
                                        "Metaverse ile ilgili açıklamalar",
                                        style: TextStyle(
                                          fontSize: 14,
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 120),
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
            ],
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

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: SizedBox(
              width: 394,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelText: 'Başlık',
                ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen metin girin';
                    }
                    return null;
                  }
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 16),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 6),
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text("Kategori"),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 6),
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text("Kategori"),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 6),
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text("Kategori"),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 6),
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text("Kategori"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: SizedBox(
              width: 394,
              child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelText: 'İngilizcesi',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen metin girin';
                    }
                    return null;
                  }
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: SizedBox(
              width: 394,
              child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelText: 'Türkçesi',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen metin girin';
                    }
                    return null;
                  }
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: SizedBox(
              width: 394,
              child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelText: 'Açıklaması',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen metin girin';
                    }
                    return null;
                  }
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Veriler işleniyor')),
                  );
                }
              },
              child: const Text('Tamamla'),
            ),
          ),
        ],
      ),
    );
  }
}

class TermPage extends StatelessWidget {
  const TermPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 200),
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Metaverse"),
                              Text("Meta evrenler ile ilgili bişiler"),
                              Text("Meta evrenler ile ilgili başka bişiler"),
                            ],
                          ),
                          Text("Paylaş"),
                          Text("Kaydet"),
                          Text("Favorile"),
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class Term {
  int id;
  int catId;
  String name;
  String description;
  String imagePath;

  Term(this.id, this.catId, this.name, this.description, this.imagePath);
}


class TermCategories {
  int id;
  String name;
  String description;
  String imagePath;

  TermCategories(this.id, this.name, this.description, this.imagePath,);
}