import 'package:flutter/material.dart';

enum Flavor {
  development,
  staging,
  production,
}

class FlavorProvider extends InheritedWidget {
  final Flavor flavor;

  FlavorProvider({
    Key key,
    @required this.flavor,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child) {
    //FirestoreService.configure();
  }

//  static Flavor of(BuildContext context) => (context
//          .ancestorInheritedElementForWidgetOfExactType(FlavorProvider)
//          .widget as FlavorProvider)
//      .flavor;

  static Flavor of(BuildContext context) =>
      (context.getElementForInheritedWidgetOfExactType().widget
              as FlavorProvider)
          .flavor;

  @override
  bool updateShouldNotify(FlavorProvider oldWidget) => false;
}
