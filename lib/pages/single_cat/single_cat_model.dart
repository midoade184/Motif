import '/backend/api_requests/api_calls.dart';
import '/components/app_bar_with_back_button/app_bar_with_back_button_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/product_card/product_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SingleCatModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for appBarWithBackButton component.
  late AppBarWithBackButtonModel appBarWithBackButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarWithBackButtonModel =
        createModel(context, () => AppBarWithBackButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appBarWithBackButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
