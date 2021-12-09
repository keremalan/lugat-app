import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(lugat());

class MyAppThemes {
  static ThemeData appThemeLight() {
  return ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
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
      appBarTheme: AppBarTheme(
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
        title: Padding(
          padding: EdgeInsets.only(left: 32.0),
          child: Text("lugat"),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print("test");
            }
          )
        ],
      );
  }
}

  Widget buildBodyWidget() {
    return GridView.count(
      padding: const EdgeInsets.only(top: 32),
      crossAxisCount: 2,
      children: List.generate(4, (index) {
        return Center(
          child: categoryItem(),
        );
      })
    );
  }

  Widget categoryItem() {
    return Column(
      children: <Widget>[
        Image.network(
          "https://www.upload.ee/image/13703274/griditem__1_.png",
          height: 125,
        ),
        Text("KategoriAdı"),
      ],
    );
  }