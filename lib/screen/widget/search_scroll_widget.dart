
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viettel_money/screen/widget/item_service.dart';

import '../../utils/data_source.dart';
import '../../utils/resource.dart';


class SearchScrollWidget extends StatefulWidget {
  const SearchScrollWidget({super.key});

  @override
  State<SearchScrollWidget> createState() => _SearchScrollWidgetState();
}

class _SearchScrollWidgetState extends State<SearchScrollWidget> {
  late TextEditingController searchController;
  bool isSearch = false;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    searchController.addListener(() {
      isSearch = searchController.text.isNotEmpty;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Material(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 10),
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: TextFormField(
                        controller: searchController,
                        autofocus: true,
                        decoration: InputDecoration(
                          icon: Image.asset(img_search, width: 30,),
                          hintText: "Nhập tên dịch vụ. Ví dụ: Chuyển tiền",
                          border: InputBorder.none,
                          suffixIcon: searchController.text.isEmpty
                              ? null
                              : GestureDetector(
                                onTap: (){
                                  searchController.text = '';
                                  setState(() {});
                                },
                                    child: const Icon(Icons.cancel)
                                ),
                        ),

                      ),
                    )
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const SizedBox(
                      width: 50,
                      child: Center(
                        child:
                        Text("Hủy",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20,),
              
              Expanded(
                child: ListView(
                  children: [
                    if (!isSearch) GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Tìm kiếm gần đây", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            const SizedBox(height: 10,),
                            Wrap(
                              spacing: 10,
                              children: listHistorySearch.map((e) =>
                                  GestureDetector(
                                      onTap: (){
                                        searchController.text = e;
                                      },
                                      child: Chip(label: Text(e), onDeleted: (){},)),).toList(),
                            ),
                          ],
                        ),
                      ),
                    ) else Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Dịch vụ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          const SizedBox(height: 10,),
                          GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                              ),
                              itemCount: listServiceSearch.length,
                              itemBuilder: (context, index){
                                return ItemService(service: listServiceSearch[index]);
                              }
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
