import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoom/resources/firestore_method.dart';
import 'package:zoom/widgets/history_tile.dart';

class HistoryMeeting extends StatefulWidget {
  const HistoryMeeting({Key? key}) : super(key: key);

  @override
  State<HistoryMeeting> createState() => _HistoryMeetingState();
}

class _HistoryMeetingState extends State<HistoryMeeting> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().meetingsHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) => Historytile(
                      id: 'Room Name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}',
                      dtime:
            'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}',
                      deleteTodo: (context) {
                        setState(() {
                          (snapshot.data! as dynamic).docs[index].remove();
                        });
                      },
                    ),
        );
      },
    );
  }
}
