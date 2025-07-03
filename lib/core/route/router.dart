part of '../../../../core/export.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: routeUserList,
      builder: (context, state) => const UserScreen(),
    ),
    GoRoute(
      path: routeUserDetail,
      builder: (context, state) {
        final user = state.extra as UserModel;
        return UserDetailScreen(user: user);
      },
    ),
  ],
);
