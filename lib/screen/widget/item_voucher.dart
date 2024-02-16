import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viettel_money/utils/colors.dart';
import 'package:viettel_money/utils/resource.dart';

class ItemVoucher extends StatelessWidget {
  ItemVoucher({super.key, required this.data});

  String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.all(Radius.circular(15))
      ),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Center(
              child: Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadiusDirectional.all(Radius.circular(100))
                ),
                child: Image.asset(img_iphone, color: Colors.white,),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(),
                Text("Viettel Money"),
                Text(data, maxLines: 2, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(child: Text("HSD còn 1 ngày", style: TextStyle(color: Colors.orange),)),
                    const Row(
                      children: [
                        Text("Sử dụng", style: TextStyle(color: primaryColor),),
                        Icon(Icons.keyboard_arrow_right, color: primaryColor),
                        SizedBox(width: 10,)
                      ],
                    ),
                  ],
                ),
                SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
