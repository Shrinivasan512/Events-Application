import 'package:event/Helpers/NavigationHelper/NavigationHelper.dart';
import 'package:flutter/material.dart';
import 'Helpers/NavigationHelper/Routes.dart';

// Create the class as App with the Statelesswidget
class App extends StatelessWidget {
  const App({super.key});

/* Method widget bild the context  */
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,

      // Set the ongenarate and send the function signature of AppRoute and set the initila page as homeScreen and set the data to be null
      onGenerateRoute:
          AppRoute(initialPage: Pages.homeScreenConfig, initialPageData: null)
              .onGenerateRoute,
    );
  }
}
