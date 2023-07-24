import '/components/single_review/single_review_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReviewsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Models for singleReview dynamic component.
  late FlutterFlowDynamicModels<SingleReviewModel> singleReviewModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    singleReviewModels = FlutterFlowDynamicModels(() => SingleReviewModel());
  }

  void dispose() {
    singleReviewModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
