import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom/resources/auth_method.dart';
import 'package:zoom/screens/about_us.dart';
import 'package:zoom/screens/history_meeting_screen.dart';
import 'package:zoom/screens/meeting_screen.dart';
import 'package:zoom/utils/color.dart';
import 'package:zoom/widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeeting(),
     AboutUs(),
    CustomButton(
      text: 'Log out',
      ontap: () {
        AuthMethod().signout();
      },
    ),
  ];

   GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //Appbar
      appBar: AppBar(
        title:  Text(
          'Meet And Chats',
          style: GoogleFonts.abhayaLibre(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize:28
          ),
        ),
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
      ),
      //body of page
      body: pages[_page],

      //bottom navigation bar
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor:backgroundColor ,
        //selectedItemColor: Colors.white,
        //unselectedItemColor: Colors.grey,
        //unselectedFontSize: 14,
        //currentIndex: _page,
        //type: BottomNavigationBarType.fixed,
        onTap: onPageChanged,
        items: const [
             Icon(Icons.meeting_room,color: Colors.black,),
             Icon(Icons.chat_rounded,color: Colors.black,),
             Icon(Icons.person,color: Colors.black,),
             Icon(Icons.settings,color: Colors.black,),
        ],
      ),
    );
  }
}
