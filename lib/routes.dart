import 'package:togandtrimapp/pages/mainScreen.dart';
import 'package:togandtrimapp/pages/search.dart';

import 'pages/signupscreen.dart';
import 'shared/loading_animation.dart';
import 'landingpage/entiresplashscreen.dart';

var appRoutes = {
  '/': (context) => const SplashScreen(),
  '/loading': (context) => const LoadingAnimation(),
  '/signup': (context) => const SignupScreen(),
  '/main': (context) => const MainScreen(),
  '/search': (context) => const SearchPage()
};
