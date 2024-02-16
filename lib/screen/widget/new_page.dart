import 'package:flutter/material.dart';
import 'package:viettel_money/data/model/service.dart';

import 'item_new.dart';

class NewPage extends StatelessWidget {
  NewPage({super.key, required this.data});

  List<Service> data = [];

  @override
  Widget build(BuildContext context) {
    return
      LayoutBuilder(builder: (context, boxConstraints){
      return GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: data.map((element) {
            return ItemNew(data: element,);
          }).toList()
      );
    });
  }
}
