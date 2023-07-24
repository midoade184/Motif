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
import 'auth_component_model.dart';
export 'auth_component_model.dart';

class AuthComponentWidget extends StatefulWidget {
  const AuthComponentWidget({Key? key}) : super(key: key);

  @override
  _AuthComponentWidgetState createState() => _AuthComponentWidgetState();
}

class _AuthComponentWidgetState extends State<AuthComponentWidget> {
  late AuthComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthComponentModel());

    _model.emailLoginController ??=
        TextEditingController(text: FFAppState().userEmail);
    _model.passwordLoginController ??=
        TextEditingController(text: FFAppState().userPassword);
    _model.firstNameRegisterController ??= TextEditingController();
    _model.lastNameRegisterController ??= TextEditingController();
    _model.emailRegisterController ??= TextEditingController();
    _model.passwordRegisterController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 30.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/motif-site-icon.png',
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(0.0, 0),
                    child: TabBar(
                      isScrollable: true,
                      labelColor: FlutterFlowTheme.of(context).primary,
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      labelPadding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      labelStyle: FlutterFlowTheme.of(context).titleMedium,
                      indicatorColor: FlutterFlowTheme.of(context).primary,
                      indicatorWeight: 1.0,
                      tabs: [
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            '3dv713i4' /* Sign In */,
                          ),
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            '3336mvwn' /* Sign Up */,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        KeepAliveWidgetWrapper(
                          builder: (context) => Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 24.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Form(
                                    key: _model.formKey2,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 20.0, 20.0, 10.0),
                                          child: TextFormField(
                                            controller:
                                                _model.emailLoginController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'yp6wpq6s' /* Email Address */,
                                              ),
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .grayIcon,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xB9FF4343),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xB9FF4343),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(15.0, 15.0,
                                                          15.0, 15.0),
                                              prefixIcon: Icon(
                                                Icons.email_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayIcon,
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            validator: _model
                                                .emailLoginControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 10.0, 20.0, 0.0),
                                          child: TextFormField(
                                            controller:
                                                _model.passwordLoginController,
                                            obscureText:
                                                !_model.passwordLoginVisibility,
                                            decoration: InputDecoration(
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'ez4j18m6' /* Password */,
                                              ),
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .grayIcon,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xB9FF4343),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xB9FF4343),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(15.0, 15.0,
                                                          15.0, 15.0),
                                              prefixIcon: Icon(
                                                Icons.lock_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayIcon,
                                              ),
                                              suffixIcon: InkWell(
                                                onTap: () => setState(
                                                  () => _model
                                                          .passwordLoginVisibility =
                                                      !_model
                                                          .passwordLoginVisibility,
                                                ),
                                                focusNode: FocusNode(
                                                    skipTraversal: true),
                                                child: Icon(
                                                  _model.passwordLoginVisibility
                                                      ? Icons
                                                          .visibility_outlined
                                                      : Icons
                                                          .visibility_off_outlined,
                                                  color: Color(0xFF757575),
                                                  size: 22.0,
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            textAlign: TextAlign.justify,
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            validator: _model
                                                .passwordLoginControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 5.0, 20.0, 0.0),
                                              child: RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ogsbbgc7' /* Fogot password?  */,
                                                      ),
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '0q7874n5' /* Recover */,
                                                      ),
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                      mouseCursor:
                                                          SystemMouseCursors
                                                              .click,
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () async {
                                                              await launchURL(
                                                                  'https://motifeg.com/my-account/lost-password/');
                                                            },
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 10.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (_model.formKey2
                                                          .currentState ==
                                                      null ||
                                                  !_model.formKey2.currentState!
                                                      .validate()) {
                                                return;
                                              }
                                              _model.loginResultLogin =
                                                  await CustomerLoginCall.call(
                                                userName: _model
                                                    .emailLoginController.text,
                                                password: _model
                                                    .passwordLoginController
                                                    .text,
                                                tokenUrl: FFAppState().tokeUrl,
                                              );
                                              if ((_model.loginResultLogin
                                                      ?.succeeded ??
                                                  true)) {
                                                FFAppState().userEmail = _model
                                                    .emailLoginController.text;
                                                FFAppState().userPassword =
                                                    _model
                                                        .passwordLoginController
                                                        .text;
                                                FFAppState().isLoggedIn = true;
                                                FFAppState().userId =
                                                    CustomerLoginCall.userID(
                                                  (_model.loginResultLogin
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString();
                                                FFAppState().userToken =
                                                    CustomerLoginCall.userToken(
                                                  (_model.loginResultLogin
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      getJsonField(
                                                        (_model.loginResultLogin
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.message''',
                                                      ).toString(),
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        Color(0xFF3DB1A4),
                                                  ),
                                                );
                                                context.safePop();
                                                _model.getUserResponseLogin =
                                                    await CsutomerGroup
                                                        .getCustomerCall
                                                        .call(
                                                  authToken:
                                                      FFAppState().authToken,
                                                  id: CustomerLoginCall.userID(
                                                    (_model.loginResultLogin
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                );
                                                if ((_model.getUserResponseLogin
                                                        ?.succeeded ??
                                                    true)) {
                                                  FFAppState().firstName =
                                                      CsutomerGroup
                                                          .getCustomerCall
                                                          .firstName(
                                                            (_model.getUserResponseLogin
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                          .toString();
                                                  FFAppState().lastName =
                                                      CsutomerGroup
                                                          .getCustomerCall
                                                          .lastName(
                                                            (_model.getUserResponseLogin
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                          .toString();
                                                  FFAppState().userName =
                                                      CsutomerGroup
                                                          .getCustomerCall
                                                          .userName(
                                                            (_model.getUserResponseLogin
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                          .toString();
                                                  FFAppState().company =
                                                      CsutomerGroup
                                                          .getCustomerCall
                                                          .company(
                                                            (_model.getUserResponseLogin
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                          .toString();
                                                  FFAppState().city =
                                                      CsutomerGroup
                                                          .getCustomerCall
                                                          .city(
                                                            (_model.getUserResponseLogin
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                          .toString();
                                                  FFAppState().country =
                                                      CsutomerGroup
                                                          .getCustomerCall
                                                          .country(
                                                            (_model.getUserResponseLogin
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                          .toString();
                                                  FFAppState().avatarUrl =
                                                      CsutomerGroup
                                                          .getCustomerCall
                                                          .avatarUrl(
                                                    (_model.getUserResponseLogin
                                                            ?.jsonBody ??
                                                        ''),
                                                  );
                                                  FFAppState().phone =
                                                      CsutomerGroup
                                                          .getCustomerCall
                                                          .phone(
                                                            (_model.getUserResponseLogin
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                          .toString();
                                                  FFAppState().userEmail =
                                                      CsutomerGroup
                                                          .getCustomerCall
                                                          .email(
                                                            (_model.getUserResponseLogin
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                          .toString();
                                                  _model.cartQ =
                                                      await CartQuantityCall
                                                          .call(
                                                    authToken:
                                                        FFAppState().authToken,
                                                    id: int.parse(
                                                        FFAppState().userId),
                                                  );
                                                  if ((_model
                                                          .cartQ?.succeeded ??
                                                      true)) {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .cartQuantity =
                                                          (_model.cartQ
                                                                  ?.jsonBody ??
                                                              '');
                                                    });
                                                  }
                                                }
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      CustomerLoginCall
                                                          .errorMessage(
                                                        (_model.loginResultLogin
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString(),
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        Color(0xFF4B4B4B),
                                                  ),
                                                );
                                              }

                                              setState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'cg98s0au' /* Login */,
                                            ),
                                            options: FFButtonOptions(
                                              width: 130.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              elevation: 2.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'ci44cj8a' /* Or use a social account to log... */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 8.0, 24.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        KeepAliveWidgetWrapper(
                          builder: (context) => Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 24.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Form(
                                    key: _model.formKey1,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 20.0, 20.0, 10.0),
                                          child: TextFormField(
                                            controller: _model
                                                .firstNameRegisterController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '0hbt4ari' /* First Name */,
                                              ),
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .grayIcon,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xB9FF4343),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xB9FF4343),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(15.0, 15.0,
                                                          15.0, 15.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            keyboardType: TextInputType.name,
                                            validator: _model
                                                .firstNameRegisterControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 10.0, 20.0, 10.0),
                                          child: TextFormField(
                                            controller: _model
                                                .lastNameRegisterController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '6n993du9' /* Last Name */,
                                              ),
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .grayIcon,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xB9FF4343),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xB9FF4343),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0,
                                                          10.0, 10.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            maxLines: null,
                                            keyboardType: TextInputType.name,
                                            validator: _model
                                                .lastNameRegisterControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 10.0, 20.0, 10.0),
                                          child: TextFormField(
                                            controller:
                                                _model.emailRegisterController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'mpecypso' /* Email */,
                                              ),
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .grayIcon,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xB9FF4343),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xB9FF4343),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0,
                                                          10.0, 10.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            maxLines: null,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            validator: _model
                                                .emailRegisterControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 10.0, 20.0, 10.0),
                                          child: TextFormField(
                                            controller: _model
                                                .passwordRegisterController,
                                            obscureText: !_model
                                                .passwordRegisterVisibility,
                                            decoration: InputDecoration(
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'slqat5zc' /* Password */,
                                              ),
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .grayIcon,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xB9FF4343),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xB9FF4343),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0,
                                                          10.0, 10.0),
                                              suffixIcon: InkWell(
                                                onTap: () => setState(
                                                  () => _model
                                                          .passwordRegisterVisibility =
                                                      !_model
                                                          .passwordRegisterVisibility,
                                                ),
                                                focusNode: FocusNode(
                                                    skipTraversal: true),
                                                child: Icon(
                                                  _model.passwordRegisterVisibility
                                                      ? Icons
                                                          .visibility_outlined
                                                      : Icons
                                                          .visibility_off_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .grayIcon,
                                                  size: 22.0,
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            validator: _model
                                                .passwordRegisterControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (_model.formKey1.currentState ==
                                                null ||
                                            !_model.formKey1.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        _model.createResponseRegister =
                                            await CsutomerGroup
                                                .createCustomerCall
                                                .call(
                                          authToken: FFAppState().authToken,
                                          customerModelJson: getJsonField(
                                            functions.customerModel(
                                                functions.capitalizeFirstLetter(
                                                    _model
                                                        .firstNameRegisterController
                                                        .text),
                                                functions.capitalizeFirstLetter(
                                                    _model
                                                        .lastNameRegisterController
                                                        .text),
                                                _model.emailRegisterController
                                                    .text,
                                                _model
                                                    .passwordRegisterController
                                                    .text),
                                            r'''$''',
                                          ),
                                        );
                                        if ((_model.createResponseRegister
                                                ?.succeeded ??
                                            true)) {
                                          _model.loginResponseRegister =
                                              await CustomerLoginCall.call(
                                            tokenUrl: FFAppState().tokeUrl,
                                            userName: _model
                                                .emailRegisterController.text,
                                            password: _model
                                                .passwordRegisterController
                                                .text,
                                          );
                                          if ((_model.loginResponseRegister
                                                  ?.succeeded ??
                                              true)) {
                                            FFAppState().update(() {
                                              FFAppState().userEmail = _model
                                                  .emailRegisterController.text;
                                              FFAppState().userPassword = _model
                                                  .passwordRegisterController
                                                  .text;
                                              FFAppState().isLoggedIn = true;
                                              FFAppState().userId =
                                                  getJsonField(
                                                (_model.loginResponseRegister
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.id''',
                                              ).toString();
                                              FFAppState().firstName = _model
                                                  .firstNameRegisterController
                                                  .text;
                                              FFAppState().lastName = _model
                                                  .lastNameRegisterController
                                                  .text;
                                              FFAppState().userToken =
                                                  CustomerLoginCall.userToken(
                                                (_model.loginResponseRegister
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString();
                                            });
                                            context.safePop();
                                            _model.getUserResponseRegister =
                                                await CsutomerGroup
                                                    .getCustomerCall
                                                    .call(
                                              authToken: FFAppState().authToken,
                                              id: CustomerLoginCall.userID(
                                                (_model.loginResponseRegister
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                            );
                                            if ((_model.getUserResponseRegister
                                                    ?.succeeded ??
                                                true)) {
                                              FFAppState().update(() {
                                                FFAppState().firstName =
                                                    CsutomerGroup
                                                        .getCustomerCall
                                                        .firstName(
                                                          (_model.getUserResponseRegister
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )
                                                        .toString();
                                                FFAppState().lastName =
                                                    CsutomerGroup
                                                        .getCustomerCall
                                                        .lastName(
                                                          (_model.getUserResponseRegister
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )
                                                        .toString();
                                                FFAppState().userName =
                                                    CsutomerGroup
                                                        .getCustomerCall
                                                        .userName(
                                                          (_model.getUserResponseRegister
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )
                                                        .toString();
                                                FFAppState().company =
                                                    CsutomerGroup
                                                        .getCustomerCall
                                                        .company(
                                                          (_model.getUserResponseRegister
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )
                                                        .toString();
                                                FFAppState().city =
                                                    CsutomerGroup
                                                        .getCustomerCall
                                                        .city(
                                                          (_model.getUserResponseRegister
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )
                                                        .toString();
                                                FFAppState().country =
                                                    CsutomerGroup
                                                        .getCustomerCall
                                                        .country(
                                                          (_model.getUserResponseRegister
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )
                                                        .toString();
                                                FFAppState().avatarUrl =
                                                    CsutomerGroup
                                                        .getCustomerCall
                                                        .avatarUrl(
                                                  (_model.getUserResponseRegister
                                                          ?.jsonBody ??
                                                      ''),
                                                );
                                                FFAppState().phone =
                                                    CsutomerGroup
                                                        .getCustomerCall
                                                        .phone(
                                                          (_model.getUserResponseRegister
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )
                                                        .toString();
                                                FFAppState().userEmail =
                                                    CsutomerGroup
                                                        .getCustomerCall
                                                        .email(
                                                          (_model.getUserResponseRegister
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )
                                                        .toString();
                                              });
                                            }
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                getJsonField(
                                                  (_model.createResponseRegister
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.message''',
                                                ).toString(),
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          );
                                        }

                                        setState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        's6m4l5lg' /* Create Account */,
                                      ),
                                      options: FFButtonOptions(
                                        width: 230.0,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                            ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 24.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '8fr1l9k6' /* Sign up using a social account */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
