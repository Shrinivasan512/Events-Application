import 'package:event/Bo/Events.dart';
import 'package:event/Helpers/NavigationHelper/Mixin/NavigationMixin.dart';
import 'package:event/Helpers/NavigationHelper/NavigationHelper.dart';
import 'package:event/Pages/SecondPage/SecondScreenVM.dart';
import 'package:flutter/material.dart';

//  Create the class as SecondScreen using the StatefulWidget
class SecondScreen extends StatefulWidget {
  //  Get the Data as the required parameter from the prevoius page
  const SecondScreen({super.key, required this.data});
  //  Assign the type as Events and the data as final
  final Events data;


//  Create state for SecondScreen 
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

//  Class of the SecondScreen extends the State of the type SecondScreen
class _SecondScreenState extends State<SecondScreen> {
 
  //  Create an Instance to the SecondScreen as final and with late
  late final SecondScreenVM _screenVM = SecondScreenVM(value: widget.data);

/* Mothod of the iniitstate is  */
  @override
  void initState() {
    super.initState();
    // Instance of the homeScreen uses the listen the event passed from the navigatorPop
    _screenVM.navigationStream.stream.listen((event) {
      // Condition checks the type of the event and the NavigatorPush
      if (event is NavigatorPop) {
        // Context push the page config the event of the data to the pervious page
        context.pop(pageConfig: Page);
      }
    });
  }

  /* Method of the dispose has been created with the type as void*/
  void dispose() {
    // Invoke the dispose function
    _screenVM.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              //  Invoke the method navigateFirstPage by the instance
              _screenVM.navigateFirstPage();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          "Event Details",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          //Image widget uses the instance of the collectionofEvents element bookMark
          Image.asset(

            // Use the ternary operator to execute the image to the Screen from the collection of list
            _screenVM.collectionOfEvents.BookMark == "true"
                ? "lib/Helpers/Resources/Asset/Imagess/icon.png"
                : "lib/Helpers/Resources/Asset/Imagess/icon1.png",
            width: 55,
            height: 28,
            color: Colors.black,
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 200,
        height: 50,
        child: FloatingActionButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Buy Ticket  \$120",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 18),
              CircleAvatar(
                  radius: 18,
                  backgroundColor: Color(0xff3D56F0),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ))
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          backgroundColor: Color(0xff5669FF),
          splashColor: Colors.blue,
          tooltip: "The Message to All",
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      "lib/Helpers/Resources/Asset/Imagess/Event.png",
                      width: 392,
                      height: 187,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 7),
                  child: Text(
                    _screenVM.collectionOfEvents.eventName,
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  height: 250,
                  width: 400,
                  alignment: Alignment.centerLeft,
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.calendar_month_rounded,
                          color: Color(0xff5669FF),
                        ),
                        title: Align(
                            alignment: Alignment.centerLeft,
                            child:
                                // Get the data from the pervious pg as the eventdate by the instance
                                Text(_screenVM.collectionOfEvents.eventdate)),
                        subtitle: Align(
                            alignment: Alignment.centerLeft,
                            // Get the data from the pervious pg as the time by the instance
                            child: Text(_screenVM.collectionOfEvents.time)),
                      ),
                      ListTile(
                        leading: Image.asset(
                          "lib/Helpers/Resources/Asset/Imagess/location.png",
                          height: 40,
                          width: 25,
                        ),
                        title: Align(
                            alignment: Alignment.centerLeft,
                            child:
                                // Get the data from the pervious pg as the centername by the instance

                                Text(_screenVM.collectionOfEvents.centername)),
                        subtitle: Align(
                            alignment: Alignment.centerLeft,
                            // Get the data from the pervious pg as the address by the instance
                            child: Text(_screenVM.collectionOfEvents.address)),
                      ),
                      ListTile(
                        leading: Container(
                            height: 70,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.black26,
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "lib/Helpers/Resources/Asset/Imagess/profile.png")))),
                        title: Align(
                            alignment: Alignment.centerLeft,
                            child:
                                // Get the data from the pervious pg as the organizer by the instance

                                Text(_screenVM.collectionOfEvents.organizer)),
                        subtitle: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Organizer")),
                        trailing: SizedBox(
                            width: 50,
                            child: Container(
                              height: 28,
                              width: 60,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                  color: Color(0xffeaedff)),
                              child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Follow",
                                    style: TextStyle(
                                      color: Color(0xff5669FF),
                                    ),
                                  )),
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Row(
                    children: const [
                      Text(
                        "About Event",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff120D26),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    "Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More...",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w200),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
