import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nduru_mobile_aplication/screens/login.dart';
import '/screens/contact_screen.dart';
import '/screens/report_screen.dart';
import 'package:nduru_mobile_aplication/widget/navigation_drawer_widget.dart';

// import 'package:shared_preferences/shared_preferences.dart';


// import 'package:forms_app/pages/addEmergency.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:forms_app/screens/maindrawer.dart';
// import 'package:forms_app/services/location.dart';
// import 'package:forms_app/pages/contacts.dart';
// import 'package:forms_app/services/device.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
    static const routeName = '/home';


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<bool> exitDialog(){
    return showDialog(
      context: context,
     builder: (context) => new AlertDialog(
       title: Text('Are you Sure you want to logout'),
       content: Text('Do you want to logout'),
       actions: [
         FlatButton(
           child: Text('LOGOUT'),
           onPressed: (){
             Navigator.pushNamed(context, LoginScreen.routeName);
           },
         ),
         FlatButton(
           child: Text('CANCEL'),
           onPressed: (){
             Navigator.of(context).pop(false);
           },
         )
       ],
     )
     ).then((value) => value ?? false);
  }


  Future<void> goToContacts() async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => ContactScreen()),
        (route) => false);
  }

  Widget buildEmergencyAndPhone() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 3, 0, 3),
      child: Row(
        children: [
          Container(
            width: 192.0,
            height: 210.0,
            color: Color.fromARGB(255, 235, 237, 237),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => ReportScreen()),
                    (route) => false);
              },
              child: Card(
                child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: LayoutBuilder(builder: (context, constraint) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.warning_rounded,
                              size: constraint.maxWidth, color: Colors.red[800]),
                          Text("Emergency")
                        ],
                      );
                    })),
              ),
            ),
          ),
          Container(
            width: 192.0,
            height: 210.0,
            color: Color.fromARGB(255, 235, 237, 237),
            child: InkWell(
              onTap: () {
                goToContacts();
              },
              child: Card(
                child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: LayoutBuilder(builder: (context, constraint) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.contact_phone,
                              size: constraint.maxWidth, color: Colors.green),
                          Text("Contacts")
                        ],
                      );
                    })),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInfoAndServices() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 3, 0, 3),
      child: Row(
        children: [
          Container(
            width: 192.0,
            height: 210.0,
            color: Color.fromARGB(255, 235, 237, 237),
            child: InkWell(
              onTap: () {},
              child: Card(
                child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: LayoutBuilder(builder: (context, constraint) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.settings_rounded,
                              size: constraint.maxWidth, color: Colors.cyan),
                          Text("Services")
                        ],
                      );
                    })),
              ),
            ),
          ),
          Container(
            width: 192.0,
            height: 210.0,
            color: Color.fromARGB(255, 235, 237, 237),
            child: InkWell(
              onTap: () {},
              child: Card(
                child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: LayoutBuilder(builder: (context, constraint) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.info_outlined,
                              size: constraint.maxWidth, color: Colors.blue),
                          Text("Information")
                        ],
                      );
                    })),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildReportsAndHotspots() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 3, 0, 3),
      child: Row(
        children: [
          Container(
            width: 192.0,
            height: 210.0,
            color: Color.fromARGB(255, 235, 237, 237),
            child: InkWell(
              onTap: () {},
              child: Card(
                child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: LayoutBuilder(builder: (context, constraint) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.file_present_rounded,
                              size: constraint.maxWidth, color: Colors.amber),
                          Text("Reports")
                        ],
                      );
                    })),
              ),
            ),
          ),
          Container(
            width: 192.0,
            height: 210.0,
            color: Color.fromARGB(255, 235, 237, 237),
            child: InkWell(
              onTap: () {},
              child: Card(
                child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: LayoutBuilder(builder: (context, constraint) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.dangerous_rounded,
                              size: constraint.maxWidth, color: Colors.black),
                          Text("Hotspots")
                        ],
                      );
                    })),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Future<void> myDevice() async {
  //   DeviceInfo instance = await DeviceInfo();
  //   await instance.userDevice();
  // }

  // Future<void> currentUserLocation() async {
  //   getUserCoordinates instance = getUserCoordinates();
  //   await instance.getCurrentLocation();
  //   Placemark placeMark = instance.placemarks![0];
  //   String locality = placeMark.locality as String;
  //   String street = placeMark.street as String;
  //   print("$locality");
  //   print("$street");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Nduru"),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.volume_up),
            SizedBox(
              width: 60,
            ),
          ],
        ),

        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.logout),
            label: Text('logout'),
            onPressed: ()  {
            exitDialog();                
            // await _auth.signOut();
            },
          )
        ],

        // centerTitle: true,
      ),
      drawer: NavigationDrawerWidget(),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildEmergencyAndPhone(),
          buildInfoAndServices(),
          buildReportsAndHotspots(),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[800],
        onPressed: () {
          // myDevice();
          // currentUserLocation();
          // Navigator.pushNamed(context, "/location");
        },
        child: Icon(Icons.warning, color: Colors.red),
      ),
    );
  }
}