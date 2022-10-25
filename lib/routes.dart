import '/authpage/signupscreen.dart';
import 'shared/loading_animation.dart';
import 'landingpage/entiresplashscreen.dart';

var appRoutes = {
  '/': (context) => const SplashScreen(),
  '/loading': (context) => const LoadingAnimation(),
  '/signup': (context) => const SignupScreen(),
};
