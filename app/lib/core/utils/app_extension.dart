import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

extension AnimateDoExt on Widget {
  Widget fadeIn({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      FadeIn(duration: duration, delay: delay, child: this);
  // Widget bounce({
  //   Duration duration = const Duration(milliseconds: 600),
  //   Duration delay = Duration.zero,
  // }) => BounceIn(duration: duration, delay: delay, child: this);
  Widget zoomIn({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      ZoomIn(duration: duration, delay: delay, child: this);
  Widget slideInUp({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      SlideInUp(duration: duration, delay: delay, child: this);
  Widget slideInDown({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      SlideInDown(duration: duration, delay: delay, child: this);
  Widget slideInLeft({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      SlideInLeft(duration: duration, delay: delay, child: this);
  Widget slideInRight({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      SlideInRight(duration: duration, delay: delay, child: this);
}
