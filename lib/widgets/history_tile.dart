import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Historytile extends StatelessWidget {
  const Historytile({
    super.key,
    required this.id,
    required this.dtime,
    required this.deleteTodo,
  });
  final Function(BuildContext)? deleteTodo;
  final String id;
  final String dtime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Slidable(
        endActionPane: ActionPane(
         motion: const StretchMotion(),
          children: [
           SlidableAction(
           onPressed:deleteTodo,
           icon: Icons.delete,
           backgroundColor: Colors.red,
           borderRadius: BorderRadius.circular(12),
           ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 60),
          decoration: BoxDecoration(
            color:  const Color.fromARGB(255, 167, 123, 241),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Checkbox(
              //   value: taskCompleted,
              //   onChanged: onChanged,
              //   activeColor: Colors.black,
              // ),
              Text(
                id,
                style:const TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),        
              ),
              Text(
                dtime,
                style:const TextStyle(
                  fontSize: 20,
                   color: Colors.white
                ),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
