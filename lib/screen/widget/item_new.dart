
import 'package:flutter/cupertino.dart';
import 'package:viettel_money/data/model/service.dart';

class ItemNew extends StatelessWidget {
  ItemNew({super.key, required this.data});

  Service data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadiusDirectional.all(Radius.circular(5)),
                child: Image.asset(data.src, fit: BoxFit.cover,),
              ),
            ),
            const SizedBox(height: 10,),
            Text(
              data.name,
              maxLines: 2,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
