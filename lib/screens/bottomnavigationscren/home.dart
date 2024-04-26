import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playgames/models/responce.dart';
import 'package:playgames/screens/tabbarscreens/screen1.dart';
import 'package:playgames/screens/tabbarscreens/screen2.dart';
import 'package:playgames/screens/tabbarscreens/screen33.dart';
import 'package:playgames/screens/webviewscreen.dart';
import 'package:playgames/services/apiclass.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Games> items=[];
  List<String>? categories=[];
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategories();
    
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
       
       
       appBar: PreferredSize(preferredSize: Size.fromHeight(80), child: 
       AppBar(
        
       
       backgroundColor: Color.fromARGB(255, 49, 45, 45),
         title: Column(
           children: [
             ListTile(
                    title: 
                     Text("Hello Gamers !",style: GoogleFonts.robotoSlab(color:Colors.white,fontWeight:FontWeight.w500,fontSize:25),),
                    subtitle:  Text("Find your favourite game",style: GoogleFonts.robotoSlab(color:Colors.grey),),
                  ),
                        // Text("Categories",style: GoogleFonts.robotoSlab(color:Colors.black,fontWeight:FontWeight.w400,fontSize:20),),
           ],
         ) ,
       )
       ), 
        
        body:
       GridView.builder(
        
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
      ),
    );
  }

  Future getCategories()async{
    final responce=await Api().getData();
    setState(() {
      items=responce;
    });
  
  }

  
}