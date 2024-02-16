
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viettel_money/data/model/service.dart';
import 'package:viettel_money/utils/colors.dart';

class ItemService extends StatelessWidget {
  ItemService({super.key, required this.service});

  Service service;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(5),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: service.color ?? Colors.white,
                borderRadius: const BorderRadius.all(Radius.elliptical(15, 20),)
            ),
            child: Image.asset(service.src, fit: BoxFit.cover, color: service.color != null ? Colors.white : primaryColor,),
          ),
          const SizedBox(height: 5,),
          SizedBox(
              width: 100,
              child: Text(service.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500), textAlign: TextAlign.center, maxLines: 2,))
        ],
      ),
    );
  }
}
