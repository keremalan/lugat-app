import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// :) please be green

void main() { runApp(MyApp()); }

TermCategory term1 = TermCategory(0, 'Teknoloji', 'Teknoloji ile alakalı terimler', 'url');

List <TermCategory> categoryList = [
  TermCategory(1,'Teknoloji', 'Teknoloji ile alakalı terimler','https://www.upload.ee/image/13711001/griditem__1_.png'),
  TermCategory(2,'Tasarım', 'Tasarım ile alakalı terimler','https://www.upload.ee/image/13711049/griditem__5_.png'),
  TermCategory(3,'Yazılım', 'Yazılım ile alakalı terimler','https://www.upload.ee/image/13711172/griditem__7_.png'),
  TermCategory(4,'Yapay Zeka', 'Yapay Zeka ile alakalı terimler','https://www.upload.ee/image/13711150/griditem__6_.png'),
];

Term term0 = Term(0, 0, 'Metaverse', 'Açıklama', 'url');

List <Term> termList = [
  Term(1, 1, 'Metaverse', 'Açıklama', 'https://www.upload.ee/image/13716801/metaverse.jpeg'),
  Term(2, 1, 'Metaverse', 'Açıklama', 'https://www.upload.ee/image/13716801/metaverse.jpeg'),
  Term(3, 1, 'Metaverse', 'Açıklama', 'https://www.upload.ee/image/13716801/metaverse.jpeg'),
  Term(4, 1, 'Metaverse', 'Açıklama', 'https://www.upload.ee/image/13716801/metaverse.jpeg'),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lügat',
      initialRoute: '/',
      routes: {
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
  List<Widget> data = [HomeTab(), BookmarkTab(), ProfileTab(), CatList(),];
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
        child: Padding(
          padding: EdgeInsets.only(top: 140),
          child: Column(
            children: <Widget>[
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
                    padding: EdgeInsets.only(top: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                    const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 2 / 2,
                        crossAxisSpacing: 14),
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryDetail(
                                        termCategory: categoryList[index]),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.network(
                                      '${categoryList[index].imagePath}',
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
                          )
                        ],
                      );
                    },
                  ),
                ],
              ),
            ],
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

class CategoryDetail extends StatelessWidget {
  final TermCategory termCategory;

  const CategoryDetail({Key? key, required this.termCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                      image: NetworkImage(termCategory.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12, right: 8, left: 16, bottom: 8),
                    child: Column(
                      children: [
                        Row(
                          children: const [
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
                          children: const [
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
                              padding: const EdgeInsets.only(top: 230),
                              child: Text(
                                termCategory.name,
                                style: const TextStyle(
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
                                padding: const EdgeInsets.only(
                                    left: 6, right: 60, bottom: 8),
                                child: Text(
                                  termCategory.description,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Bu kategori ${termList.length} terim içeriyor.",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                      width: 1.0, color: Colors.white),
                                  primary: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                  )),
                              onPressed: () {},
                              child: const Text(
                                "kelime ekle",
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
                padding: const EdgeInsets.only(left: 24, bottom: 16),
                child: Row(
                  children: const [
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
                                  padding:
                                  EdgeInsets.only(bottom: 4, right: 85),
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
                                  child:
                                  Text("Metaverse ile ilgili açıklamalar",
                                      style: TextStyle(
                                        fontSize: 14,
                                      )),
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
              const Padding(
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
                                  padding:
                                  EdgeInsets.only(bottom: 4, right: 85),
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
                                  child:
                                  Text("Metaverse ile ilgili açıklamalar",
                                      style: TextStyle(
                                        fontSize: 14,
                                      )),
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
                                  padding:
                                  EdgeInsets.only(bottom: 4, right: 85),
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
                                  child:
                                  Text("Metaverse ile ilgili açıklamalar",
                                      style: TextStyle(
                                        fontSize: 14,
                                      )),
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
                padding: EdgeInsets.only(left: 38, right: 38),
                child: Divider(color: Colors.grey),
              ),
              Padding(
                padding: EdgeInsets.only(left: 22),
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TermPage()));
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                    EdgeInsets.only(bottom: 4, right: 85),
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
                                    child:
                                    Text("Metaverse ile ilgili açıklamalar",
                                        style: TextStyle(
                                          fontSize: 14,
                                        )),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeTab()));
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
                  decoration: const InputDecoration(
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
                  decoration: const InputDecoration(
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
                  decoration: const InputDecoration(
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
            padding: EdgeInsets.only(top: 65),
            child: Column(
              children: [
                Container(
                  height: 660,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://www.upload.ee/image/13719274/Rectangle_41.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 42),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                    "usb",
                                  style: TextStyle(
                                    fontSize: 42,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                Image.network(
                                  "https://www.upload.ee/image/13719287/Rectangle_42.png",
                                  width: 160,
                                  height: 20,
                                ),
                                Text(
                                    "universal serial bus",
                                    style: TextStyle(
                                      fontSize: 14.6,
                                      fontStyle: FontStyle.italic,
                                    color: Colors.white.withOpacity((0.8)),
                                  ),
                                ),
                                Text(
                                    "evrensel seri veriyolu",
                                    style: TextStyle(
                                      fontSize: 14.6,
                                      fontStyle: FontStyle.italic,
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                    "Paylaş",
                                    style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                    "Kaydet",
                                    style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                    "Favorile",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 48),
                              child: Container(
                                height: 410,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "iPhone 6 cihazınızı bilgisayara bağlamak için bilgisayarınızın USB girişini ve iPhone’unuzun lightining girişini kullanırsınız.",
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    Text(
                                      "USB, ülkemizde aynı zamanda flash bellek anlamında da kullanılabilmektedir. Flash bellek ise bilgisayarınızdaki bir dosyayı farklı bir cihaza aktarmak için kullandığınız nispeten küçük depolama alanlarına sahip taşınabilir cihazlardır.",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white.withOpacity(0.8),
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                ),
                              ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 18,),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                              "Önerilen tanımlar",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                side: const BorderSide(
                                    width: 1.0, color: Color(0xff530303)),
                                primary: Color(0xff530303),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                )),
                            onPressed: () {},
                            child: const Text(
                                "Katkıda Bulun"
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

class TermCategory {
  int id;
  String name;
  String description;
  String imagePath;

  TermCategory(this.id, this.name, this.description, this.imagePath,);
}
