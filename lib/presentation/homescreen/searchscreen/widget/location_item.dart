import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';

class LocationItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String distance;
  final VoidCallback onTap;

  const LocationItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.distance,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.black54),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 20,
                      child: Marquee(
                        text: subtitle,
                        scrollAxis: Axis.horizontal,
                        blankSpace: 20.0,
                        velocity: 40.0,
                        pauseAfterRound: Duration(seconds: 1),
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Text(distance, style: GoogleFonts.poppins(fontSize: 12)),
              ],
            ),
            Divider(height: 30, thickness: 0.5),
          ],
        ),
      ),
    );
  }
}
