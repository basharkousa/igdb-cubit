import 'package:flutter/material.dart';
// Navigation Extension

extension NavigationExtension on BuildContext {

  void navigateTo(String routeName, {Object? arguments}) {
    Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  void replaceWith(String routeName, {Object? arguments}) {
    Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

  void navigateAndRemoveUntil(String routeName, {Object? arguments, required RoutePredicate predicate}) {
    Navigator.pushNamedAndRemoveUntil(this, routeName, predicate, arguments: arguments);
  }

  void popUntil(RoutePredicate predicate) {
    Navigator.popUntil(this, predicate);
  }

  void pop() {
    Navigator.pop(this);
  }

  Future<dynamic> navigateToAndAwaitResult(String routeName, {Object? arguments}) {
    return Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  // Example of a custom transition
  Future<dynamic> navigateWithCustomTransition(
      String routeName, {
        required Widget child, // The destination widget
        required Duration duration, // Duration of the animation
        required Curve curve, // Animation curve
        Offset? slideStartPosition, // For SlideTransition
        double? scaleStartValue, // For ScaleTransition
      }) {
    return Navigator.push(
      this,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionDuration: duration,
        reverseTransitionDuration: duration,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {

          if (slideStartPosition != null) {
            final tween = Tween(begin: slideStartPosition, end: Offset.zero).chain(CurveTween(curve: curve));
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          } else if (scaleStartValue != null) {
            final tween = Tween(begin: scaleStartValue, end: 1.0).chain(CurveTween(curve: curve));
            final scaleAnimation = animation.drive(tween);
            return ScaleTransition(
              scale: scaleAnimation,
              child: child,
            );
          } else {  // Default: Fade transition
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          }
        },
        settings: RouteSettings(name: routeName), // Important for named routes
      ),
    );
  }

  // Example of a route guard (using a function)
  Future<bool> canNavigateTo(String routeName) async {
    // Implement your logic here (e.g., authentication check)
    // Return true if navigation is allowed, false otherwise.
    await Future.delayed(const Duration(seconds: 1)); // Simulate a delay
    return true; // Or false based on your condition
  }

  void guardedNavigate(String routeName, {Object? arguments, required Future<bool> Function() guard}) async {
    if (await guard()) {
      navigateTo(routeName, arguments: arguments);
    } else {
      // Handle denied navigation (e.g., show a message)
      ScaffoldMessenger.of(this).showSnackBar(const SnackBar(content: Text("You don't have permission to access this route.")));
    }
  }

}

