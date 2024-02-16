
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viettel_money/data/model/service.dart';

class ItemGift extends StatelessWidget {
  ItemGift({super.key, required this.data});

  Service data;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
        width: MediaQuery.of(context).size.width * 0.85,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Row(
          children: [
            SizedBox(
                height: 130,
                width: 130,
                child: Image.asset(data.src, fit: BoxFit.cover,)
            ),
            Expanded(child:
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.satellite_alt, color: Colors.red, size: 20,),
                      Text("Hightlands Coffee"),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Text(
                      data.name,
                      style: const TextStyle(
                        fontSize: 15,
                       fontWeight: FontWeight.w500
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis
                  ),
                  const SizedBox(height: 5,),
                  const Row(
                    children: [
                      Text("1", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                      Icon(Icons.ac_unit_sharp, color: Colors.amber, size: 15,),
                    ],
                  ),
                ],
              ),
            ))
          ],
        )
    );
  }
}
