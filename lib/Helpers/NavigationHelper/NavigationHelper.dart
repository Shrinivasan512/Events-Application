// ignore_for_file: constant_identifier_names, file_names, non_constant_identifier_names, library_private_types_in_public_api
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'Routes.dart';
part 'NavigationHelperMixin.dart';

final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

class PageConfig<T> {
  Routes route;
  var data;
  Widget Function(BuildContext) build;
  BottomNavigationConfig? bottomNavigationConfig;

  PageConfig(
      {required this.route,
      required this.build,
      this.data,
      this.bottomNavigationConfig});
}

class BottomNavigationConfig = _BottomNavConfigMobxBase
    with _$BottomNavigationConfig;

abstract class _BottomNavConfigMobxBase with Store {
  final List<BottomNavigationBarItem> subTabUIConfigs;
  final List<Navigator> subTabConfigs;

  final Color? selectedItemColor;
  final Color? unselectedItemColor;

  @observable
  int currentIndex = 0;

  final PageController pageController = PageController();

  final void Function(int value)? onTap;


  Key? key;
  double? elevation;
  BottomNavigationBarType? type;
  Color? fixedColor;
  Color? backgroundColor;
  double iconSize = 24.0;
  IconThemeData? selectedIconTheme;
  IconThemeData? unselectedIconTheme;
  double selectedFontSize = 14.0;
  double unselectedFontSize = 12.0;
  TextStyle? selectedLabelStyle;
  TextStyle? unselectedLabelStyle;
  bool? showSelectedLabels;
  bool? showUnselectedLabels;
  MouseCursor? mouseCursor;
  bool? enableFeedback;
  BottomNavigationBarLandscapeLayout? landscapeLayout;
  bool useLegacyColorScheme = true;

  BottomNavigationBar generateBottomNavigationConfig() {
    return BottomNavigationBar(
        items: subTabUIConfigs,
        currentIndex: currentIndex,
        selectedItemColor: selectedItemColor,
        unselectedItemColor: unselectedItemColor,
        onTap: onTap??bottomNavOntap,
        backgroundColor: backgroundColor,
        elevation: elevation,
        enableFeedback: enableFeedback,
        fixedColor: fixedColor,
        iconSize: iconSize,
        key: key,
        landscapeLayout: landscapeLayout,
        mouseCursor: mouseCursor,
        selectedFontSize: selectedFontSize,
        selectedIconTheme: selectedIconTheme,
        selectedLabelStyle: selectedLabelStyle,
        showSelectedLabels: showSelectedLabels,
        showUnselectedLabels: showUnselectedLabels,
        type: type,
        unselectedFontSize: unselectedFontSize,
        unselectedIconTheme: unselectedIconTheme,
        unselectedLabelStyle: unselectedLabelStyle,
        useLegacyColorScheme: useLegacyColorScheme,
    );
  }

  void bottomNavOntap(event) {
    if (pageController.hasClients) {
      pageController.jumpToPage(event);
      currentIndex = event;
    }
  }

  _BottomNavConfigMobxBase(
      {this.onTap,
      this.currentIndex = 0,
      required this.subTabUIConfigs,
      required this.subTabConfigs,
      this.selectedItemColor,
      this.unselectedItemColor});
}

class CustomRouteSettings<T> {
  final PageConfig pageConfig;
  final T? data;

  const CustomRouteSettings({required this.pageConfig, this.data});
}

MaterialPageRoute builder<T>(CustomRouteSettings<T> sharedData) {
  sharedData.pageConfig.data = sharedData.data;
  return MaterialPageRoute(
      builder: sharedData.pageConfig.build,
      settings: RouteSettings(
        name: resolveRoute(sharedData.pageConfig.route)
      ));
}

String resolveRoute<T>(T route) =>
    "/${route.toString().split('.').last.toLowerCase()}";

extension Navigations on BuildContext {
  void push({required PageConfig pageConfig, data, bool checkMounted = false}) {
    print(resolveRoute(pageConfig.route));
    if (checkMounted) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (mounted) {
          Navigator.pushNamed(this, resolveRoute(pageConfig.route),
              arguments:
                  CustomRouteSettings(pageConfig: pageConfig, data: data));
        }
      });
    } else {
      Navigator.pushNamed(this, "/firstpage",
          arguments: CustomRouteSettings(pageConfig: pageConfig, data: data));
    }
  }

  void pushReplace(
      {required PageConfig pageConfig, data, bool checkMounted = false}) {
    if (checkMounted) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (mounted) {
          Navigator.pushReplacementNamed(this, resolveRoute(pageConfig.route),
              arguments:
                  CustomRouteSettings(pageConfig: pageConfig, data: data));
        }
      });
    } else {
      Navigator.pushReplacementNamed(this, resolveRoute(pageConfig.route),
          arguments: CustomRouteSettings(pageConfig: pageConfig, data: data));
    }
  }

  void popAndPush(
      {required PageConfig pageConfig, data, bool checkMounted = false}) {
    if (checkMounted) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (mounted) {
          Navigator.popAndPushNamed(this, resolveRoute(pageConfig.route),
              arguments:
                  CustomRouteSettings(pageConfig: pageConfig, data: data));
        }
      });
    } else {
      Navigator.popAndPushNamed(this, resolveRoute(pageConfig.route),
          arguments: CustomRouteSettings(pageConfig: pageConfig, data: data));
    }
  }

  void pop({data, bool checkMounted = false, required pageConfig}) {
    if (checkMounted) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (mounted) {
          Navigator.pop(this, data);
        }
      });
    } else {
      Navigator.pop(this, data);
    }
  }

  void pushAndRemoveUntil(
      {required PageConfig pageConfig,
      data,
      bool checkMounted = false,
      required PageConfig removeUntilpageConfig}) {
    if (checkMounted) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(
              this,
              resolveRoute(pageConfig.route),
              ModalRoute.withName(resolveRoute(removeUntilpageConfig.route)),
              arguments:
                  CustomRouteSettings(pageConfig: pageConfig, data: data));
        }
      });
    } else {
      Navigator.pushNamedAndRemoveUntil(
          this,
          resolveRoute(pageConfig.route),
          ModalRoute.withName(resolveRoute(removeUntilpageConfig.route)),
          arguments: CustomRouteSettings(pageConfig: pageConfig, data: data));
    }
  }
}


class AppRoute {
  late PageConfig initialPage;
  late Object? initialPageData;

  AppRoute({required this.initialPage, required this.initialPageData});

  Route onGenerateRoute(RouteSettings settings) {
    debugPrint("Setings name :${settings.name}");
    try {
      var customSettings = settings.arguments as CustomRouteSettings;
      return builder(
        CustomRouteSettings(
          pageConfig: customSettings.pageConfig,
          data: customSettings.data,
        ),
      );
    } on TypeError {
      return builder(
        CustomRouteSettings(
          pageConfig: initialPage,
          data: "",
        ),
      );
    } catch (error) {
      debugPrint(error.toString());
      return builder(
        CustomRouteSettings(
          pageConfig: Pages.homeScreenConfig,
          data: "",
        ),
      );
    }
  }
}