import 'package:car_rental_task/core/component/custom_app_bar.dart';
import 'package:car_rental_task/core/component/custom_text.dart';
import 'package:car_rental_task/core/component/custom_text_field.dart';
import 'package:car_rental_task/core/constants/app_size.dart';
import 'package:car_rental_task/core/constants/app_string.dart';
import 'package:car_rental_task/core/theme/appcolors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/location_data_model.dart';
import 'widget/location_item.dart';
import 'widget/search_item_container.dart';

class SearchScreen extends StatefulWidget {
  final LocationDataModel forSearch;

  const SearchScreen({super.key, required this.forSearch});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<LocationSearch> _locations = LocationSearch.getLocations();
  bool _isEmptySearch = false;

  void _filterLocations(String query) {
    final filtered = LocationSearch.getLocations()
        .where((location) =>
            location.location.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      _locations = filtered;
      _isEmptySearch = filtered.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: AppStrings.searchLocation),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                  controller: _searchController,
                  onChanged: _filterLocations,
                  text: AppStrings.search),
              SizedBox(height: 20),
              SearchItemContainer(
                icon: Icons.coffee_outlined,
                backgroundColor: AppColors.general,
                title: widget.forSearch.coffee,
                count: "${widget.forSearch.coffeeCount.toInt()} places",
              ),
              SizedBox(height: 10),
              SearchItemContainer(
                icon: Icons.movie_creation_outlined,
                backgroundColor: Colors.pink.shade300,
                title: widget.forSearch.cinema,
                count: "${widget.forSearch.cinemaCount.toInt()} places",
              ),
              SizedBox(height: 20),
              CustomText(
                  text: widget.forSearch.favorite,
                  fontSize: AppSize.extraLargeFont,
                  fontWeight: FontWeight.bold),
              SizedBox(height: 10),
              _isEmptySearch
                  ? Center(
                      child: CustomText(
                          text: AppStrings.notFind,
                          fontSize: AppSize.mediumFont,
                          fontWeight: FontWeight.bold))
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _locations.length,
                      itemBuilder: (context, index) {
                        final location = _locations[index];
                        return LocationItem(
                          icon: Icons.location_on_outlined,
                          title: location.location,
                          subtitle: location.locationDetails,
                          distance: "${location.locationDistance} KM",
                          onTap: () {
                            Get.to; location.location;
                          },
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
