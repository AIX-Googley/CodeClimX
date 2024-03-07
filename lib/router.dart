import 'package:codeclimx/home/home_screen.dart';
import 'package:codeclimx/videos/authentication/login_screen.dart';
import 'package:codeclimx/videos/authentication/repos/authentication_repo.dart';
import 'package:codeclimx/videos/authentication/sign_up_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) {
  // ref.watch(authState);

  return GoRouter(
    initialLocation: "/home",
    // initialLocation: "/",

    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;

      if (!isLoggedIn) {
        if (state.subloc != SignUpScreen.routeURL &&
            state.subloc != LoginScreen.routeURL) {
          return SignUpScreen.routeURL;
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        name: SignUpScreen.routeName,
        path: SignUpScreen.routeURL,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        name: LoginScreen.routeName,
        path: LoginScreen.routeURL,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: HomeScreen.routeName,
        path: HomeScreen.routeURL,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
});