import '/flutter_flow/flutter_flow_util.dart';
import '/pages/drawer/drawer_widget.dart';
import 'order_main_widget.dart' show OrderMainWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OrderMainModel extends FlutterFlowModel<OrderMainWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 0;

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Model for Drawer component.
  late DrawerModel drawerModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
