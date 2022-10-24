import 'shared/loading_animation.dart';
import 'landingpage/entiresplashscreen.dart';

var appRoutes = {
  '/': (context) => const SplashScreen(),
  '/loading': (context) => const LoadingAnimation(),
};
