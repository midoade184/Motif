import '/components/auth_component/auth_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginRegisterModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for authComponent component.
  late AuthComponentModel authComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    authComponentModel = createModel(context, () => AuthComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    authComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
