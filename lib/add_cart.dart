import 'package:coffee/constanr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sizer/sizer.dart';
import 'constanr.dart';

class add_to_cart extends StatefulWidget {
  final dynamic image;
  const add_to_cart({super.key, this.image});

  @override
  State<add_to_cart> createState() => _add_to_cartState();
}

class _add_to_cartState extends State<add_to_cart> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: white, // Set the border color
                  width: 2.0, // Set the border width
                ),
              ),
              child: Icon(Icons.arrow_back_rounded, color: white)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 30,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: white, // Set the border color
                    width: 2.0, // Set the border width
                  ),
                ),
                child: Icon(
                  Icons.favorite,
                  color: white,
                )),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 45.h,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Stack(
                  children: [
                    Container(
                      height: 36.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.only(
                              bottomEnd: Radius.circular(45),
                              bottomStart: Radius.circular(45)),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/beansBackground2.png',
                              ))),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 25.w,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(130),
                            boxShadow: [
                              BoxShadow(
                                  color: bglite,
                                  offset: Offset(1, 4),
                                  blurRadius: 8)
                            ]),
                        child: Hero(
                          tag: 'im',
                          child: Image.asset(
                            widget.image,
                            width: 48.w,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 3.h,
                    width: 13.w,
                    decoration: BoxDecoration(
                      color: bglite,
                      borderRadius: BorderRadius.circular(65),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cappuccino',
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  color: Colors.black,
                                ),
                      ),
                      Text(
                        '\$${25.50}',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    'Coffee size',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  SizedBox(
                    height: 6.h,
                    child: ListView.builder(
                        itemCount: size.length,
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        controller: ScrollController(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) => InkWell(
                              onTap: () {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    size[index]['title'],
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: currentIndex == index
                                            ? white
                                            : Colors.black),
                                  )),
                                  width: 27.w,
                                  decoration: BoxDecoration(
                                      color: currentIndex == index
                                          ? bglite
                                          : Colors.grey[200],
                                      borderRadius: BorderRadius.circular(29)),
                                ),
                              ),
                            ))),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    'About',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nec quam sit amet mauris malesuada commodo. Maecenas ac dui sagittis, congue elit sed, pharetra enim.  '),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Volume ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 148, 146, 146),
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '110ml',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ])),
                      Container(
                        height: 5.h,
                        width: 25.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          border: Border.all(
                            color: Colors.black, // Set the border color
                            width: 2.0, // Set the border width
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.remove),
                            Text('5'),
                            Icon(Icons.add)
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey, // Set the border color
                            width: 2.0, // Set the border width
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: white,
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.grey,
                          ),
                          radius:
                              25.0, // Set the radius according to your needs
                        ),
                      ),
                      Container(
                        height: 6.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: bglite,
                          borderRadius: BorderRadius.circular(23),
                        ),
                        child: Center(
                          child: Text(
                            'By Now',
                            style: TextStyle(
                                color: white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
