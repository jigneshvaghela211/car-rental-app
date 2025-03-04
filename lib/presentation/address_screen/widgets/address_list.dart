import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/address_model_data/address_screen_model_data.dart';
import 'locations_design.dart';

class AddressList extends StatefulWidget {
  final  List<AddressScreenModelData> filteredLocations;

  const AddressList({super.key,required this.filteredLocations});

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return   Expanded(
      child: widget.filteredLocations.isNotEmpty
          ? ListView.builder(
        itemCount: widget.filteredLocations.length,
        itemBuilder: (context, index) {
          return LocationsDesign(
            image: widget.filteredLocations[index].image,
            title: widget.filteredLocations[index].title,
            subTitle: widget.filteredLocations[index].subTitle,
            isSelected: selectedIndex == index,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        },
      )
          : Center(
        child: Text(
          "No location found",
          style: GoogleFonts.poppins(
            fontSize: 16.sp,//AppSize.medium
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
