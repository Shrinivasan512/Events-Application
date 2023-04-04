import 'package:event/Helpers/NavigationHelper/NavigationHelper.dart';
import 'package:event/Pages/HomePage/HomeScreenVM.dart';
import 'package:event/Helpers/NavigationHelper/Mixin/NavigationMixin.dart';
import 'package:event/Helpers/NavigationHelper/NavigationHelper.dart';
import 'package:flutter/material.dart';

import '../../Helpers/NavigationHelper/Mixin/NavigationMixin.dart';

//  Create the class name as HomeScreen which using the StatefulWidget
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

// Create the state for the HomeScreen
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// State of the HomeScreen extends the State of the homeScreen type
class _HomeScreenState extends State<HomeScreen> {

  // Assign the Final keyword to the instance of the constructor
  final HomeScreenVM _homeScreenVM = HomeScreenVM();

/* Method of the initstate is  */
  @override
  void initState() {
    super.initState();

    // Instance of the homeScreen uses the listen the event passed from the navigatorPush
    _homeScreenVM.navigationStream.stream.listen((event) {

      // Condition checks the type of the event and the NavigatorPush
      if (event is NavigatorPush) {

        // Context push the page config the event of the data to the another page
        context.push(pageConfig: event.pageConfig, data: event.data);
      }
    });
  }

