import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vintagecars_seller/login_page/view/login.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Welcome',
                  style: GoogleFonts.alice(
                    fontSize: 45,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Container(
                height: 450,
                // height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    scale: 0.1,
                    image: AssetImage(
                      'assets/image/secure-login-concept-illustration_114360-4582-removebg-preview.png',
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  LoginScreen(),
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      // ignore: avoid_redundant_argument_values
                      side: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      'Login',
                      style: GoogleFonts.alike(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: <Widget>[
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {},
                        color: const Color.fromARGB(255, 32, 152, 237),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          'Sign up',
                          style: GoogleFonts.alike(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
