import 'package:beamer/beamer.dart';

import '../../core/navigation/navigation.dart';
import '../../ui.dart';

extension NavigationUtils on BuildContext {
  AppNavigator get appNavigator => AppNavigator.of(this);

  AppNavigator get appRootNavigator => AppNavigator.of(this, root: true);
}

class AppRouteParserImpl extends AppRouteParser {}

class AppBackButtonDispatcher extends BeamerBackButtonDispatcher {
  AppBackButtonDispatcher(RouterDelegate<RouteInformation> delegate)
      : super(delegate: delegate as BeamerDelegate);
}

class AppRouterDelegateImpl extends AppRouterDelegate {
  AppRouterDelegateImpl.withRouters({required List<AppRouter> routers})
      : super.withRouters(routers);

  AppRouterDelegateImpl.withRoutes({
    required Map<Pattern, RouterBuilderCallback> routes,
  }) : super.withRoutes(routes);
}

extension AuthenticationHelper on Widget {
  Widget authenticated() {
    return Builder(
      builder: (BuildContext context) {
        if (context.appViewModel.getState().count == 1) {
          return const Text('Show Login Page');
        }
        return this;
      },
    );
  }
}
