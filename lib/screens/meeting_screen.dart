import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom/resources/jitsi_meet.dart';
import 'package:zoom/widgets/option_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});

  final JitsiMeetMethod _jitsiMeetMethods = JitsiMeetMethod();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OptionButton(
              ontap: createNewMeeting,
              icon: Icons.videocam,
              text: 'New',
            ),
            OptionButton(
              ontap: () {
                Navigator.pushNamed(context, '/video-call');
              },
              icon: Icons.add_box_rounded,
              text: 'Joined',
            ),
            OptionButton(
              ontap: () {},
              icon: Icons.calendar_today,
              text: 'Schedule',
            ),
            OptionButton(
              ontap: () {},
              icon: Icons.arrow_upward,
              text: 'Share Screen',
            ),
          ],
        ),
         Expanded(
          child: Center(
            child: Lottie.asset('assets/animation/Animation - 1709056742694 (1).json'),
            //Text(
              // 'Join/Create a meeting just by click!',
              // style: TextStyle(
              //   fontSize: 20,
              //   color: Colors.white,
              //   fontWeight: FontWeight.bold,
              // ),
            
          ),
        ),
      ],
    );
  }
}
