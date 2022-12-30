import 'package:flutter/material.dart';
import 'package:vintagecars_seller/home_screen/home.dart';
import 'package:vintagecars_seller/used_car/view/used_car.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // FocusScope.of(context).unfocus();

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
                      'assets/image/images.png',
                      fit: BoxFit.cover,
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
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorite'),
            onTap: () {},
          ),
          const SizedBox(
            height: 9,
          ),
          ListTile(
            leading: const Icon(Icons.car_rental_outlined),
            title: const Text('Vintage car'),
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
            leading: const Icon(Icons.car_rental_outlined),
            title: const Text('Used car'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (context) => const UsedCar(),
                ),
              );
            },
          ),
          const SizedBox(
            height: 9,
          ),
          ListTile(
            leading: const Icon(Icons.account_box),
            title: const Text('Profile'),
            onTap: () {},
          ),
          const SizedBox(
            height: 9,
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share'),
            onTap: () {},
          ),
          const SizedBox(
            height: 9,
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: const Center(
                  child: Text(
                    '7',
                    style: TextStyle(color: Colors.white, fontSize: 12),
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
            title: const Text('Settings'),
            onTap: () {},
          ),
          const SizedBox(
            height: 9,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
