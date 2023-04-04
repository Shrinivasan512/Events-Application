// ignore_for_file: constant_identifier_names, unused_import

import 'package:event/Pages/HomePage/HomeScreen.dart';
import 'package:event/Pages/SecondPage/SecondScreen.dart';

import 'NavigationHelper.dart';

//Set the enum as the number of screen in the projrct
enum Routes {
  HomeScreen,
  SecondScreen
}

class Pages {
  Object? data;
  //Config the pages of the homeScreen and biuld the data in the routes
  static final PageConfig homeScreenConfig = PageConfig(route: Routes.HomeScreen,
   build: (_)=>const HomeScreen());

  //Config the pages of the SecondScreen and biuld the data in the routes
    static final PageConfig secondScreenConfig = PageConfig(route: Routes.SecondScreen,
   build: (_)=>SecondScreen(data: secondScreenConfig.data,));


}
