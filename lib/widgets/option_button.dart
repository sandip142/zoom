import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom/utils/color.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    super.key,
    required this.ontap,
    required this.icon,
    required this.text,
  });
  final VoidCallback ontap;
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Card(
            elevation: 2,
            shadowColor: Colors.black,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: buttonColor,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.06),
                      offset: const Offset(0, 4))
                ],
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: GoogleFonts.adventPro(
             color:const Color.fromARGB(255, 9, 8, 8),
             fontWeight:FontWeight.bold,
            )
          ),
        ],
      ),
    );
  }
}
