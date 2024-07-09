import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman_user/shared_widget/bottomNavigationbar.dart';
import 'package:handyman_user/views/auth_screen/sign_in/sign_in.dart';
import 'package:handyman_user/views/auth_screen/sign_up/sign_up.dart';
import 'package:handyman_user/views/booking_screen/booking_screen.dart';
import 'package:handyman_user/views/booking_screen/booking_service/booking_service.dart';
import 'package:handyman_user/views/category_screen/category_detail/category_details_screen.dart';
import 'package:handyman_user/views/category_screen/category_screen.dart';
import 'package:handyman_user/views/category_screen/service_filter/service_filter.dart';
import 'package:handyman_user/views/chat_screen/chat_screen.dart';
import 'package:handyman_user/views/home_screen/booking_steps/book_service_step_one.dart';
import 'package:handyman_user/views/home_screen/booking_steps/booking_service_step_two.dart';
import 'package:handyman_user/views/home_screen/home_screen.dart';
import 'package:handyman_user/views/home_screen/service_detail/service_detail.dart';
import 'package:handyman_user/views/profile_screen/change_password/change_password.dart';
import 'package:handyman_user/views/profile_screen/edit_profile/edit_profile.dart';
import 'package:handyman_user/views/profile_screen/profile_screen.dart';
import 'package:handyman_user/views/splash_screen/splash_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        name: SplashScreen.id,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/auth',
        name: SignInScreen.id,
        builder: (context, state) => SignInScreen(),
        routes: [
          GoRoute(
            path: 'signup',
            name: SignUpScreen.id,
            builder: (context, state) => SignUpScreen(),
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: GlobalKey<NavigatorState>(),
        builder: (context, state, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNav(
                // calculateScreenIndex(state),
                ),
          );
        },
        routes: [
          GoRoute(
            path: '/homescreen',
            name: HomeScreen.id,
            builder: (context, state) => HomeScreen(),
            routes: [
              GoRoute(
                path: 'ServiceDetail',
                name: ServiceDetail.id,
                builder: (context, state) => ServiceDetail(),
                routes: [
                  GoRoute(
                    path: 'BookingStepOne',
                    name: BookingStepOne.id,
                    builder: (context, state) => BookingStepOne(),
                    routes: [
                      GoRoute(
                        path: 'BookingStepTwo',
                        name: BookingStepTwo.id,
                        builder: (context, state) => BookingStepTwo(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: '/bookingscreen',
            name: BookingScreen.id,
            builder: (context, state) => BookingScreen(),
            routes: [
              GoRoute(
                path: 'bookingservice',
                name: BookingService.id,
                builder: (context, state) => BookingService(),
              ),
            ],
          ),
          GoRoute(
            path: '/categoryscreen',
            name: CategoryScreen.id,
            builder: (context, state) => CategoryScreen(),
            routes: [
              GoRoute(
                path: 'categorydetailsscreen/:category',
                name: CategoryDetailsScreen.id,
                builder: (context, state) => CategoryDetailsScreen(
                  category: state.pathParameters['category']!,
                ),
                routes: [
                  GoRoute(
                    path: 'servicefilter',
                    name: ServiceFilter.id,
                    builder: (context, state) => ServiceFilter(),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: '/chatscreen',
            name: ChatScreen.id,
            builder: (context, state) => ChatScreen(),
          ),
          GoRoute(
            path: '/profilescreen',
            name: ProfileScreen.id,
            builder: (context, state) => ProfileScreen(),
            routes: [
              GoRoute(
                path: 'editprofile',
                name: EditProfile.id,
                builder: (context, state) => EditProfile(),
              ),
              GoRoute(
                path: 'changepassword',
                name: ChangePassword.id,
                builder: (context, state) => ChangePassword(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}


// int calculateScreenIndex(GoRouterState state) {
//   final location = state.matchedLocation;

//   if (location.startsWith('/homescreen')) {
//     return 0;
//   }
//   if (location.startsWith('/bookingscreen')) {
//     return 1;
//   }
//   if (location.startsWith('/categoryscreen')) {
//     return 2;
//   }
//   if (location.startsWith('/chatscreen')) {
//     return 3;
//   }
//   if (location.startsWith('/profilescreen')) {
//     return 4;
//   }
//   return -1;
// }
