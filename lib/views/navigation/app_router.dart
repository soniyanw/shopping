import '../../core/navigation/navigation.dart';
import '../../ui.dart';
import '../home_page.dart';
import '../profile_page.dart';

abstract class AppRoutePatterns {
  String get initial => '/';

  String get users => '/users';

  String get userWithId => '/user/:id';
}

class MainAppRouter extends AppRouter {
  @override
  List<Pattern> get pathPatterns => <Pattern>['*'];

  @override
  List<AppPage> buildPages(
    BuildContext context,
    AppRouterState state,
  ) {
    return <AppPage>[
      AppPage(
        key: routes.initial.toValueKey(),
        name: routes.initial,
        child: const HomePage(),
      ),
      if (state.pattern == routes.users)
        AppPage(
          key: state.pattern.toValueKey(),
          name: state.pattern,
          child: const ProfilePage(),
        ),
    ];
  }
}
