import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddReviewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for Review widget.
  TextEditingController? reviewController;
  String? Function(BuildContext, String?)? reviewControllerValidator;
  String? _reviewControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'drwncx93' /* Please add your review first */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Add Review)] action in Button widget.
  ApiCallResponse? addReviewResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    reviewControllerValidator = _reviewControllerValidator;
  }

  void dispose() {
    reviewController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
