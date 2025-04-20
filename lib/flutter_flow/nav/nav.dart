import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';


import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : ALandingPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : ALandingPageWidget(),
        ),
        FFRoute(
          name: ALandingPageWidget.routeName,
          path: ALandingPageWidget.routePath,
          builder: (context, params) => ALandingPageWidget(
            firstName: params.getParam(
              'firstName',
              ParamType.String,
            ),
            lastName: params.getParam(
              'lastName',
              ParamType.String,
            ),
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: BMainMenuWidget.routeName,
          path: BMainMenuWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'BMainMenu')
              : NavBarPage(
                  initialPage: 'BMainMenu',
                  page: BMainMenuWidget(),
                ),
        ),
        FFRoute(
          name: DRegistrationChoiceWidget.routeName,
          path: DRegistrationChoiceWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: DRegistrationChoiceWidget(),
          ),
        ),
        FFRoute(
          name: ZMapsWidget.routeName,
          path: ZMapsWidget.routePath,
          builder: (context, params) => ZMapsWidget(),
        ),
        FFRoute(
          name: VendorViewapiWidget.routeName,
          path: VendorViewapiWidget.routePath,
          builder: (context, params) => VendorViewapiWidget(),
        ),
        FFRoute(
          name: ZSAGCallWidget.routeName,
          path: ZSAGCallWidget.routePath,
          builder: (context, params) => ZSAGCallWidget(),
        ),
        FFRoute(
          name: ELoginWidget.routeName,
          path: ELoginWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'ELogin')
              : NavBarPage(
                  initialPage: 'ELogin',
                  page: ELoginWidget(),
                ),
        ),
        FFRoute(
          name: LocalDiningWidget.routeName,
          path: LocalDiningWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: LocalDiningWidget(),
          ),
        ),
        FFRoute(
          name: LodgingWidget.routeName,
          path: LodgingWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: LodgingWidget(),
          ),
        ),
        FFRoute(
          name: CEventsInfoMapsWidget.routeName,
          path: CEventsInfoMapsWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'CEventsInfoMaps')
              : NavBarPage(
                  initialPage: 'CEventsInfoMaps',
                  page: CEventsInfoMapsWidget(),
                ),
        ),
        FFRoute(
          name: Map10KWidget.routeName,
          path: Map10KWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: Map10KWidget(
              mapImagePath: params.getParam(
                'mapImagePath',
                ParamType.String,
              ),
            ),
          ),
        ),
        FFRoute(
          name: MapEnduranceRoutesWidget.routeName,
          path: MapEnduranceRoutesWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: MapEnduranceRoutesWidget(
              mapImagePath: params.getParam(
                'mapImagePath',
                ParamType.String,
              ),
            ),
          ),
        ),
        FFRoute(
          name: MapStartLineWidget.routeName,
          path: MapStartLineWidget.routePath,
          builder: (context, params) => MapStartLineWidget(
            mapImagePath: params.getParam(
              'mapImagePath',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ZMapViewerWidget.routeName,
          path: ZMapViewerWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: ZMapViewerWidget(
              mapImagePath: params.getParam(
                'mapImagePath',
                ParamType.String,
              ),
            ),
          ),
        ),
        FFRoute(
          name: MapMBRunWidget.routeName,
          path: MapMBRunWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: MapMBRunWidget(
              mapImagePath: params.getParam(
                'mapImagePath',
                ParamType.String,
              ),
            ),
          ),
        ),
        FFRoute(
          name: MapParkingAccessWidget.routeName,
          path: MapParkingAccessWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: MapParkingAccessWidget(
              mapImagePath: params.getParam(
                'mapImagePath',
                ParamType.String,
              ),
            ),
          ),
        ),
        FFRoute(
          name: MapGravelWidget.routeName,
          path: MapGravelWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: MapGravelWidget(
              mapImagePath: params.getParam(
                'mapImagePath',
                ParamType.String,
              ),
            ),
          ),
        ),
        FFRoute(
          name: RegEnduranceWidget.routeName,
          path: RegEnduranceWidget.routePath,
          builder: (context, params) => RegEnduranceWidget(
            eventName: params.getParam(
              'eventName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: WaiverAdultWidget.routeName,
          path: WaiverAdultWidget.routePath,
          builder: (context, params) => WaiverAdultWidget(
            eventName: params.getParam(
              'eventName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: WaiverMinorWidget.routeName,
          path: WaiverMinorWidget.routePath,
          builder: (context, params) => WaiverMinorWidget(
            eventName: params.getParam(
              'eventName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: PaymentPageWidget.routeName,
          path: PaymentPageWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: PaymentPageWidget(
              eventName: params.getParam(
                'eventName',
                ParamType.String,
              ),
            ),
          ),
        ),
        FFRoute(
          name: ProfileWidget.routeName,
          path: ProfileWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: ProfileWidget(
              firstName: params.getParam(
                'firstName',
                ParamType.String,
              ),
              lastName: params.getParam(
                'lastName',
                ParamType.String,
              ),
              email: params.getParam(
                'email',
                ParamType.String,
              ),
            ),
          ),
        ),
        FFRoute(
          name: ZRoutesSelectionWidget.routeName,
          path: ZRoutesSelectionWidget.routePath,
          builder: (context, params) => ZRoutesSelectionWidget(),
        ),
        FFRoute(
          name: RegMTBWidget.routeName,
          path: RegMTBWidget.routePath,
          builder: (context, params) => RegMTBWidget(
            eventName: params.getParam(
              'eventName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SAGCallResponseWidget.routeName,
          path: SAGCallResponseWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: SAGCallResponseWidget(),
          ),
        ),
        FFRoute(
          name: RegRunWidget.routeName,
          path: RegRunWidget.routePath,
          builder: (context, params) => RegRunWidget(
            eventName: params.getParam(
              'eventName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: RegGravelWidget.routeName,
          path: RegGravelWidget.routePath,
          builder: (context, params) => RegGravelWidget(
            eventName: params.getParam(
              'eventName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: Reg10KChildWidget.routeName,
          path: Reg10KChildWidget.routePath,
          builder: (context, params) => Reg10KChildWidget(
            eventName: params.getParam(
              'eventName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: Reg10KAdultWidget.routeName,
          path: Reg10KAdultWidget.routePath,
          builder: (context, params) => Reg10KAdultWidget(
            eventName: params.getParam(
              'eventName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SchedulesWidget.routeName,
          path: SchedulesWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: SchedulesWidget(),
          ),
        ),
        FFRoute(
          name: MapViewerDynamicWidget.routeName,
          path: MapViewerDynamicWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: MapViewerDynamicWidget(
              raceType: params.getParam(
                'raceType',
                ParamType.String,
              ),
            ),
          ),
        ),
        FFRoute(
          name: ZMapViewer10KWidget.routeName,
          path: ZMapViewer10KWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: ZMapViewer10KWidget(
              mapImagePath: params.getParam(
                'mapImagePath',
                ParamType.String,
              ),
            ),
          ),
        ),
        FFRoute(
          name: TrackingMap10KWidget.routeName,
          path: TrackingMap10KWidget.routePath,
          builder: (context, params) => TrackingMap10KWidget(
            mapImagePath: params.getParam(
              'mapImagePath',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MapsWidget.routeName,
          path: MapsWidget.routePath,
          builder: (context, params) => MapsWidget(),
        ),
        FFRoute(
          name: VendorDetailBikeMartWidget.routeName,
          path: VendorDetailBikeMartWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: VendorDetailBikeMartWidget(),
          ),
        ),
        FFRoute(
          name: ELoginActionWidget.routeName,
          path: ELoginActionWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: ELoginActionWidget(),
          ),
        ),
        FFRoute(
          name: VendorViewAssetWidget.routeName,
          path: VendorViewAssetWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: VendorViewAssetWidget(),
          ),
        ),
        FFRoute(
          name: ELoginIncorrectWidget.routeName,
          path: ELoginIncorrectWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: ELoginIncorrectWidget(),
          ),
        ),
        FFRoute(
          name: VendorDetailGUTRWidget.routeName,
          path: VendorDetailGUTRWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: VendorDetailGUTRWidget(),
          ),
        ),
        FFRoute(
          name: VendorDetailKustomVenturesWidget.routeName,
          path: VendorDetailKustomVenturesWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: VendorDetailKustomVenturesWidget(),
          ),
        ),
        FFRoute(
          name: VendorDetailCLIFWidget.routeName,
          path: VendorDetailCLIFWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: VendorDetailCLIFWidget(),
          ),
        ),
        FFRoute(
          name: VendorDetailHHHWidget.routeName,
          path: VendorDetailHHHWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: VendorDetailHHHWidget(),
          ),
        ),
        FFRoute(
          name: VendorDetailOakleyWidget.routeName,
          path: VendorDetailOakleyWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: VendorDetailOakleyWidget(),
          ),
        ),
        FFRoute(
          name: VendorDetailPIcklJuiceWidget.routeName,
          path: VendorDetailPIcklJuiceWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: VendorDetailPIcklJuiceWidget(),
          ),
        ),
        FFRoute(
          name: VendorDetailSunSkiSportsWidget.routeName,
          path: VendorDetailSunSkiSportsWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: VendorDetailSunSkiSportsWidget(),
          ),
        ),
        FFRoute(
          name: VendorDetailBikestopWidget.routeName,
          path: VendorDetailBikestopWidget.routePath,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: VendorDetailBikestopWidget(),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/aLandingPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Color(0xFB090909),
                  child: Image.asset(
                    'assets/images/landing_logo1dark.png',
                    fit: BoxFit.contain,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
