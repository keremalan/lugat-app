import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(lugat());

String text = '';

class MyAppThemes {
  static ThemeData appThemeLight() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.indigo.shade500,
      ),
    );
  }

  static ThemeData appThemeDark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.indigo.shade500,
      ),
    );
  }
}

class lugat extends StatefulWidget {
  @override
  _lugatState createState() => _lugatState();
}
class _lugatState extends State<lugat> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyAppThemes.appThemeLight(),
      home: Scaffold(
        appBar: MyAppBar(),
        body: buildBodyWidget(),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: const Padding(
        padding: EdgeInsets.only(left: 32.0),
        child: Text(
          "lügat",
          style:
          TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            print("Pressed menu button.");
          },
        ),
      ],
    );
  }
}

Widget buildBodyWidget() {
  return Column(
    children: [
      const Padding(
        padding: EdgeInsets.only(top: 40),
      ),
      const Text(
        'lügat',
        style:
        TextStyle(
          fontFamily: 'AbrilFatface',
          fontSize: 64,
          fontWeight: FontWeight.w200,
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(bottom: 20),
      ),
       const Text(
        'Terimler sözlüğü.',
        style:
          TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
          ),
      ),
        Padding(
        padding: EdgeInsets.only(top: 48, bottom: 48, left: 50, right: 50),
        child: TextField(
          style:
            const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            labelText: 'Aramak istediğiniz terimi girin',
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      Expanded(
        child: gridView(),
      ),
    ],
  );
}

Widget gridView() {
  return Column(
    children: [
      const Align(
        alignment:
        Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 22),
          child: Text(
            'Kategoriler',
            style:
            TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      Expanded(
        child: grid(),
      ),
    ],
  );
}

Widget grid() {
  return GridView.count(
    padding: const EdgeInsets.only(top: 24, left: 6, right: 6),
    crossAxisCount: 2,
    mainAxisSpacing: 24,
    children: List.generate(4, (index) {
      return Center(
        child: categoryItem(),
      );
    }),
  );
}

Widget categoryItem() {
  return Column(
    children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          "https://www.upload.ee/image/13703274/griditem__1_.png",
          height: 160,
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 8),
      ),
      const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 28),
          child: Text(
            'Kategori Adı',
            style:
            TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ],
  );
}