import '/backend/api_requests/api_calls.dart';
import '/components/add_review/add_review_widget.dart';
import '/components/app_bar_with_back_button/app_bar_with_back_button_widget.dart';
import '/components/single_review/single_review_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int? variantID;

  int? price;

  int? regularPrice;

  bool? isOptionSelected;

  int? stockQty;

  int? operationalSalePrice;

  int? operationalRegularPrice;

  int? discount;

  int zero = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for singleReview dynamic component.
  late FlutterFlowDynamicModels<SingleReviewModel> singleReviewModels;
  // Model for addReview component.
  late AddReviewModel addReviewModel;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // Stores action output result for [Backend Call - API (Add To Cart)] action in Button widget.
  ApiCallResponse? addToCartResult;
  // Stores action output result for [Backend Call - API (Cart Quantity)] action in Button widget.
  ApiCallResponse? cartQResponse;
  // Model for appBarWithBackButton component.
  late AppBarWithBackButtonModel appBarWithBackButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    singleReviewModels = FlutterFlowDynamicModels(() => SingleReviewModel());
    addReviewModel = createModel(context, () => AddReviewModel());
    appBarWithBackButtonModel =
        createModel(context, () => AppBarWithBackButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    singleReviewModels.dispose();
    addReviewModel.dispose();
    appBarWithBackButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
