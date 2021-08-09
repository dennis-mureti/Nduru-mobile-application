import 'package:flutter/material.dart';

import '/screens/home_screen.dart';
import '/screens/profile_screen.dart';
import '/screens/user_screen.dart';
import '/screens/report_screen.dart';
import '/screens/incidents.dart';
import '/screens/contact_screen.dart';


class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'Dennis Mureti';
    final email = 'dennismu@gmail.com';
    final urlImage = 
        'https://pyxis.nymag.com/v1/imgs/cc7/0ba/f8f09cf15c22bc493492c81b7b192c411c-11-rick-and-morty-304.rsquare.w700.jpg';

    return Drawer(
      child: Material(
        color: Color.fromRGBO(180, 75, 50, 1),
        child: ListView(
          padding: padding,
          children: <Widget>[
    
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserPage(
                  name: 'dennis Mureti',
                  urlImage: urlImage,
                )
              )),
            ),

            const SizedBox(height:16),
            buildMenuItem(
              text: 'Home',
              icon: Icons.home,
              onClicked: () => selectedItem(context, 0),
            ),

            const SizedBox(height:16),
            buildMenuItem(
              text: 'Profile',
              icon: Icons.account_circle,
              onClicked: () => selectedItem(context, 1),
            ),

            const SizedBox(height:16),
            buildMenuItem(
              text: 'Report incidence',
              icon: Icons.report_problem,
              onClicked: () => selectedItem(context, 2),
            ),

            const SizedBox(height:16),
            buildMenuItem(
              text: 'Reported',
              icon: Icons.report,
              onClicked: () => selectedItem(context, 3),
            ),

            const SizedBox(height:16),
            buildMenuItem(
              text: 'Emergency Contact Persons',
              icon: Icons.phone_in_talk,
              onClicked: () => selectedItem(context, 4),

            ),

            const SizedBox(height:16),
            buildMenuItem(
              text: 'Black spot mapping',
              icon: Icons.place,
            ),

            const SizedBox(height:24),
            Divider(color: Colors.white70),
            const SizedBox(height: 24),
            buildMenuItem(
              text: 'Settings',
              icon: Icons.settings,
            ),

            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Notifications',
              icon: Icons.notifications_outlined,
            ),

            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Terms and conditions',
              icon: Icons.segment,
            ),

            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Logout',
              icon: Icons.logout,
            ),

          ],
        ),
      ),
    );
  }
}

Widget buildHeader({
  required String urlImage,
  required String name,
  required String email,
  required VoidCallback onClicked,
}) => 
    InkWell(
      onTap: onClicked,
      child: Container(
        // padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
         padding: EdgeInsets.symmetric(vertical: 40),
        child: Row(
          children: [
            CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            )
          ]
        ),
      )
    );

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
})  {
  final color = Colors.white;
  final hoverColor = Colors.white70;

  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: TextStyle(color: color)),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index){
  Navigator.of(context).pop();


  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));

      break;

    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProfileScreen(),
      ));
      break;

      case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ReportScreen(),
      ));
      break;

      case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Incidents(),
      ));
      break;

      case 4:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ContactScreen(),
      ));
      break;
  }
}