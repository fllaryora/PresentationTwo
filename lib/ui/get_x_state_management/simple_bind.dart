import 'package:get/get.dart';
import 'package:presentationtwo/ui/get_x_state_management/second/controller_x.dart';

class SampleBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerX>(() => ControllerX());
  }
}