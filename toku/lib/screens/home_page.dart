import 'package:flutter/material.dart';
import 'package:toku/components/category_item.dart';
import 'package:toku/screens/colors_page.dart';
import 'package:toku/screens/family_number.dart';
import 'package:toku/screens/nember_page.dart';
import 'package:toku/screens/phrases_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEF6DB),
      appBar: AppBar(
        backgroundColor: Color(0xff46322B),
        title: Text('Toku'),
      ),
      body: Column(
        children: [
          Category(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NemberPages();
              }));
            },
            text: 'Nember',
            color: Color(0xffEF9235),
          ),
          Category(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FamilyNumber();
              }));
            },
            text: 'Family Number',
            color: Color(0xff558B37),
          ),
          Category(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ColorsPage();
              }));
            },
            text: 'Colors',
            color: Color(0xff79359F),
          ),
          Category(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PhrasesPage();
              }));
            },
            text: 'Phrases',
            color: Color(0xff558BDA),
          ),
        ],
      ),
    );
  }
}
