import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom/resources/auth_method.dart';
import 'package:zoom/resources/jitsi_meet.dart';
import 'package:zoom/utils/color.dart';
import 'package:zoom/widgets/meeting_option.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final AuthMethod _authMethods = AuthMethod();
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  final JitsiMeetMethod _jitsiMeetMethods = JitsiMeetMethod();
  bool isAudioMuted = true;
  bool isVideoMuted = true;

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(
      text: _authMethods.user.displayName,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
  }

  _joinMeeting() {
    _jitsiMeetMethods.createMeeting(
      roomName: meetingIdController.text,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      username: nameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          'Join Meeting',
          style: GoogleFonts.adventPro(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16,left: 8,right: 8,bottom: 0),
              child: SizedBox(
                height: 60,
                child: TextField(
                  controller: meetingIdController,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: secondaryBackgroundColor,
                    filled: true,
                     border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: secondaryBackgroundColor,width: 0)
                    ),
                    hintText: 'Room ID',
                    contentPadding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                height: 60,
                child: TextField(
                  controller: nameController,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: secondaryBackgroundColor,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Name',
                    contentPadding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            InkWell(
              onTap: _joinMeeting,
              child: Padding(
                padding:const  EdgeInsets.all(8),
                child: Card(
                  child: Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Text(
                      'Join',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.adventPro(
                        fontSize: 25,
                        color:Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: MeetingOption(
                  text: 'Mute Audio',
                  isMute: isAudioMuted,
                  onChange: onAudioMuted,
                ),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Card(
                child: MeetingOption(
                  text: 'Turn Off My Video',
                  isMute: isVideoMuted,
                  onChange: onVideoMuted,
                ),
              ),
            ),
            Lottie.asset('assets/animation/Animation - 1709061407712.json')
          ],
        ),
      ),
    );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}