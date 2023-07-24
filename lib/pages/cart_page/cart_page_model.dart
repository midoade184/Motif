import '/backend/api_requests/api_calls.dart';
import '/components/app_bar_with_back_button/app_bar_with_back_button_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int defQ = 1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Update Item in Cart)] action in IconButton widget.
  ApiCallResponse? decrementResponse;
  // Stores action output result for [Backend Call - API (Cart Quantity)] action in IconButton widget.
  ApiCallResponse? cartQResponse;
  // Stores action output result for [Backend Call - API (Update Item in Cart)] action in IconButton widget.
  ApiCallResponse? incrementResponse;
  // Stores action output result for [Backend Call - API (Cart Quantity)] action in IconButton widget.
  ApiCallResponse? cartQQResponse;
  // Stores action output result for [Backend Call - API (Remove Item)] action in IconButton widget.
  ApiCallResponse? apiResult25g;
  // Stores action output result for [Backend Call - API (Cart Quantity)] action in IconButton widget.
  ApiCallResponse? cartQQQResponse;
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
