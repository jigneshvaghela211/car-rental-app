import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(backgroundColor: Colors.white,
        leading:  IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
        title: Text(title,style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),centerTitle: true,

    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}
