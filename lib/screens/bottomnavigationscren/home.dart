import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playgames/models/responce.dart';
import 'package:playgames/screens/tabbarscreens/screen1.dart';
import 'package:playgames/screens/tabbarscreens/screen2.dart';
import 'package:playgames/screens/tabbarscreens/screen33.dart';
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
       
       
       appBar: PreferredSize(preferredSize: Size.fromHeight(120), child: 
       AppBar(
        
       
       backgroundColor: Color.fromARGB(255, 32, 29, 29),
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
        bottom: TabBar(
          
          tabs: [
          Tab(
            text: "hlo",
          ),
           Tab(
            text: "hi",
          ),
           Tab(
            text: "speek",
          )
        ]),
       )
       ), 
        
        body:
        // ListView.builder(
        //   itemCount: items.length,
        //   itemBuilder: (context, index) {
        //   final data=items[index];
        //   categories=data.categories!.en;
        //   print(categories);
        //   return Text(categories.toString(),style: TextStyle(color: Colors.white),);
        // },)
        TabBarView(children:[
          screen1(),
          screen2(),
          screen3()
        ] ) 
        // ListView(
        //   children: [
        //      Padding(
        //       padding: const EdgeInsets.only(top: 18,bottom: 15),
        //       child:
        // ListTile(
        //         title: 
        // Text("Hello Gamers !",style: GoogleFonts.robotoSlab(color:Colors.white,fontWeight:FontWeight.w500,fontSize:25),),
        //         subtitle:  Text("Find your favourite game",style: GoogleFonts.robotoSlab(color:Colors.grey),),
        //       ),
            // ),
            //  Padding(
            //    padding: const EdgeInsets.all(13.0),
            //    child: Text("Categories",style: GoogleFonts.robotoSlab(color:Colors.white,fontWeight:FontWeight.w400,fontSize:20),),
            //  ),
              
            
        //   ],
        // ),
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