import 'package:flutter/material.dart';
import 'package:zoom/utils/data.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   iconTheme: const IconThemeData(color: Colors.white),
      //   centerTitle: true,
      //   backgroundColor: Colors.blue,
      //   title: const Text(
      //     "Meet And Chats",
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    border: Border.all(
                      width: 5,
                      color: Colors.orange.shade600,
                    ),
                    image:  DecorationImage(
                    
                      image: NetworkImage(profilePath),
                      
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LeaderName,
                  style:const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15,),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    bio,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}