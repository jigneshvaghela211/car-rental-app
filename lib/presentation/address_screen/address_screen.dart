import 'package:car_rental_task/core/component/custom_app_bar.dart';
import 'package:car_rental_task/core/component/custom_text_field.dart';
import 'package:car_rental_task/presentation/address_screen/widgets/address_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_string.dart';
import '../../core/theme/appcolors/app_colors.dart';
import '../../core/component/round_button.dart';
import '../../data/address_model_data/address_screen_model_data.dart';
import '../../models/car_model_data.dart';
import '../payment_method_screen/payment_method_screen.dart';

class AddressScreen extends StatefulWidget {
  final Car carProduct;
  final AddressScreenModelData address;
  const AddressScreen(
      {super.key, required this.address, required this.carProduct});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController searchController = TextEditingController();
  List<AddressScreenModelData> filteredLocations =
      AddressScreenModelData.locationList;

  void filterLocations(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredLocations = AddressScreenModelData.locationList;
      } else {
        filteredLocations = AddressScreenModelData.locationList
            .where((location) =>
                location.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: AppStrings.address),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
        child: Column(
          children: [
            CustomTextField(controller: searchController, onChanged: filterLocations, text: AppStrings.search),
            SizedBox(height: 15.h),
            AddressList(
              filteredLocations: filteredLocations,
            ),
            RoundButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PaymentMethodScreen(
                            carProduct: widget.carProduct)));
              },
              title: AppStrings.confirmAddress,
            ),
          ],
        ),
      ),
    );
  }
}
