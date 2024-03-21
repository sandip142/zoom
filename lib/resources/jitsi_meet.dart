import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:zoom/resources/auth_method.dart';
import 'package:zoom/resources/firestore_method.dart';

class JitsiMeetMethod {

   final AuthMethod authMethod = AuthMethod();
   final FirestoreMethods _firestoreMethods =FirestoreMethods();
  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
    bool preJoined = true,
    bool isVideo = true,
    bool isGroup = true,
  }) async {
    try {
      Map<String, Object> featureFlag =  {};
      featureFlag['welcomepage.enabled'] = false;
      featureFlag['prejoinpage.enabled'] = preJoined;
      featureFlag['add-people.enabled'] = isGroup;
      
      String name;
        if (username.isEmpty) {
        name = authMethod.user.displayName!;
      } else {
        name = username;
      }

      var options = JitsiMeetConferenceOptions(
          room: roomName,
          serverURL: 'https://meet.codewithbisky.com',
          configOverrides: {
            "startWithAudioMuted": isAudioMuted,
            "startWithVideoMuted": isVideoMuted,
            "subject" : "sandip kankhare",
          },
        userInfo: JitsiMeetUserInfo(
            displayName:name,
            email: authMethod.user.email,
            avatar: authMethod.user.photoURL
        ),
        featureFlags: featureFlag,
      );
      var jitsiMeet = JitsiMeet();
      await jitsiMeet.join( options);
      _firestoreMethods.addToMeetingHistory(roomName);
    } catch (error) {
      print("error: $error");
    }
  }
}