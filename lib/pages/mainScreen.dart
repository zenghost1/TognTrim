import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:togandtrimapp/components/navbar.dart';
import 'package:togandtrimapp/pages/cart.dart';
import 'package:togandtrimapp/pages/home.dart';
import 'package:togandtrimapp/pages/login.dart';
import 'package:togandtrimapp/pages/profile.dart';
import 'package:togandtrimapp/pages/search.dart';
import 'package:togandtrimapp/pages/signupscreen.dart';
import 'package:togandtrimapp/pages/wishlist.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _selectedIndex = "home";

  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
    4: GlobalKey<NavigatorState>(),
  };

  final Map<String, Widget> _widgetOptions = {
    "home": const HomePage(),
    "search": const SearchPage(),
    "wish": const WishList(),
    "cart": const Cart(),
    "profile": const Profile(),
    "signup": const SignupScreen(),
    "login": const LoginScreen()
  };

  void onItemTapped(String index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        
        child: Text("Drawer"),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: <Widget>[
              Navbar(update: onItemTapped),
              Expanded(
                  child: Navigator(
                key: navigatorKeys[_selectedIndex],
                onGenerateRoute: (RouteSettings settings) {
                  if (settings.name != "/") {
                    onItemTapped(settings.name!);
                  }
                  return PageRouteBuilder(
                      pageBuilder: (_, __, ___) =>
                          _widgetOptions[_selectedIndex]!);
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
