import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playgames/models/responce.dart';
import 'package:playgames/screens/webviewscreen.dart';
import 'package:playgames/services/apiclass.dart';

class screen1 extends StatefulWidget {
  const screen1({super.key});

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  List<Games> items=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 29, 29),
      body:  GridView.builder(
        
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
                        itemCount: items.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          final data =items[index];
                          final name=data.name!.en;
                          final image=data.assets!.brick;
                          final rating=data.rating;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>WebViewScreen(link: data.url)));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5
                                    )
                                  ],
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8)),
                                width: 130,
                                height: 170,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child:
                                    Stack(
                                      children: [
                                         Image.network(
                                    image.toString(),
                                      fit: BoxFit.fill,
                                      height: double.infinity,
                                    ),
                                     Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5,),
                                    child: Row(
                                      children: [
                                        Image.asset("assets/icons8-star-32.png",height: 15,),
                                        Text( rating.toString(),style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),)
                                      ],
                                    ),
                                  ),
                                ),
                               Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom:  15.0,left: 5),
                                  child: Text(
                                   name.toString(),
                                    style: GoogleFonts.robotoSlab(color:Colors.white,fontWeight:FontWeight.bold),
                                  ),
                                )),
                               
                            
                                      ],
                                    )
                                    
                                    ),
                              ),
                            ),
                          );
                        }),
    );
  }

  Future getData()async{
    final responce=await Api().getData();
    setState(() {
      items=responce;
    });
}
}