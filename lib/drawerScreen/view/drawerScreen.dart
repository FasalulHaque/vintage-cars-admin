import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vintagecars_seller/drawerScreen/drawerScreen.dart';
import 'package:vintagecars_seller/home_screen/home.dart';
import 'package:vintagecars_seller/used_car/view/used_car.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 250,
            child: UserAccountsDrawerHeader(
              accountName: const Text('Fasalul Haque'),
              accountEmail: const Text('Fasalulhaque@gmail.com'),
              currentAccountPictureSize: const Size.square(100),
              currentAccountPicture: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/image/portrait-white-man-isolated_53876-40306.webp',
                      fit: BoxFit.cover,
                      width: 80,
                      height: 110,
                    ),
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://static1.makeuseofimages.com/wordpress/wp-content/uploads/2017/02/Photoshop-Replace-Background-Featured.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.car),
            title: Text(
              'Electric Car',
              style: GoogleFonts.adamina(color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
          ),
          const SizedBox(
            height: 9,
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.car),
            title: Text(
              'Used car',
              style: GoogleFonts.adamina(color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (context) => UsedCar(),
                ),
              );
            },
          ),
          const SizedBox(
            height: 9,
          ),
          ListTile(
            leading: const Icon(Icons.bookmark_outline_sharp),
            title: Text(
              'Bookings ',
              style: GoogleFonts.adamina(color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (context) => BookingsUserss(),
                ),
              );
            },
          ),
          const SizedBox(
            height: 9,
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: Text(
              'Notifications',
              style: GoogleFonts.adamina(color: Colors.black),
            ),
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '7',
                    style: GoogleFonts.adamina(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 9,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              'Settings',
              style: GoogleFonts.adamina(color: Colors.black),
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 9,
          ),
        ],
      ),
    );
  }
}
