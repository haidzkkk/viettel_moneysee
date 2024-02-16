import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:viettel_money/data/model/service.dart';
import 'package:viettel_money/screen/widget/item_gift.dart';
import 'package:viettel_money/screen/widget/item_present.dart';
import 'package:viettel_money/screen/widget/item_service.dart';
import 'package:viettel_money/screen/widget/new_page.dart';

import '../../utils/colors.dart';
import '../../utils/data_source.dart';
import '../../utils/resource.dart';
import 'item_voucher.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {

  final PageController newPageController = PageController();
  bool isSelectGif = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        SizedBox(
          height: 120,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: listService.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return ItemService(service: listService[index]);
              },
          ),
        ),
        const SizedBox(height: 20,),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Viettel Money gợi ý", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Row(
                children: [
                  Text("Tất cả dịch vụ"),
                  Icon(Icons.keyboard_arrow_right)
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 10,),
        SizedBox(
          height: 120,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: listService2.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return ItemService(service: listService2[index]);
              },
          ),
        ),
        const SizedBox(height: 10,),
        SizedBox(
          height: 150,
          width: double.infinity,
          child: CarouselSlider.builder(
              itemCount: bannerData.length,
              itemBuilder: (context, index, realIndex){
                return Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Image.asset(bannerData[index], fit: BoxFit.cover,)
                );
              },
              options: CarouselOptions(
                initialPage: 0,
                height: double.infinity,
                viewportFraction: 0.9,
                autoPlay: true,
                enableInfiniteScroll: false,
                autoPlayInterval: const Duration(seconds: 10),
                padEnds : false
              )
          ),
        ),
        const SizedBox(height: 20,),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Ưu đãi mỗi ngày", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              Row(
                children: [
                  Text("Xem thêm (999+)"),
                  Icon(Icons.keyboard_arrow_right)
                ],
              )
            ],
          ),
        ),
        Row(
          children: [
            const SizedBox(width: 10,),
            GestureDetector(
              onTap: (){
                setState(() {
                  isSelectGif = true;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isSelectGif ? Colors.black87 : Colors.transparent,
                  borderRadius: const BorderRadiusDirectional.all(Radius.circular(10))
                ),
                child: Text("Deal HOT", style: TextStyle(color: isSelectGif ? Colors.white : null),),
              ),
            ),
            const SizedBox(width: 10,),
            GestureDetector(
              onTap: (){
                setState(() {
                  isSelectGif = false;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: isSelectGif ? Colors.transparent : Colors.black87,
                    borderRadius: const BorderRadiusDirectional.all(Radius.circular(10))
                ),
                child: Text("Ưu đãi của tôi 🎁", style: TextStyle(color: isSelectGif ? null : Colors.white),),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20,),
        isSelectGif ?
          SizedBox(
            height: 280,
            width: double.infinity,
            child: CarouselSlider.builder(
                itemCount: (listGift.length / 2).ceil(),
                itemBuilder: (context, index, realIndex){
                  return Column(
                    children: [
                      ItemGift(data: listGift[index * 2]),
                      const SizedBox(height: 10,),
                      if(index * 2 + 1 < listGift.length)
                        ItemGift(data: listGift[index * 2 + 1]),
                    ],
                  );
                },
                options: CarouselOptions(
                    initialPage: 0,
                    height: double.infinity,
                    viewportFraction: 0.9,
                    enableInfiniteScroll: false,
                    padEnds : false
                )
            ),
          )
        : Container(
          height: 110,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listVouchers.length,
              itemBuilder: (context, index) {
                return ItemVoucher(data: listVouchers[index]);
              }
            ),
        ),
        const SizedBox(height: 20,),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Xứ sở quà tặng", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Column(
            children: [
              Image.asset(img_banner_present, height: 150, width: double.infinity, fit: BoxFit.cover,),
              Container(
                height: 130,
                padding: const EdgeInsets.symmetric(vertical: 10),
                color: Colors.white,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ItemPresent(data: listPresent[index],),
                    separatorBuilder: (context, index) => const SizedBox(width: 10,),
                    itemCount: listPresent.length
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20,),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Bản tin 24/7", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)),
        ),
        Container(
          height: 440,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(5),
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                    controller: newPageController,
                    itemCount: (listNew.length / 4).ceil(),
                    itemBuilder: (context, index) {
                      int start = index * 4;
                      int end = start + 4 < listNew.length ? start + 4 : listNew.length;
                      return NewPage(data: listNew.getRange(start, end).toList());
                    }
                ),
              ),
              const SizedBox(height: 5,),
              SmoothPageIndicator(
                  controller: newPageController,
                  count: (listNew.length / 4).ceil(),
                  effect:  const ScaleEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      activeDotColor:  backgroundColor,
                      scale: 1.1,
                  ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20,),
        Container(
          height: 300,
          margin: const EdgeInsets.only(bottom: 100),
          decoration: BoxDecoration(
            color: Colors.red.shade100,
            boxShadow: [
              BoxShadow(color: Colors.red.shade100, offset: Offset(0, 50), blurRadius: 30)
            ]
          ),
        ),
      ],
    );
  }
}
