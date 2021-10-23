import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackgt2021/constants.dart';
import 'package:ionicons/ionicons.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;
  final void Function()? onTap;

  const ProfileListItem({
    Key? key,
    required this.icon,
    required this.text,
    this.onTap,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit.w * 5.5,
      margin: EdgeInsets.symmetric(
        horizontal: kSpacingUnit.w * 4,
      ).copyWith(
        bottom: kSpacingUnit.w * 2,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: kSpacingUnit.w * 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
        color: kPrimaryColorFood.withOpacity(0.75),
      ),
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        child: Row(
          children: <Widget>[
            Icon(
              icon,
            ),
            SizedBox(width: kSpacingUnit.w * 1.5),
            Text(
              text,
              style: kButtonTextStyle,
            ),
            const Spacer(),
            if (hasNavigation)
              const Icon(
                Ionicons.chevron_forward_outline,
              ),
          ],
        ),
      ),
    );
  }
}
