import 'package:car_rental_task/core/component/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:car_rental_task/core/constants/app_string.dart';
import 'package:car_rental_task/core/theme/appcolors/app_colors.dart';
import 'package:car_rental_task/data/chat_data_model/chat_model_data.dart';
import 'chat_details.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.white,
        title: Text(
          AppStrings.message,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Column(
          children: [
            CustomTextField(controller: SearchController(), text: AppStrings.search),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10.h),
                itemCount: ChatModelData.chatDataList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => ChatDetailScreen(
                            chatData: ChatModelData.chatDataList[index],
                          ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: AppColors.general),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                ChatModelData.chatDataList[index].image,
                                height: 50.h,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              ChatModelData.chatDataList[index].name,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
