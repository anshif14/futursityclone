import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:futursityclone/common/imageConstants.dart';
import 'package:futursityclone/core/Providers/providers.dart';
import 'package:futursityclone/features/home/controller/homeController.dart';
import 'package:futursityclone/features/topCourses/topCourses.dart';
import 'package:futursityclone/main.dart';
import 'package:futursityclone/models/categoryModel.dart';
import 'package:futursityclone/models/topCourseModel.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  List<Color> bgColors=[
   Color(0xff5c50f8),
   Color(0xfff85454),
    Color(0xff2AD0A8),




  ];

  ///initializing empty List for Data
  List<CateogryModel> categoryData = [];
  List<TopCourseModel> topCourseData = [];

  getData() async {
    categoryData.clear();
    topCourseData.clear();

    ///getting complete data

    List categoryDatalist =
        await ref.watch(HomeRepositoryController).getCategory();

    ///assigning data from API to empty Lists

    for (var docs in categoryDatalist) {
      categoryData.add(CateogryModel.fromJson(docs));
    }

    List courseDatalist =
        await ref.watch(HomeRepositoryController).getTopCourse();
    for (var docs in courseDatalist) {
      topCourseData.add(TopCourseModel.fromJson(docs));
    }
    setState(() {});
  }



  @override
  void didChangeDependencies() {
    getData();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape:CircleBorder(),
        child: Icon(
          Icons.filter_list_outlined,
          color: Colors.white,
        ),
        onPressed: () {

        },
        backgroundColor: Color(0xff243444),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.grey,
        leading: Text(''),
        title: GestureDetector(
            onTap: () {
              getData();
            },
            child: Image.asset(
              ImageConstants.logo,
              height: width * 0.1,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Course',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => TopCousesScreen(
                          data:topCourseData,
                        ),));
                      },
                      child: Text(
                        'All Courses>>',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w500),
                      ))
                ],
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      topCourseData.length,
                      (index) =>
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
                                        offset: Offset(2, 2))
                                  ]),
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
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
                                                    style: TextStyle(
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
                          )),
                ),
              ),

              SizedBox(
                height: height * 0.05,
              ),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Categories",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: height*0.05,),

              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: categoryData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.9,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12)
                                  ),
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          categoryData[index].thumbnail),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Container(
                                width: width,
                                  decoration: BoxDecoration(
                                    color: bgColors[index%bgColors.length],
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12)
                                    ),),

                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Text(categoryData[index].name.toString(),style: TextStyle(
                                    color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700
                                    
                                        ),),
                                    
                                         Row(
                                           children: [
                                             Text(
                                           "${
                                               categoryData[index].numberOfCourses.toString()
                                           } Courses"

                                           ,style: TextStyle(
                                                                                 color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500
                                                                                 
                                                                                     ),),
                                           ],
                                         ),
                                    
                                      ],
                                    ),
                                  ),
                                ),
                          ))
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
