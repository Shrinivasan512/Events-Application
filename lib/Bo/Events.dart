
/*Import the Material package */
import 'package:flutter/material.dart';

/* Create a class as Events and decalre the variables */
class Events {
  //Create the variable name as image in the type of String
  String image;
  //Create the variable name as eventname in the type of String
  String eventName;
  //Create the variable name as address in the type of String
  String address;
  //Create the variable name as date in the type of String
  String date;
  //Create the variable name as save in the type of String
  String save;
  //Create the variable name as time in the type of String
  String time;
  //Create the variable name as organizer in the type of String
  String organizer;
  //Create the variable name as centername in the type of String
  String centername;
  //Create the variable name as eventdate in the type of String
  String eventdate;
  //Create the variable name as BookMark in the type of String
  String BookMark;

/* Create the constructor set the variables as the required parameters of all the members in tha class */
  Events({
    //  Variable image as set to be as the required one in the constructor this keyword refers the data of the vaiable 
    required this.image,
    //  Variable eventname as set to be as the required one in the constructor this keyword refers the data of the vaiable 
    required this.eventName,
    //  Variable address as set to be as the required one in the constructor this keyword refers the data of the vaiable 
    required this.address,
    //  Variable date as set to be as the required one in the constructor this keyword refers the data of the vaiable 
    required this.date,
    //  Variable save as set to be as the required one in the constructor this keyword refers the data of the vaiable 
    required this.save,
    //  Variable time as set to be as the required one in the constructor this keyword refers the data of the vaiable 
    required this.time,
    //  Variable organizer as set to be as the required one in the constructor this keyword refers the data of the vaiable 
    required this.organizer,
    //  Variable centername as set to be as the required one in the constructor this keyword refers the data of the vaiable 
    required this.centername,
    //  Variable eventdate as set to be as the required one in the constructor this keyword refers the data of the vaiable 
    required this.eventdate,
    //  Variable BookMark as set to be as the required one in the constructor this keyword refers the data of the vaiable 
    required this.BookMark,
   
  });
}
