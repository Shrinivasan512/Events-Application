//  import the packages of widgets
import 'package:flutter/widgets.dart';
//import the mobx packages
import 'package:mobx/mobx.dart';
//import the Bo file frm the project
import 'package:event/Bo/Events.dart';

//import the NavigationHelper file of NavigationMixin

import '/Helpers/NavigationHelper/Mixin/NavigationMixin.dart';

// Generate the HomeScreenModel builder

part 'HomeScreenModel.g.dart';

//  Class of the HomeScreenModel with the Mixin of the HomeScreenmodel and the NavigationMixin
class HomeScreenModel = _HomeScreenModelBase
    with _$HomeScreenModel, NavigationMixin;

/* Abstract Class of the HomeScreenModel with the mixin of Store */
abstract class _HomeScreenModelBase with Store {
  // Create a list as collectionOfEvents named of type  Events
  List<Events> collectionOfEvents = [];

  // Create a list as collectionOfChip named of type  String
  List<String> collectionOfChip = [];
}
