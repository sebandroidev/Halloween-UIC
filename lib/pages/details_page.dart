import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:halloween_apple_dev/models/item.dart';
import 'package:halloween_apple_dev/widgets/custom_icon_button.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, required this.item}) : super(key: key);
  final Item item;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2b2446),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              _buildAppBar(context),
              SizedBox(height: 30.h),
              Text(
                widget.item.title,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Hantton',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                widget.item.category,
                style: TextStyle(color: Colors.grey.shade400, fontSize: 16.sp),
              ),
              SizedBox(height: 30.h),
              SizedBox(
                child: Stack(
                  children: [
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.all(20.w),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(1000.w),
                          ),
                          child: Hero(
                            child: Image.asset(widget.item.image,
                                fit: BoxFit.contain),
                            tag: widget.item,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: 60.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 90.w,
                              decoration: BoxDecoration(
                                color: const Color(0xFF221d3d),
                                borderRadius: BorderRadius.circular(50.w),
                              ),
                              height: 60.w,
                              child: Center(
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Hantton',
                                    fontSize: 20.w,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8.w,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(),
                          Container(
                            height: 45.w,
                            width: 45.w,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1d1a2f),
                              borderRadius: BorderRadius.circular(100.w),
                              border: Border.all(color: Colors.black),
                            ),
                            child:
                                const Icon(Icons.remove, color: Colors.white),
                          ),
                          Container(
                            height: 45.w,
                            width: 45.w,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1d1a2f),
                              borderRadius: BorderRadius.circular(100.w),
                              border: Border.all(color: Colors.black),
                            ),
                            child: const Icon(Icons.add, color: Colors.white),
                          ),
                          Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Text('Price', style: TextStyle(color: Colors.grey.shade200)),
              SizedBox(height: 20.h),
              Text(
                '\$' + widget.item.price,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.sp,
                  fontFamily: 'Hantton',
                ),
              ),
              Spacer(),
              Divider(
                  color: Colors.grey.shade600, thickness: 0.3, height: 10.h),
              Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Buy Now'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
            icon: 'assets/icons/back_icon.svg',
            callback: () {
              Navigator.of(context).pop();
            }),
        const Spacer(),
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            border:
                Border.all(color: Theme.of(context).primaryColor, width: 1.3),
            borderRadius: BorderRadius.circular(100.w),
          ),
          child: SvgPicture.asset(
            'assets/icons/favorite_icon.svg',
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
