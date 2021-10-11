import 'package:flutter/cupertino.dart';

class Gap extends StatelessWidget {

  final double? v;
  final double? h;

  const Gap({Key? key, this.v, this.h}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: h,
      height: v,
    );
  }
}

class VGap extends StatelessWidget {

  final double v;

  const VGap(this.v, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Gap(
      v: v,
    );
  }
}


class HGap extends StatelessWidget {

  final double h;

  const HGap(this.h, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Gap(
      v: h,
    );
  }
}