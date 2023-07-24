import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShippingDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for FirstName widget.
  TextEditingController? firstNameController;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  String? _firstNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3umpngsf' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for LastName widget.
  TextEditingController? lastNameController;
  String? Function(BuildContext, String?)? lastNameControllerValidator;
  String? _lastNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'v3kstjto' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4wmwxq1x' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Phone widget.
  TextEditingController? phoneController;
  String? Function(BuildContext, String?)? phoneControllerValidator;
  String? _phoneControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'gnshsg75' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Company widget.
  TextEditingController? companyController;
  String? Function(BuildContext, String?)? companyControllerValidator;
  String? _companyControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'h7a1gnyr' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for StreetNo widget.
  TextEditingController? streetNoController;
  String? Function(BuildContext, String?)? streetNoControllerValidator;
  String? _streetNoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ovonap4u' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for BuildingNo widget.
  TextEditingController? buildingNoController;
  String? Function(BuildContext, String?)? buildingNoControllerValidator;
  String? _buildingNoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'uwpwb6fu' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for FloorNo widget.
  TextEditingController? floorNoController;
  String? Function(BuildContext, String?)? floorNoControllerValidator;
  String? _floorNoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'tnxg6jkt' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for AppartmentNo widget.
  TextEditingController? appartmentNoController;
  String? Function(BuildContext, String?)? appartmentNoControllerValidator;
  String? _appartmentNoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '22oujvks' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Country widget.
  TextEditingController? countryController;
  String? Function(BuildContext, String?)? countryControllerValidator;
  String? _countryControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'mp1s79ci' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for City widget.
  TextEditingController? cityController;
  String? Function(BuildContext, String?)? cityControllerValidator;
  String? _cityControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0domwmf5' /* Field is required */,
      );
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    firstNameControllerValidator = _firstNameControllerValidator;
    lastNameControllerValidator = _lastNameControllerValidator;
    emailControllerValidator = _emailControllerValidator;
    phoneControllerValidator = _phoneControllerValidator;
    companyControllerValidator = _companyControllerValidator;
    streetNoControllerValidator = _streetNoControllerValidator;
    buildingNoControllerValidator = _buildingNoControllerValidator;
    floorNoControllerValidator = _floorNoControllerValidator;
    appartmentNoControllerValidator = _appartmentNoControllerValidator;
    countryControllerValidator = _countryControllerValidator;
    cityControllerValidator = _cityControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    firstNameController?.dispose();
    lastNameController?.dispose();
    emailController?.dispose();
    phoneController?.dispose();
    companyController?.dispose();
    streetNoController?.dispose();
    buildingNoController?.dispose();
    floorNoController?.dispose();
    appartmentNoController?.dispose();
    countryController?.dispose();
    cityController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