  /* Method of the dispose has been created with the type as void*/
  void dispose() {
    
    // Invoke the dispose function
    _homeScreenVM.dispose();
    super.dispose();
  }

/* Method of the widget Context of the widgets */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff4A43EC),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                "lib/Helpers/Resources/Asset/Imagess/menu.png",
                height: 19,
                width: 25,
              ),
              Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        "Current Location",
                        style:
                            TextStyle(fontSize: 12, color: Color(0xffFFFFFF)),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      )
                    ],
                  ),
                  const Text(
                    "New Yourk, USA",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xffF4F4FE),
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const CircleAvatar(
                radius: 14,
                backgroundColor: Color(0xff3D56F0),
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 140,
                decoration: const BoxDecoration(
                    color: Color(0xff4A43EC),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 04),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 20,
                              width: 1,
                              decoration:
                                  const BoxDecoration(color: Color(0xff7974E7)),
                            ),
                            const Divider(
                              thickness: 0.5,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Search...",
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              width: 210,
                            ),
                            Container(
                                width: 75,
                                height: 32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(70),
                                    color: const Color(0xff5D56F3)),
                                child: Row(
                                 
                                  children: [
                                    Image.asset(
                                      "lib/Helpers/Resources/Asset/Imagess/Vector.png",
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    const Text(
                                      "Filters",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.white),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  SizedBox(
                    height: 45,
                    width: 370,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,

                      //  ItemCount iterate the builder till the length of the list
                      itemCount: _homeScreenVM.collectionOfChip.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 16,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Chip(
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          elevation: 0,
                          shadowColor: const Color(0xff2e2e4f),
                          padding: const EdgeInsets.all(5),
                          avatar: Image.asset(
                            // Instance invoke the collectionOfEvents[index] and checks the String inside the List
                            _homeScreenVM.collectionOfChip[index] == "Sports"
                            // True part of the List applies the statement to the Image widget
                                ? "lib/Helpers/Resources/Asset/Imagess/football.png"
                                 // Instance invoke the collectionOfEvents[index] and checks the String inside the List
                                : _homeScreenVM.collectionOfChip[index] ==
                                        "Music"
                                         // True part of the List applies the statement to the Image widget
                                    ? "lib/Helpers/Resources/Asset/Imagess/music.png"
                                     // Instance invoke the collectionOfEvents[index] and checks the String inside the List
                                    : _homeScreenVM.collectionOfChip[index] ==
                                            "Food"
                                             // True part of the List applies the statement to the Image widget
                                        ? "lib/Helpers/Resources/Asset/Imagess/kit.png"
                                         // Instance invoke the collectionOfEvents[index] and checks the String inside the List
                                        : _homeScreenVM
                                                    .collectionOfChip[index] ==
                                                "Arts"
                                                 // True part of the List applies the statement to the Image widget
                                            ? "lib/Helpers/Resources/Asset/Imagess/paint.png"
                                            // False part of the execution the statement in the image widget
                                            : "lib/Helpers/Resources/Asset/Imagess/paint.png",
                          ),
                          label: 
                          //  Build a Text widgtet and assign the values from the list at the particular index
                          Text(
                            // Invoke the Text to the widget from the List by the Instance 
                            _homeScreenVM.collectionOfChip[index],
                            style: const TextStyle(color: Colors.white),
                          ),
                          // Instance checks the String from the collection and assign the backgroundColor
                          backgroundColor: _homeScreenVM
                                      .collectionOfChip[index] ==
                                  "Sports"
                                  // Condtion statisfy the true part executes
                              ? const Color(0xffF0635A)
                               // Instance checks the String from the collection and assign the backgroundColor
                              : _homeScreenVM.collectionOfChip[index] == "Music"
                                // Condtion statisfy the true part executes
                                  ? const Color(0xffF59762)
                                   // Instance checks the String from the collection and assign the backgroundColor
                                  : _homeScreenVM.collectionOfChip[index] ==
                                          "Food"
                                            // Condtion statisfy the true part executes
                                      ? const Color(0xff29D697)
                                       // Instance checks the String from the collection and assign the backgroundColor
                                      : _homeScreenVM.collectionOfChip[index] ==
                                              "Arts"
                                                // Condtion statisfy the true part executes
                                          ? const Color(0xff46CDFB)
                                            // Condtion not statisfy the flase part executes
                                          : const Color(0xff46CDFB),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Upcoming Events",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff120D26),
                            fontSize: 25),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Text(
                        "See All",
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(Icons.arrow_forward_ios_outlined)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 310,
                    width: 350,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,

                        // 
                        itemCount: _homeScreenVM.collectionOfEvents.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 30,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  splashColor: Colors.blue,
                                  // Ontap invoke the method of navigateSecondPage
                                  onTap: () => _homeScreenVM.navigateSecondPage(
                                      index: index),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 290,
                                    width: 220,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Stack(
                                            children: [
                                              ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child:

                                                  // Build a image widgtet and assign the values from the list at the particular index
                                                  Image.asset(
                                                    // Instace gets the Image from the collections
                                                    _homeScreenVM
                                                        .collectionOfEvents[
                                                            index]
                                                        .image,
                                                    fit: BoxFit.contain,
                                                  )),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(06),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 45,
                                                      width: 45,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: const Color(
                                                              0xfff9f0ed)),
                                                      child: Column(
                                                        children: const [
                                                          Text(
                                                            "10",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Color(
                                                                    0xffF0635A)),
                                                          ),
                                                          Text(
                                                            "Jun",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Color(
                                                                    0xffF0635A)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Container(
                                                        height: 40,
                                                        width: 40,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            color: const Color(
                                                                0xfff9f0ed)),
                                                        child:
                                                        //  Build a image widgtet and assign the values from the list at the particular index
                                                         Image.asset(
                                                           // Instace gets the Image from the collections
                                                          _homeScreenVM
                                                                      .collectionOfEvents[
                                                                          index]
                                                                      .BookMark ==
                                                                  "true"
                                                              ? "lib/Helpers/Resources/Asset/Imagess/icon.png"
                                                              : "lib/Helpers/Resources/Asset/Imagess/icon1.png",
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 4),
                                            child: 
                                            //  Build a Text widgtet and assign the values from the list at the particular index
                                            Text(
                                               // Instace gets the eventname from the collections
                                              _homeScreenVM
                                                  .collectionOfEvents[index]
                                                  .eventName
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 7),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  "lib/Helpers/Resources/Asset/Imagess/Oval1.png",
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Image.asset(
                                                  "lib/Helpers/Resources/Asset/Imagess/Oval2.png",
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Text(
                                                  "+20 Going",
                                                  style: TextStyle(
                                                      color: Color(0xff3F38DD),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 7),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  "lib/Helpers/Resources/Asset/Imagess/pin.png",
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),

                                                //  Build a Text widgtet and assign the values from the list at the particular index
                                                Text(
                                                   // Instace gets the address from the collections
                                                  _homeScreenVM
                                                      .collectionOfEvents[index]
                                                      .address
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Color(0xff2B2849),
                                                      fontSize: 10),
                                                  //  overflow:TextOverflow.ellipsis,
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 340,
                            height: 130,
                            decoration: BoxDecoration(
                                color: Color(0xffd6feff),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Invite your friends",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  const Text("Get \$20 for ticket"),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    height: 38,
                                    width: 72,
                                    decoration: const BoxDecoration(
                                        color: Color(0xff00F8FF)),
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "INVITE",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            bottom: 0,
                            child: Image.asset(
                              "lib/Helpers/Resources/Asset/Imagess/decoration.png",
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        )));
  }
}
