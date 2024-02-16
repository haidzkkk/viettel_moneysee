
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/resource.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        color: primaryColor,
      ),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(img_exchance, color: Colors.white, width: 30,),
              const SizedBox(height: 5,),
              const Text("Chuyển tiền", style: TextStyle(color: Colors.white, fontSize: 12),)
            ],
          ),
          const SizedBox(width: 20,),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(img_qr, color: Colors.white, width: 30,),
              const SizedBox(height: 5,),
              const Text("Quét mã", style: TextStyle(color: Colors.white, fontSize: 12),)
            ],
          ),
          const SizedBox(width: 20,),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(img_add_money, color: Colors.white, width: 30,),
              const SizedBox(height: 5,),
              const Text("Nạp tiền", style: TextStyle(color: Colors.white, fontSize: 12),)
            ],
          ),
        ],
      ),
    );
  }
}
