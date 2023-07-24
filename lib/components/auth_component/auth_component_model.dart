import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthComponentModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for Email-Login widget.
  TextEditingController? emailLoginController;
  String? Function(BuildContext, String?)? emailLoginControllerValidator;
  // State field(s) for Password-Login widget.
  TextEditingController? passwordLoginController;
  late bool passwordLoginVisibility;
  String? Function(BuildContext, String?)? passwordLoginControllerValidator;
  // Stores action output result for [Backend Call - API (Customer Login)] action in Button-Login widget.
  ApiCallResponse? loginResultLogin;
  // Stores action output result for [Backend Call - API (Get Customer)] action in Button-Login widget.
  ApiCallResponse? getUserResponseLogin;
  // Stores action output result for [Backend Call - API (Cart Quantity)] action in Button-Login widget.
  ApiCallResponse? cartQ;
  // State field(s) for FirstName-Register widget.
  TextEditingController? firstNameRegisterController;
  String? Function(BuildContext, String?)? firstNameRegisterControllerValidator;
  // State field(s) for LastName-Register widget.
  TextEditingController? lastNameRegisterController;
  String? Function(BuildContext, String?)? lastNameRegisterControllerValidator;
  // State field(s) for Email-Register widget.
  TextEditingController? emailRegisterController;
  String? Function(BuildContext, String?)? emailRegisterControllerValidator;
  // State field(s) for Password-Register widget.
  TextEditingController? passwordRegisterController;
  late bool passwordRegisterVisibility;
  String? Function(BuildContext, String?)? passwordRegisterControllerValidator;
  // Stores action output result for [Backend Call - API (Create Customer)] action in Button-CreateAccount widget.
  ApiCallResponse? createResponseRegister;
  // Stores action output result for [Backend Call - API (Customer Login)] action in Button-CreateAccount widget.
  ApiCallResponse? loginResponseRegister;
  // Stores action output result for [Backend Call - API (Get Customer)] action in Button-CreateAccount widget.
  ApiCallResponse? getUserResponseRegister;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordLoginVisibility = false;
    passwordRegisterVisibility = false;
  }

  void dispose() {
    emailLoginController?.dispose();
    passwordLoginController?.dispose();
    firstNameRegisterController?.dispose();
    lastNameRegisterController?.dispose();
    emailRegisterController?.dispose();
    passwordRegisterController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
