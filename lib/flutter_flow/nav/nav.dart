import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Colors.black,
                child: Center(
                  child: Image.asset(
                    'assets/images/motif-site-icon.png',
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
          : NavBarPage(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Colors.black,
                    child: Center(
                      child: Image.asset(
                        'assets/images/motif-site-icon.png',
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
              : NavBarPage(),
          routes: [
            FFRoute(
              name: 'Shop',
              path: 'shop',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Shop')
                  : ShopWidget(),
            ),
            FFRoute(
              name: 'ProductPage',
              path: 'productPage',
              builder: (context, params) => ProductPageWidget(
                id: params.getParam('id', ParamType.int),
                discount: params.getParam('discount', ParamType.int),
                stock: params.getParam('stock', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'CartPage',
              path: 'cartPage',
              builder: (context, params) => CartPageWidget(),
            ),
            FFRoute(
              name: 'ShippingDetails',
              path: 'shippingDetails',
              builder: (context, params) => ShippingDetailsWidget(),
            ),
            FFRoute(
              name: 'Checkout',
              path: 'checkout',
              builder: (context, params) => CheckoutWidget(),
            ),
            FFRoute(
              name: 'MyAccount',
              path: 'myAccount',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'MyAccount')
                  : MyAccountWidget(),
            ),
            FFRoute(
              name: 'EditProfile',
              path: 'editProfile',
              builder: (context, params) => EditProfileWidget(),
            ),
            FFRoute(
              name: 'ThankYou',
              path: 'thankYou',
              builder: (context, params) => ThankYouWidget(
                orderDetails: params.getParam('orderDetails', ParamType.JSON),
              ),
            ),
            FFRoute(
              name: 'OrderHistory',
              path: 'orderHistory',
              builder: (context, params) => OrderHistoryWidget(),
            ),
            FFRoute(
              name: 'SingleOrder',
              path: 'singleOrder',
              builder: (context, params) => SingleOrderWidget(
                singleOrder: params.getParam('singleOrder', ParamType.JSON),
                orderNotes: params.getParam('orderNotes', ParamType.JSON),
              ),
            ),
            FFRoute(
              name: 'Support',
              path: 'support',
              builder: (context, params) => SupportWidget(),
            ),
            FFRoute(
              name: 'AllProdudcts',
              path: 'allProdudcts',
              builder: (context, params) => AllProdudctsWidget(
                filter: params.getParam('filter', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Search',
              path: 'search',
              builder: (context, params) => SearchWidget(),
            ),
            FFRoute(
              name: 'Reviews',
              path: 'reviews',
              builder: (context, params) => ReviewsWidget(
                reviews: params.getParam('reviews', ParamType.JSON),
              ),
            ),
            FFRoute(
              name: 'SearchNav',
              path: 'searchNav',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'SearchNav')
                  : NavBarPage(
                      initialPage: 'SearchNav',
                      page: SearchNavWidget(),
                    ),
            ),
            FFRoute(
              name: 'Login-Register',
              path: 'loginRegister',
              builder: (context, params) => LoginRegisterWidget(),
            ),
            FFRoute(
              name: 'SearchResult',
              path: 'searchResult',
              builder: (context, params) => SearchResultWidget(
                searchText: params.getParam('searchText', ParamType.String),
                filter: params.getParam('filter', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'AllCats',
              path: 'allCats',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'AllCats')
                  : AllCatsWidget(),
            ),
            FFRoute(
              name: 'SingleCat',
              path: 'singleCat',
              builder: (context, params) => SingleCatWidget(
                catId: params.getParam('catId', ParamType.int),
                catName: params.getParam('catName', ParamType.String),
                filter: params.getParam('filter', ParamType.String),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
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

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
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
      (state.extraMap.length == 1 &&
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
    ParamType type, [
    bool isList = false,
  ]) {
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
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
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

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.rightToLeft,
        duration: Duration(milliseconds: 200),
      );
}
