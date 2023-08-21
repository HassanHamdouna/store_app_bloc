import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/preferences/shared_pref_controller.dart';
import 'package:store_app/utils/context_extenssion.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      bool login = SharedPrefController().getValueKey<bool>(PrefKey.loginIn.name)??false;
      String rout = login? '/bottom_navigation_screen' :'/on_boarding_screen';
      Navigator.pushReplacementNamed(context, rout);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
          gradient:  LinearGradient(
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
            colors: [
              Colors.white,
              Colors.black,
            ]
          )
        ),
        child: Text(context.localizations.title_app,style: GoogleFonts.poppins(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold
        )),

      ),
    );
  }
}
