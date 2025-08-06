import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:shimmer/shimmer.dart';

extension NavigationExtension on BuildContext {
  /// Push a new page using a widget
  Future<T?> push<T>(Widget page) {
    return Navigator.push<T>(
      this,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Replace current page with new one using a widget
  Future<T?> pushReplacement<T, TO>(Widget page) {
    return Navigator.pushReplacement<T, TO>(
      this,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Push and remove all previous routes
  Future<T?> pushAndRemoveAll<T>(Widget page) {
    return Navigator.pushAndRemoveUntil<T>(
      this,
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }

  /// Pop the current route
  void pop<T extends Object?>([T? result]) {
    Navigator.pop(this, result);
  }

  /// Push a named route
  Future<T?> pushNamed<T extends Object?>(String routeName, {Object? arguments}) {
    return Navigator.pushNamed<T>(
      this,
      routeName,
      arguments: arguments,
    );
  }

  /// Replace current route with named route
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return Navigator.pushReplacementNamed<T, TO>(
      this,
      routeName,
      arguments: arguments,
      result: result,
    );
  }

  /// Push a named route and remove until a certain condition
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
  }) {
    return Navigator.pushNamedAndRemoveUntil<T>(
      this,
      newRouteName,
      predicate,
      arguments: arguments,
    );
  }

  /// Push a widget with slide animation
  Future<T?> pushWithSlide<T>(Widget page, {Duration duration = const Duration(milliseconds: 300)}) {
    return Navigator.push<T>(
      this,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionDuration: duration,
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }
}

extension AnimateDoExt on Widget {
  // Fades
  Widget fadeIn({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      FadeIn(duration: duration, delay: delay, child: this);

  Widget fadeInDown({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      FadeInDown(duration: duration, delay: delay, child: this);

  Widget fadeInUp({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      FadeInUp(duration: duration, delay: delay, child: this);

  Widget fadeInLeft({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      FadeInLeft(duration: duration, delay: delay, child: this);

  Widget fadeInRight({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      FadeInRight(duration: duration, delay: delay, child: this);

  // Bounces
  Widget bounceIn({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      BounceIn(duration: duration, delay: delay, child: this);

  Widget bounceInDown({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      BounceInDown(duration: duration, delay: delay, child: this);

  Widget bounceInUp({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      BounceInUp(duration: duration, delay: delay, child: this);

  Widget bounceInLeft({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      BounceInLeft(duration: duration, delay: delay, child: this);

  Widget bounceInRight({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      BounceInRight(duration: duration, delay: delay, child: this);

  // Slides
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

  // Zooms
  Widget zoomIn({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      ZoomIn(duration: duration, delay: delay, child: this);

  Widget zoomInDown({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      ZoomInDown(duration: duration, delay: delay, child: this);

  // Widget zoomInUp({
  //   Duration duration = const Duration(milliseconds: 600),
  //   Duration delay = Duration.zero,
  // }) =>
  //     ZoomInUp(duration: duration, delay: delay, child: this);

  // Widget zoomInLeft({
  //   Duration duration = const Duration(milliseconds: 600),
  //   Duration delay = Duration.zero,
  // }) =>
  //     ZoomInLeft(duration: duration, delay: delay, child: this);

  // Widget zoomInRight({
  //   Duration duration = const Duration(milliseconds: 600),
  //   Duration delay = Duration.zero,
  // }) =>
  //     ZoomInRight(duration: duration, delay: delay, child: this);

  // Special
  Widget elasticIn({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      ElasticIn(duration: duration, delay: delay, child: this);

  Widget jelloIn({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      JelloIn(duration: duration, delay: delay, child: this);

  Widget flash({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      Flash(duration: duration, delay: delay, child: this);

  Widget pulse({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      Pulse(duration: duration, delay: delay, child: this);

  Widget swing({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      Swing(duration: duration, delay: delay, child: this);

  Widget tada({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      Tada(duration: duration, delay: delay, child: this);

  Widget wobble({
    Duration duration = const Duration(milliseconds: 600),
    Duration delay = Duration.zero,
  }) =>
      Wobble(duration: duration, delay: delay, child: this);
}

extension ShimmerExtension on Widget {
  Widget withShimmer({
    bool isShow = true,
    Color? color,
    Key? key,
  }) {
    return _ShimmerWrapper(
      key: key,
      isShow: isShow,
      color: color,
      child: this,
    );
  }
}

class _ShimmerWrapper extends StatelessWidget {
  final Widget child;
  final bool isShow;
  final Color? color;

  const _ShimmerWrapper({
    super.key,
    required this.child,
    required this.isShow,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (!isShow) return child;

    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.onSurface.withOpacity(.05),
      highlightColor: Theme.of(context).colorScheme.onSurface.withOpacity(.1),
      child: Container(
        color: color ?? Theme.of(context).colorScheme.surface,
        child: child,
      ),
    );
  }
}

extension PopupExtension on BuildContext {
  /// Show an AlertDialog
  Future<void> showAlertDialog({
    required String title,
    required String content,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return showDialog<void>(
      context: this,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          titlePadding: EdgeInsets.zero,
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Text(title, textAlign: TextAlign.center, style: Theme.of(this).textTheme.headlineSmall),
            ],
          ),
          content: Text(content, textAlign: TextAlign.center, style: Theme.of(this).textTheme.bodyMedium),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            if (cancelText != null)
              TextButton(
                onPressed: () {
                  onCancel?.call();
                  Navigator.of(this).pop();
                },
                child: Text(cancelText),
              ),
            if (confirmText != null)
              TextButton(
                onPressed: () {
                  onConfirm?.call();
                  Navigator.of(this).pop();
                },
                child: Text(confirmText),
              ),
          ],
        );
      },
    );
  }

  /// Show a BottomSheet
  Future<void> showCustomBottomSheet({
    required Widget child,
    bool isDismissible = true,
    ShapeBorder? shape,
    Color? backgroundColor,
  }) {
    return showModalBottomSheet<void>(
      context: this,
      isDismissible: isDismissible,
      shape: shape,
      backgroundColor: backgroundColor,
      builder: (_) => child,
    );
  }

  /// Show a SnackBar
  void showSnackBar({
    required String message,
    SnackBarAction? action,
    Duration duration = const Duration(seconds: 4),
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message, style: Theme.of(this).textTheme.bodyMedium),
        action: action,
        duration: duration,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// Show a SimpleDialog
  Future<void> showSimpleDialog({
    required String title,
    required String content,
    String? buttonText,
    VoidCallback? onButtonPressed,
  }) {
    return showDialog<void>(
      context: this,
      builder: (_) {
        return SimpleDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 100.0,
                textColor: Colors.blue,
                style: FlutterLogoStyle.horizontal,
              ),
              const SizedBox(height: 8),
              Text(title),
            ],
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(content),
            ),
            if (buttonText != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    onButtonPressed?.call();
                    Navigator.of(this).pop();
                  },
                  child: Text(buttonText),
                ),
              ),
          ],
        );
      },
    );
  }

  /// Show a Loading Dialog
  Future<void> showLoadingDialog({String message = 'Loading...'}) {
    return showDialog<void>(
      context: this,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 20),
              Text(message, style: Theme.of(this).textTheme.bodyMedium),
            ],
          ),
        );
      },
    );
  }

  /// Show Confirmation Dialog (returns bool)
  Future<bool> showConfirmationDialog({
    required String title,
    required String content,
    String confirmText = 'Yes',
    String cancelText = 'No',
  }) async {
    final result = await showDialog<bool>(
      context: this,
      builder: (_) {
        return AlertDialog(
          title: Column(
            children: [
              FlutterLogo(
                size: 100.0,
                textColor: Colors.blue,
                style: FlutterLogoStyle.horizontal,
              ),
              const SizedBox(height: 8),
              Text(title),
            ],
          ),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(this).pop(false),
              child: Text(cancelText),
            ),
            TextButton(
              onPressed: () => Navigator.of(this).pop(true),
              child: Text(confirmText),
            ),
          ],
        );
      },
    );
    return result ?? false;
  }
}
