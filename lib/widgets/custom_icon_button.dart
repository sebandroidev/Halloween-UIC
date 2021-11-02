import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.icon,
    this.hasBadge = false,
    required this.callback,
  }) : super(key: key);

  final String icon;
  final bool hasBadge;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.w),
      onTap: callback,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w),
          color: const Color(0xFF3b3363),
        ),
        child: hasBadge
            ? Stack(
                children: [
                  SvgPicture.asset(icon, color: Colors.white),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 12.w,
                      width: 12.w,
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                      child: Center(
                          child: Text(
                        '2',
                        style: TextStyle(
                          fontSize: 8.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                    ),
                  )
                ],
              )
            : SvgPicture.asset(icon, color: Colors.white),
      ),
    );
  }
}
