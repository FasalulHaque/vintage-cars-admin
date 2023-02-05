import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vintagecars_seller/add_used_cars/view/add_used_car.dart';
import 'package:vintagecars_seller/drawerScreen/drawerScreen.dart';
import 'package:vintagecars_seller/used_car/view/usedcar_details.dart';

class UsedCar extends StatelessWidget {
  UsedCar({super.key});

  CollectionReference usedcar =
      FirebaseFirestore.instance.collection('Usedcar_collection');
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Text(
            'Used Cars',
            style: GoogleFonts.abel(color: Colors.black),
          ),
        ),
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: usedcar
            .where('user_id', isEqualTo: auth.currentUser!.uid)
            .snapshots(),
        builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
        ) {
          if (snapshot.hasData) {
            final useditems = snapshot.data!.docs;
            return SingleChildScrollView(
              child: GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: useditems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  mainAxisExtent: 340,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (context) =>
                              UsedCarDetails(usedAxis: useditems[index]),
                        ),
                      );
                    },
                    child: Padding(
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
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Image.network(
                                useditems[index]['cars_imags'][0].toString(),
                                height: 100,
                                width: 200,

                                //fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 110),
                              child: Image.network(
                                useditems[index]['brands_logo'].toString(),
                                height: 50,
                                width: 50,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              useditems[index]['cars_name'].toString(),
                              style: GoogleFonts.actor(fontSize: 17),
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  height: 70,
                                  width: 15,
                                ),
                                const Icon(
                                  Icons.currency_rupee,
                                  size: 20,
                                ),
                                Text(
                                  useditems[index]['cars_price'].toString(),
                                  style: GoogleFonts.andadaPro(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
              builder: (context) => AddUsedCars(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
