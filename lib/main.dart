import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_start_new/constants.dart';
import 'package:flutter_start_new/view/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFFF1F5F9)
      ));
   runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home())
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    deviceheight = MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.top + kToolbarHeight);  ////kToolbarheight is app bar height. need to difference this and bottom bar(if exist) to get the actual height
    devicewidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)),
        home: HomePage());
  }
}

// class Layoutbuilder extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: SafeArea(
//         child: Container(
//           height: 500,
//           width: double.infinity,
//           color: Colors.blue,
//           child: LayoutBuilder(
//               builder: (BuildContext context, value){  //value is Container height and width
//                 return Row(
//                   children: [
//                     Container(
//                       height: value.maxHeight * 0.5, //this will return 250 height
//                       width: value.maxWidth * 0.5,  //this will return half width
//                       color: Colors.red,
//                     )
//                   ],
//
//                 );
//
//               }),
//         )));
//   }
// }


