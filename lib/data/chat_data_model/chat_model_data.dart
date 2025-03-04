import 'package:car_rental_task/core/constants/app_string.dart';
import 'package:car_rental_task/core/constants/image_strings.dart';

class ChatModelData {
  final String name;
  final String image;
  List<String> messages;

  ChatModelData({required this.name, required this.image, required this.messages});

  static List<ChatModelData> chatDataList = [
    ChatModelData(name: AppStrings.chatOne, image: ImageStrings.nileshImage, messages: []),
    ChatModelData(name: AppStrings.chatTwo, image: ImageStrings.hirenImage, messages: []),
  ];

  static ChatModelData getChat(String name) {
    return chatDataList.firstWhere((chat) => chat.name == name);
  }
}
