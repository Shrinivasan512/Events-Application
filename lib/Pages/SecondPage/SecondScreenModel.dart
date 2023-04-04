//  import the packages of widgets  
import 'package:flutter/material.dart';
// import the widgets package into the file
import 'package:flutter/widgets.dart';
// import the mobx packages 
import 'package:mobx/mobx.dart';

// import the NavigationHelper file of NavigationMixin

import '../../Helpers/NavigationHelper/Mixin/NavigationMixin.dart';
// import the Bo file frm the project
import '/Bo/Events.dart';

// Generate the SecondScreenModel builder 
part 'SecondScreenModel.g.dart';

//   Class of the SecondScreenModel with the Mixin of the SecondScreenModel and the NavigationMixin 
class SecondScreenModel = _SecondScreenModel
    with _$SecondScreenModel, NavigationMixin;

/* Abstract Class of the _SecondScreenModel with the mixin of Store */
abstract class _SecondScreenModel with Store {
  
  // Make the variable collectionsOfEvents in the type of Events and as late to wait the process
  late Events collectionOfEvents ;

     

}
