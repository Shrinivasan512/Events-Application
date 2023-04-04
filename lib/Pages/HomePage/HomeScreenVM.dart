// import the package of the HomeScreenModel from the project
import 'package:event/Pages/HomePage/HomeScreenModel.dart';
// import the package of the NavigationHelper from the project
import 'package:event/Helpers/NavigationHelper/Mixin/NavigationMixin.dart';
// import the package of the material
import 'package:flutter/material.dart';

// import the package of the Bo from the project
import '/Bo/Events.dart';

// import the package of the NavigationHelper from the project
import '/Helpers/NavigationHelper/Routes.dart';

//  Create a class as HomeScreenVM that extends the HomeScreenModel
class HomeScreenVM extends HomeScreenModel {
  /* Create the constructor  */
  HomeScreenVM() {
    //  Initilazes the collectionOfchip as the String type in the list
    collectionOfChip = ["Sports", "Music", "Food", "Art"];

    // Initilazes the collectionOfEvents as the String type in the list
    collectionOfEvents = [
      Events(
        // Variable image has the been initlized as the String of the path in the project
        image: "lib/Helpers/Resources/Asset/Imagess/image1.png",

        // Variable eventname has the been initlized as the String of the data
        eventName: "International Band Music Concert",

        // Variable address has the been initlized as the String of the data
        address: "36 Guild Street London, UK",

        // Variable date has the been initlized as the String of the path in the project
        date: "lib/Helpers/Resources/Asset/Imagess/image2.png",

        // Variable save has the been initlized as the String of the path in the project
        save: "lib/Helpers/Resources/Asset/Imagess/image3.png",

        // Variable time has the been initlized as the String of the data
        time: "04:00-09:00 Pm",

        // Variable organizer has the been initlized as the String of the data
        organizer: "Akash Shyam",

        // Variable centername has the been initlized as the String of the data
        centername: "Gala Convention Center",

        // Variable eventdate has the been initlized as the String of the data
        eventdate: "14 December, 2021",

        // Variable BookMark has the been initlized as the String of the data
        BookMark: "true",
      ),
      Events(
        // Variable image has the been initlized as the String of the path in the project
        image: "lib/Helpers/Resources/Asset/Imagess/image4.png",

        // Variable eventname has the been initlized as the String of the data
        eventName: "Jo Malone London’s Music Concert",

        // Variable address has the been initlized as the String of the data
        address: "Radius Gallery • Santa Cruz,CA",

        // Variable date has the been initlized as the String of the path in the project
        date: "lib/Helpers/Resources/Asset/Imagess/image2.png",

        // Variable save has the been initlized as the String of the path in the project
        save: "lib/Helpers/Resources/Asset/Imagess/image3.png",

        // Variable time has the been initlized as the String of the data
        time: "08:00-10:00 Pm",

        // Variable organizer has the been initlized as the String of the data
        organizer: "AK Master",

        // Variable centername has the been initlized as the String of the data
        centername: "Krishnan Auditorium",

        // Variable eventdate has the been initlized as the String of the data
        eventdate: "05 December, 2023",

        // Variable BookMark has the been initlized as the String of the data
        BookMark: "false",
      )
    ];
  }

  /* Create the method as the navigateSecondPage and keep the required parameter as index */
  void navigateSecondPage({required int index}) {
    // NaviagationStream Use the property of navigatorPush to add the data to the SecondPage
    navigationStream.add(NavigatorPush(
        pageConfig: Pages.secondScreenConfig, data: collectionOfEvents[index]));
  }
}
