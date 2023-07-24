import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckoutModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String paymentId = 'cod';

  String paymentTitle = 'Cash on delivery';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for AdditionalNotes widget.
  TextEditingController? additionalNotesController;
  String? Function(BuildContext, String?)? additionalNotesControllerValidator;
  // Stores action output result for [Backend Call - API (Create Order)] action in Button widget.
  ApiCallResponse? orderResponse;
  // Stores action output result for [Backend Call - API (Clear Cart)] action in Button widget.
  ApiCallResponse? clearCartResponse;
  // Stores action output result for [Backend Call - API (Create Order Note)] action in Button widget.
  ApiCallResponse? orderNodeResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textController1?.dispose();
    additionalNotesController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
