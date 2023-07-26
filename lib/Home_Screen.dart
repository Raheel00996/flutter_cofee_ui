import 'package:coffee/add_cart.dart';
import 'package:coffee/constanr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sizer/sizer.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  var currentIndex = 0;
  var current = 0;

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_outline_rounded,
    Icons.shopping_bag_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: ((context, orientation, deviceType) {
      double screenWidth = MediaQuery.of(context).size.width;
      return Scaffold(
        backgroundColor: white,
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(20),
          height: screenWidth * .165,
          decoration: BoxDecoration(
            color: bglite,
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(.15),
            //     blurRadius: 30,
            //     offset: Offset(0, 10),
            //   ),
            // ],
            borderRadius: BorderRadius.circular(50),
          ),
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * .099),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Stack(
                children: [
                  SizedBox(
                    width: screenWidth * .25,
                    child: Center(
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.linear,
                        height: index == currentIndex ? screenWidth * .12 : 0,
                        width: index == currentIndex ? 13.w : 0,
                        decoration: BoxDecoration(
                          color: index == currentIndex ? white : bglite,
                          borderRadius: BorderRadius.circular(70),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 25.w,
                    alignment: Alignment.center,
                    child: Center(
                      child: Icon(
                        listOfIcons[index],
                        size: screenWidth * .076,
                        color: index == currentIndex ? bglite : white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          //leadingWidth: 4.w,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  50.0), // Adjust the value to your desired roundness
              child: Image.asset(
                'assets/images/avatar.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          title: Row(
            children: [
              SizedBox(
                width: 9.w,
              ),
              Icon(
                Icons.location_pin,
                color: bglite,
                size: 7.w,
              ),
              Text(
                'New York, NYC',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                width: 20.w,
              ),
              Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
                size: 7.w,
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 25.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          opacity: 0.2,
                          image: AssetImage(
                            'assets/images/beansBackground1.png',
                          ))),
                  child: Container(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        height: 9.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(42)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 21),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Search',
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: CircleAvatar(
                                    backgroundColor: bglite,
                                    child: Icon(
                                      Icons.search,
                                      color: white,
                                      size: 26,
                                    ),
                                  ),
                                ),
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp),
                                fillColor: Colors.grey[200],
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(27))),
                          ),
                        ),
                      ),
                    ],
                  ))),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                height: 6.h,
                child: ListView.builder(
                    itemCount: data.length,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    controller: ScrollController(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) => InkWell(
                          onTap: () {
                            setState(() {
                              current = index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              child: Center(
                                  child: Text(
                                data[index]['title'],
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: current == index
                                        ? white
                                        : Colors.black),
                              )),
                              width: 27.w,
                              decoration: BoxDecoration(
                                  color: current == index
                                      ? bglite
                                      : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(29)),
                            ),
                          ),
                        ))),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 15,
                ),
                child: CarouselSlider(
                    items: img
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(
                                  top: 38, left: 18, bottom: 18),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: bgdark,
                                    boxShadow: [
                                      BoxShadow(
                                        color: bglite,
                                        offset: Offset(0, 7),
                                        blurRadius: 17,
                                      ),
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0, 3),
                                        blurRadius: 10,
                                      )
                                    ],
                                    // image: DecorationImage(
                                    //   image: AssetImage(
                                    //     e['image']!,
                                    //   ),
                                    // ),

                                    borderRadius: BorderRadius.circular(33)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceAround,
                                    children: [
                                      Transform.translate(
                                        offset: Offset(10.w, -34),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(65),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      255, 41, 40, 40),
                                                  offset: Offset(0, 6),
                                                  blurRadius: 10,
                                                  // spreadRadius: 1,
                                                )
                                              ]),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: ((context) {
                                                return add_to_cart(
                                                    image: e['image']);
                                              })));
                                            },
                                            child: Hero(
                                              tag: 'im',
                                              child: Image.asset(
                                                e['image'],
                                                width: 26.w,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Black Coffee',
                                        style: TextStyle(
                                            color: white,
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Container(
                                        height: 3.h,
                                        width: 13.w,
                                        decoration: BoxDecoration(
                                          color: bglite,
                                          borderRadius:
                                              BorderRadius.circular(65),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: white,
                                              size: 14,
                                            ),
                                            Text('4.8')
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: 'Volume ',
                                            style: TextStyle(
                                                color: bglite,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.normal)),
                                        TextSpan(
                                            text: '116ml',
                                            style: TextStyle(
                                                color: white,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold))
                                      ])),
                                      // SizedBox(
                                      //   height: 2.h,
                                      // ),
                                      Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text('\$${25.50}',
                                              style: TextStyle(
                                                  color: white,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold)),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(65),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Color.fromARGB(
                                                        255, 68, 67, 67),
                                                    offset: Offset(1, 2),
                                                    blurRadius: 10,
                                                  )
                                                ]),
                                            child: CircleAvatar(
                                              radius: 25,
                                              backgroundColor: white,
                                              child: Icon(
                                                Icons.add,
                                                size: 7.w,
                                                color: Colors.black,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                    options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        viewportFraction: 0.6,
                        enlargeCenterPage: true,
                        aspectRatio: 1.1)),
              ),
              
            ],
          ),
        ),
      );
    }));
  }
}
