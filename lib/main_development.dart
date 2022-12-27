
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:vintagecars_seller/app/app.dart';
import 'package:vintagecars_seller/bootstrap.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  bootstrap(() => const App());
}
