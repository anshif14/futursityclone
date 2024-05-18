import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:futursityclone/models/topCourseModel.dart';

import '../../main.dart';

class TopCousesScreen extends StatefulWidget {
  final List<TopCourseModel> data ;
  const TopCousesScreen({super.key, required this.data});

  @override
  State<TopCousesScreen> createState() => _TopCousesScreenState();
}

class _TopCousesScreenState extends State<TopCousesScreen> {
  List<TopCourseModel> topCourseData = [];
  @override
  void initState() {

    topCourseData = widget.data;
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("All Courses"),


      ),
      body: GridView.builder(
        itemCount: topCourseData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.9,

          crossAxisCount: 2), itemBuilder:
      (context, index) {
        return

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height * 0.27,
              width: width * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        spreadRadius: 0.5,
                        blurRadius: 5,
                        offset: const Offset(2, 2))
                  ]),
              child: Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12)
                          ),
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                topCourseData[index]
                                    .thumbnail ??
                                    '',
                              ),
                              fit: BoxFit.cover),
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(topCourseData[index].title ??
                                  ''),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.end,
                                children: [
                                  Text(
                                    topCourseData[index]
                                        .price ??
                                        '',
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
          );
      },),

    );
  }
}
