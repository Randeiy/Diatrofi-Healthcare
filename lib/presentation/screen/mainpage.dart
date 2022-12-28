import 'package:diatfori/common/constant.dart';
import 'package:diatfori/data/api/api_service.dart';
import 'package:diatfori/presentation/provider/article_provider.dart';
import 'package:diatfori/presentation/provider/resep_list_provider.dart';
import 'package:diatfori/presentation/screen/homepage_screen.dart';
import 'package:diatfori/presentation/screen/resep_favorite.dart';
import 'package:diatfori/presentation/screen/resep_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'article_screen.dart';

class MainPage extends StatefulWidget {
  static const ROUTE_NAME = '/main';
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final List screen = [
    ChangeNotifierProvider<ArticleProvider>(
        create: (_) => ArticleProvider(apiService: ApiService()),
        child: const HomeScreen()),
    ChangeNotifierProvider<ArticleProvider>(
        create: (_) => ArticleProvider(apiService: ApiService()),
        child: const ArticleScreen()),
    ChangeNotifierProvider<ResepListProvider>(
        create: (_) => ResepListProvider(apiService: ApiService()),
        child: const ResepScreen()),
    const ResepFavoriteScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 15, right: 15, left: 15),
        height: 55,
        decoration: BoxDecoration(
          color: kStrongGreen,
          borderRadius: BorderRadius.circular(30),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kMatteBlack,
          unselectedItemColor: kSoftGreen,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_view_rounded), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.newspaper_rounded), label: "article"),
            BottomNavigationBarItem(
                icon: Icon(Icons.restaurant), label: "receipe"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_rounded), label: "favorite"),
          ],
        ),
      ),
    );
  }
}
