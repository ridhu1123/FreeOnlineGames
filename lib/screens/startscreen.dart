
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:playgames/screens/homescreen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/download.jpg",fit: BoxFit.fill,height: double.infinity,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("""Adventure Realm
Begin Your Epic
Quest !""",style: GoogleFonts.robotoSlab(fontWeight: FontWeight.w900,fontSize: 25,color: Colors.white),),
                  Container(
                    decoration:const BoxDecoration(color: Color.fromARGB(255, 15, 91, 153),shape: BoxShape.circle),
                    child: ElevatedButton(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Homescreen()));
                    },style: ElevatedButton.styleFrom(shape:const CircleBorder() ,backgroundColor:const Color.fromARGB(255, 15, 91, 153) ,),child:const Icon(Icons.arrow_forward_sharp,color: Colors.white,),))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}