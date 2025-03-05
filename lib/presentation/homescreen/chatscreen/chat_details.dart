import 'package:car_rental_task/core/constants/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:car_rental_task/core/theme/appcolors/app_colors.dart';
import 'package:car_rental_task/data/chat_data_model/chat_model_data.dart';

class ChatDetailScreen extends StatefulWidget {
  final ChatModelData chatData;
  const ChatDetailScreen({super.key, required this.chatData});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  TextEditingController messageController = TextEditingController();

  void sendMessage() {
    String message = messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        widget.chatData.messages.add(message);
        messageController.clear();

        ChatModelData otherUser = ChatModelData.getChat(
          widget.chatData.name == AppStrings.chatOne ? AppStrings.chatTwo : AppStrings.chatOne,
        );

        otherUser.messages.add("Received: $message");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20.sp),
          onPressed: Get.back
        ),
        title: Row(
          children: [
            CircleAvatar(radius: 20.r, backgroundImage: AssetImage(widget.chatData.image)),
            SizedBox(width: 10.w),
            Text(widget.chatData.name, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16.sp)),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.chatData.messages.length,
                itemBuilder: (context, index) {
                  bool isSentByUser = !widget.chatData.messages[index].startsWith("Received:");

                  return Align(
                    alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        color: isSentByUser ? AppColors.general : AppColors.generalGrey,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        widget.chatData.messages[index].replaceAll("Received: ", ""),
                        style: GoogleFonts.poppins(color: Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(color: AppColors.generalGrey),
                    ),
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: AppStrings.typing,
                        hintStyle: GoogleFonts.poppins(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: AppColors.general, size: 25.sp),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
