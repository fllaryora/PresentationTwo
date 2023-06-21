
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainModel with ChangeNotifier, DiagnosticableTreeMixin {
  int _counter = 0;
  int get counter => _counter;

  void increment() {
    _counter ++;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder propertiesBuilder) {
    super.debugFillProperties(propertiesBuilder);
    propertiesBuilder.add(IntProperty('counter', counter));
  }
}