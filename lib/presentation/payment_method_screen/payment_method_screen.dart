import 'package:car_rental_task/core/component/custom_app_bar.dart';
import 'package:car_rental_task/core/component/round_button.dart';
import 'package:car_rental_task/core/theme/appcolors/app_colors.dart';
import 'package:car_rental_task/presentation/payment_method_screen/widgets/containers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:car_rental_task/core/constants/app_string.dart';
import 'package:car_rental_task/core/constants/image_strings.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../models/car_model_data.dart';

class PaymentMethodScreen extends StatefulWidget {
  final Car carProduct;
  const PaymentMethodScreen({super.key, required this.carProduct});

  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  late Razorpay _razorpay;
  bool isProcessing = false;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Successful! Transaction ID: ${response.paymentId}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Failed! Error: ${response.message}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "External Wallet Selected: ${response.walletName}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM);
  }

  void startPayment() {
    var options = {
      'key': "rzp_test_1DP5mmOlF5G5ag",
      'amount': ((widget.carProduct.carPrice ?? 0.0) * 100).toInt(),
      'currency': 'USD',
      'name': 'Car Rental',
      'description': 'Car Rental Payment',
      'image' : "assets/image/me.jpg",
      'prefill': {
        'contact': '${9925731154}',
        'email': "jigneshvaghelabusiness@gmail.com"
      },
      'theme': {
        'color': '#bdde48'
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: CustomAppBar(title: AppStrings.paymentHeader),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppStrings.savedCard,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Row(
                        children: [
                          Text("🖊️",style:  GoogleFonts.poppins(color: AppColors.general),),
                          Text(AppStrings.change,style: GoogleFonts.poppins(color: AppColors.general),)],),],),

                      Containers(num: AppStrings.savedNumber, name: AppStrings.mainName, image: ImageStrings.masterCard),
                      Containers(num: AppStrings.savedNumberVisa, name: AppStrings.mainName, image: ImageStrings.visa),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: RoundButton(
                  onPressed: isProcessing ? () {} : startPayment,
                  title: isProcessing ? "Processing..." : AppStrings.payNow),
            ),
          ),
        ],
      ),
    );
  }
}
