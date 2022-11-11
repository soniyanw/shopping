import '../../core/navigation/navigation.dart';
import '../../ui.dart';
import 'app_router.dart';

final RouterDelegate<RouteInformation> appRouterDelegate =
    AppRouterDelegateImpl.withRouters(
  routers: <AppRouter>[
    MainAppRouter(),
  ],
);
