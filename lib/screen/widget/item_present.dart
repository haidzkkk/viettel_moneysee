
import 'package:flutter/cupertino.dart';
import 'package:viettel_money/data/model/service.dart';

class ItemPresent extends StatelessWidget {
  ItemPresent({super.key, required this.data});

  Service data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: 90,
      child: Column(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: ClipOval(child: Image.asset(data.src, fit: BoxFit.cover,)),
          ),
          const SizedBox(height: 5,),
          Text(
            data.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14
            ),
          ),
        ],
      ),
    );
  }
}
