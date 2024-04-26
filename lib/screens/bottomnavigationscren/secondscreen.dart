import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:playgames/models/responce.dart';
import 'package:playgames/screens/cctscreen.dart';
import 'package:playgames/services/apiclass.dart';

class Secondscreen extends StatefulWidget {
  const Secondscreen({super.key});

  @override
  State<Secondscreen> createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
var size, height, width;

  List <Games>items=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategories();
  }
  @override
  Widget build(BuildContext context) {
      size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body:ListView.separated(
                        separatorBuilder: (context, index) =>
                            Divider(thickness: 0.5, indent: width / 3.1),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                     
                        itemCount: items.length,
                        itemBuilder: (context, index) {

                          final data=items[index];
                          final image=data.assets!.brick;
                          final name=data.name!.en;
                          final rating=data.rating;
                          final plays=data.gamePlays;

                          return InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>CustomChromeScreen(link: data.url)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 8, left: 8, right: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5
                                    )
                                  ],
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8)),
                                    width: 90,
                                    height: 90,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.network(
                                         image.toString(),
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                  Flexible(
                                    child: Column(
                                      
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 10, top: 8),
                                          child: Text(
                                           name.toString()
                                           ,
                                            style: GoogleFonts.robotoSlab(fontWeight:FontWeight.w500),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                                                             
                                           Image.asset("assets/icons8-star-32.png",height: 15,),
                                           Text(rating.toString()),
                                           SizedBox(width: 14,),
                                           Image.asset("assets/icons8-download-24.png",height: 17,)  ,  
                                              
                                              Text(" ${NumberFormat.compact(locale: "en_US",).format(plays)}")
                                            ],
                                          ),
                                        ),
                                        // Row(
                                        //   children: [
                                            
                                        //   ],
                                        // )
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(onPressed: (){
                                        launchGamezop(context, data.url.toString());
                                    }, child: Text("PLAY")),
                                  )
                                ],
                              ),
                            ),
                          );
   }) );
  }

   Future getCategories()async{
    final responce=await Api().getData();
    setState(() {
      items=responce;
    });
  
  }


  void launchGamezop(BuildContext context,String link) async {// Insert your Gamezop PUB ID here
    try {
      await launchUrl(
        Uri.parse(link),
        customTabsOptions: CustomTabsOptions(

           colorSchemes: CustomTabsColorSchemes.defaults(
          toolbarColor: Theme.of(context).primaryColor,
        ),
          shareState: CustomTabsShareState.on,
          urlBarHidingEnabled: true,
          showTitle: true,
           closeButton: CustomTabsCloseButton(
          icon: CustomTabsCloseButtonIcons.back,
          
        ),
        animations: CustomTabsAnimations(),
        browser:CustomTabsBrowserConfiguration(
          fallbackCustomTabs: [
            'org.mozilla.firefox',
            'com.microsoft.emmx',
          ]
        ) ,
          // extraCustomTabs: const <String>[
          //   'org.mozilla.firefox',
          //   'com.microsoft.emmx',
          // ],
        ),
      );
    } catch (e) {
      debugPrint('Could not launch ${link}: $e');
    }
  }
}