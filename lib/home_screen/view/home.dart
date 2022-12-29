import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vintagecars_seller/add_cars/view/add_Vintage_cars.dart';
import 'package:vintagecars_seller/drawerScreen/view/drawerScreen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  CollectionReference addCars = FirebaseFirestore.instance.collection(
    'vintagecar_collection',
  );

  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Text(
            'Vintage Car',
            style: GoogleFonts.abel(color: Colors.black),
            //GoogleFonts.abrilFatface(color: Colors.black),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: TextField(
              style: GoogleFonts.abel(),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                hintText: 'Search',
                suffixIcon: const Icon(
                  Icons.search,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          // Column(
          //   children: [
          //     Row(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         Container(
          //           height: 50,
          //           width: 50,
          //           padding: const EdgeInsets.all(10),
          //           margin: const EdgeInsets.only(left: 20),
          //           decoration: BoxDecoration(
          //             color: Colors.black,
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           child: Image.network(
          //             'https://cdni.autocarindia.com/utils/imageresizer.ashx?n=https://cms.haymarketindia.net/model/uploads/modelimages/Pravaig-Defy-281120221416.jpg',
          //             height: 50,
          //             width: 50,
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //         Container(
          //           height: 50,
          //           width: 50,
          //           padding: const EdgeInsets.all(10),
          //           margin: const EdgeInsets.only(left: 20),
          //           decoration: BoxDecoration(
          //             color: Colors.black,
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //         ),
          //       ],
          //     )
          //   ],
          // ),
          GridView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              mainAxisExtent: 300,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  margin: const EdgeInsets.only(top: 18, bottom: 30),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    // Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Image.network(
                        'https://i.pinimg.com/originals/dc/19/e9/dc19e9b94a372ebc21ffeb7623d5632a.png',
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('xdcfghjk'),
                      Row(
                        children: const [
                          SizedBox(
                            height: 70,
                            width: 15,
                          ),
                          Icon(Icons.currency_rupee),
                          Text('999')
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
              builder: (context) =>  AddCars(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
