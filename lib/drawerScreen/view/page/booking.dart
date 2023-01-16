import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingsUserss extends StatelessWidget {
  BookingsUserss({super.key});

  final bookingg = FirebaseFirestore.instance.collection('booking_collection');
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 19,
          ),
        ),
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: bookingg.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final bookingview = snapshot.data!.docs;
            return ListView.builder(
              itemCount: bookingview.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(14),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  height: 250,
                  width: 40,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 140, top: 6),
                        child: Image.network(
                          bookingview[index]['image'].toString(),
                          height: 120,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, right: 80),
                            child: Text(
                              bookingview[index]['cars_name'].toString(),
                              style: GoogleFonts.alumniSans(
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 166, 246, 169),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Center(
                              child: Text(
                                bookingview[index]['cars_price'].toString(),
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          height: 30,
                          width: 190,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Center(
                            child: Text(
                              'Booking Confirmed',
                              style: GoogleFonts.aBeeZee(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
