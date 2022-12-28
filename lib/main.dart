import 'package:diatfori/common/constant.dart';
import 'package:diatfori/data/db/database_helper.dart';

import 'package:diatfori/data/api/api_service.dart';
import 'package:diatfori/firebase_options.dart';
import 'package:diatfori/presentation/login/profile.dart';
import 'package:diatfori/presentation/login/welcome.dart';
import 'package:diatfori/presentation/provider/database_provider.dart';
import 'package:diatfori/presentation/provider/nutrients_provider.dart';
import 'package:diatfori/presentation/screen/food_recipe_screen.dart';

import 'package:diatfori/presentation/screen/item_detail_screen.dart';
import 'package:diatfori/presentation/screen/items_bag_screen.dart';
import 'package:diatfori/presentation/provider/resep_list_provider.dart';
import 'package:diatfori/presentation/provider/resep_search_provider.dart';
import 'package:diatfori/presentation/screen/homepage_screen.dart';
import 'package:diatfori/presentation/screen/resep_favorite.dart';
import 'package:diatfori/presentation/screen/search_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common/utils.dart';
import 'presentation/screen/article_web_view.dart';
import 'presentation/screen/calculate_screen.dart';
import 'presentation/screen/mainpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DatabaseProvider>(
            create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper())),
        ChangeNotifierProvider<ResepListProvider>(
            create: (_) => ResepListProvider(apiService: ApiService()),
            child: const HomeScreen()),
        ChangeNotifierProvider<NutrientProvider>(
            create: (_) => NutrientProvider(apiService: ApiService()),
            child: const CalculateScreen()),
        ChangeNotifierProvider<NutrientProvider>(
            create: (_) => NutrientProvider(apiService: ApiService()),
            child: const ItemBagScreen()),
        ChangeNotifierProvider<SearchResepProvider>(
            create: (_) => SearchResepProvider(apiService: ApiService()),
            child: const ResepSearchPage()),
      ],
      child: MaterialApp(
        title: 'Diatrofi',
        theme: ThemeData.light().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kMatteBlack,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const WelcomePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case MainPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => const MainPage());
            case ResepSearchPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => const ResepSearchPage());
            case ResepFavoriteScreen.ROUTE_NAME:
              return MaterialPageRoute(
                  builder: (_) => const ResepFavoriteScreen());
            case CalculateScreen.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => const CalculateScreen());

            case ArticleWebView.routeName:
              final url = settings.arguments as String;
              return MaterialPageRoute(
                  builder: (_) => ArticleWebView(url: url), settings: settings);
            case DetailScreen.ROUTE_NAME:
              final food = settings.arguments as String;
              return MaterialPageRoute(
                  builder: (_) => DetailScreen(keyResep: food),
                  settings: settings);
            case FoodRecipeScreen.ROUTE_NAME:
              final food = settings.arguments as String;
              return MaterialPageRoute(
                  builder: (_) => FoodRecipeScreen(keyResep: food),
                  settings: settings);
            case ProfilePage.routeName:
              return MaterialPageRoute(builder: (_) => const ProfilePage());
            case ItemBagScreen.ROUTE_NAME:
              return MaterialPageRoute(
                builder: (_) => const ItemBagScreen(),
              );

            default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Halaman Tidak Ditemukan :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
