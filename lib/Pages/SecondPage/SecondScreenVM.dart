
// import the Bo file frm the project
import 'package:event/Bo/Events.dart';
// import the NavigationHelper file of NavigationMixin
import 'package:event/Helpers/NavigationHelper/Mixin/NavigationMixin.dart';
// imporgt the package as secondScreenModel
import 'package:event/Pages/SecondPage/SecondScreenModel.dart';

//  import the Naviagtion Routes from the project
import '/Helpers/NavigationHelper/Routes.dart';

//  Create the class as SecondScreen which extends the SecondScreenModel
class SecondScreenVM extends SecondScreenModel{

//  Create the constructor and set the value as parameter as required on Event type
SecondScreenVM({required Events value}){
  // Assign the collectionOfEvents to the paramter value
  collectionOfEvents=value;


}
/* Create the method of as navigateFirstPage to pop to the prevoius page */
void navigateFirstPage(){
   navigationStream.add(NavigatorPop(pageConfig: Pages.homeScreenConfig));
}
}