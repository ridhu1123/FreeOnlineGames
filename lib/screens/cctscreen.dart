// import 'package:flutter/material.dart';
// import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
// import 'package:playgames/screens/bottomnavigationscren/secondscreen.dart';

// class CustomChromeScreen extends StatefulWidget {
//   final link;
//   const CustomChromeScreen({super.key,required this.link});

//   @override
//   State<CustomChromeScreen> createState() => _CustomChromeScreenState();
// }

// class _CustomChromeScreenState extends State<CustomChromeScreen> {

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
   
//   }
//   @override
//   Widget build(BuildContext context) {
//      launchGamezop(context);
     
//     return Scaffold(
   
//     );
//   }

// // void launchGamezop(BuildContext context) async {// Insert your Gamezop PUB ID here
// //     try {
// //       await launchUrl(
// //         Uri.parse(widget.link),
// //         customTabsOptions: CustomTabsOptions(

// //            colorSchemes: CustomTabsColorSchemes.defaults(
// //           toolbarColor: Theme.of(context).primaryColor,
// //         ),
// //           shareState: CustomTabsShareState.on,
// //           urlBarHidingEnabled: true,
// //           showTitle: true,
// //            closeButton: CustomTabsCloseButton(
// //           icon: CustomTabsCloseButtonIcons.back,
          
// //         ),
// //         animations: CustomTabsAnimations(),
// //         browser:CustomTabsBrowserConfiguration(
// //           fallbackCustomTabs: [
// //             'org.mozilla.firefox',
// //             'com.microsoft.emmx',
// //           ]
// //         ) ,
// //           // extraCustomTabs: const <String>[
// //           //   'org.mozilla.firefox',
// //           //   'com.microsoft.emmx',
// //           // ],
// //         ),
// //       );
// //     } catch (e) {
// //       debugPrint('Could not launch ${widget.link}: $e');
// //     }
// //   }

// }