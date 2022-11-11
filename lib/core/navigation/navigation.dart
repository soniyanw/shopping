import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

typedef RouterBuilderCallback = dynamic Function(BuildContext, AppRouterState);

abstract class AppRouterDelegate extends BeamerDelegate {
  AppRouterDelegate.withRouters(List<AppRouter> routers)
      : super(
          locationBuilder: BeamerLocationBuilder(
            beamLocations: routers,
          ),
        );

  AppRouterDelegate.withRoutes(Map<Pattern, RouterBuilderCallback> routes)
      : super(
          locationBuilder: RoutesLocationBuilder(
            routes: routes.map(
              (Pattern key, value) {
                return MapEntry(
                  key,
                  (BuildContext context, BeamState state, Object? data) {
                    return value(context, AppRouterState._fromBeamState(state));
                  },
                );
              },
            ),
          ),
        );
}

abstract class AppRouteParser extends BeamerParser {}

class AppRouterState implements RouteInformationSerializable<AppRouterState> {
  AppRouterState._fromBeamState(this._beamState);

  static AppRouterState of(BuildContext context) =>
      Beamer.of(context).currentBeamLocation.state as AppRouterState;

  final BeamState _beamState;

  @override
  AppRouterState fromRouteInformation(RouteInformation routeInformation) {
    return AppRouterState._fromBeamState(
      BeamState.fromRouteInformation(routeInformation),
    );
  }

  @override
  RouteInformation get routeInformation => toRouteInformation();

  @override
  RouteInformation toRouteInformation() => _beamState.toRouteInformation();

  Uri get uri => _beamState.uri;

  Uri get uriPattern => _beamState.uriBlueprint;

  String get pattern => uriPattern.path;

  Object? get routeState => _beamState.routeState;

  String? getPathParam(String key) => _beamState.pathParameters[key];

  String? getQueryParam(String key) => _beamState.queryParameters[key];
}

abstract class AppRouter extends BeamLocation<AppRouterState> {
  @override
  AppRouterState createState(RouteInformation routeInformation) {
    return AppRouterState._fromBeamState(
      BeamState.fromRouteInformation(routeInformation),
    );
  }
}

class AppPage extends _AppPage {
  const AppPage({
    LocalKey? key,
    String? name,
    required Widget child,
  }) : super(
          key: key,
          child: child,
          name: name,
        );
}

abstract class _AppPage extends BeamPage {
  const _AppPage({
    LocalKey? key,
    String? name,
    required Widget child,
    String? title,
    String? popToNamed,
    Route Function(BuildContext context, RouteSettings settings, Widget child)?
        routeBuilder,
    bool fullScreenDialog = false,
    bool keepQueryOnPop = false,
  }) : super(
          key: key,
          name: name,
          child: child,
          fullScreenDialog: fullScreenDialog,
          keepQueryOnPop: keepQueryOnPop,
          onPopPage: routePop,
          popToNamed: popToNamed,
          routeBuilder: routeBuilder,
          title: title,
          type: BeamPageType.cupertino,
        );

  static bool pathSegmentPop<T>(
    BuildContext context,
    BeamerDelegate delegate,
    RouteInformationSerializable<T> state,
    BeamPage poppedPage,
  ) =>
      BeamPage.pathSegmentPop(context, delegate, state, poppedPage);

  static bool routePop<T>(
    BuildContext context,
    BeamerDelegate delegate,
    RouteInformationSerializable<T> state,
    BeamPage poppedPage,
  ) =>
      BeamPage.routePop(
        context,
        delegate,
        state,
        poppedPage,
      );
}

class AppNavigator {
  AppNavigator._from(BuildContext context, {bool root = false}) {
    _navigator = Navigator.of(context, rootNavigator: root);
    _beamer = Beamer.of(context, root: root);
  }

  static AppNavigator of(BuildContext context, {bool root = false}) =>
      AppNavigator._from(
        context,
        root: root,
      );

  late NavigatorState _navigator;
  late BeamerDelegate _beamer;

  void goToNamed(
    String uri, {
    Object? data,
    Object? routeState,
  }) {
    _beamer.beamToNamed(
      uri,
      data: data,
      routeState: routeState,
    );
  }

  void goToNamedReplacement(
    String uri, {
    Object? data,
    Object? routeState,
  }) {
    _beamer.beamToReplacementNamed(
      uri,
      data: data,
      routeState: routeState,
    );
  }

  Future<bool> pop<T extends Object?>({T? result}) {
    return _navigator.maybePop(result);
  }

  bool back<T extends Object?>({T? data}) {
    return _beamer.beamBack(data: data);
  }
}
