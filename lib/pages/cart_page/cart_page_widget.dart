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
import 'cart_page_model.dart';
export 'cart_page_model.dart';

class CartPageWidget extends StatefulWidget {
  const CartPageWidget({Key? key}) : super(key: key);

  @override
  _CartPageWidgetState createState() => _CartPageWidgetState();
}

class _CartPageWidgetState extends State<CartPageWidget> {
  late CartPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((FFAppState().userEmail == null || FFAppState().userEmail == '') ||
          (FFAppState().userPassword == null ||
              FFAppState().userPassword == '') ||
          (FFAppState().isLoggedIn == false) ||
          (FFAppState().userToken == null || FFAppState().userToken == '')) {
        context.pushNamed('Login-Register');
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: wrapWithModel(
            model: _model.appBarWithBackButtonModel,
            updateCallback: () => setState(() {}),
            child: AppBarWithBackButtonWidget(),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: FutureBuilder<ApiCallResponse>(
            future: GetCustomCartCall.call(
              authToken: FFAppState().authToken,
              id: int.parse(FFAppState().userId),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitChasingDots(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 50.0,
                    ),
                  ),
                );
              }
              final columnGetCustomCartResponse = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if ('${getJsonField(
                        columnGetCustomCartResponse.jsonBody,
                        r'''$.items''',
                      ).toString()}' !=
                      '[]')
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          final itemsInCart = getJsonField(
                            columnGetCustomCartResponse.jsonBody,
                            r'''$.items''',
                          ).toList();
                          if (itemsInCart.isEmpty) {
                            return EmptyListWidget(
                              icon: Icon(
                                Icons.remove_shopping_cart_outlined,
                                size: 26.0,
                              ),
                              title: 'Your cart is empty',
                              description:
                                  'we couldn\'t find and products in your cart',
                            );
                          }
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: itemsInCart.length,
                            itemBuilder: (context, itemsInCartIndex) {
                              final itemsInCartItem =
                                  itemsInCart[itemsInCartIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.96,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3.0,
                                        color: Color(0x49000000),
                                        offset: Offset(0.0, 1.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                Duration(milliseconds: 500),
                                            fadeOutDuration:
                                                Duration(milliseconds: 500),
                                            imageUrl: getJsonField(
                                                      itemsInCartItem,
                                                      r'''$.main_image.featured_image''',
                                                    ) !=
                                                    null
                                                ? getJsonField(
                                                    itemsInCartItem,
                                                    r'''$.main_image.featured_image''',
                                                  )
                                                : 'https://motifeg.com/wp-content/uploads/2023/02/not-loaded-scaled.webp',
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            height: 220.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 12.0, 16.0, 8.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    getJsonField(
                                                      itemsInCartItem,
                                                      r'''$.title''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium,
                                                  ),
                                                  if ('${getJsonField(
                                                        itemsInCartItem,
                                                        r'''$.attributes''',
                                                      ).toString()}' !=
                                                      '[]')
                                                    Builder(
                                                      builder: (context) {
                                                        final variation = functions
                                                            .getAttsAsList(
                                                                itemsInCartItem)
                                                            .toList();
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              variation.length,
                                                              (variationIndex) {
                                                            final variationItem =
                                                                variation[
                                                                    variationIndex];
                                                            return Text(
                                                              '${functions.capitalizeFirstLetter(variationItem.toString())}${functions.isLastInList(functions.getAttsAsList(itemsInCartItem).map((e) => e.toString()).toList(), variationItem.toString()) == true ? ' ' : ' , '}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            );
                                                          }),
                                                        );
                                                      },
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            getJsonField(
                                                                      itemsInCartItem,
                                                                      r'''$.quantity''',
                                                                    ) !=
                                                                    _model.defQ
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                        borderRadius: 10.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 35.0,
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .minus,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 15.0,
                                                        ),
                                                        showLoadingIndicator:
                                                            true,
                                                        onPressed: getJsonField(
                                                                  itemsInCartItem,
                                                                  r'''$.quantity''',
                                                                ) ==
                                                                _model.defQ
                                                            ? null
                                                            : () async {
                                                                _model.decrementResponse =
                                                                    await CartGroup
                                                                        .updateItemInCartCall
                                                                        .call(
                                                                  userToken:
                                                                      FFAppState()
                                                                          .userToken,
                                                                  itemKey:
                                                                      getJsonField(
                                                                    itemsInCartItem,
                                                                    r'''$.key''',
                                                                  ).toString(),
                                                                  quantity: functions
                                                                      .decrementQty(
                                                                          getJsonField(
                                                                    itemsInCartItem,
                                                                    r'''$.quantity''',
                                                                  )),
                                                                );
                                                                if ((_model
                                                                        .decrementResponse
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Item decremented successfully',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .customColor1,
                                                                    ),
                                                                  );
                                                                  if (Navigator.of(
                                                                          context)
                                                                      .canPop()) {
                                                                    context
                                                                        .pop();
                                                                  }
                                                                  context
                                                                      .pushNamed(
                                                                    'CartPage',
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      kTransitionInfoKey:
                                                                          TransitionInfo(
                                                                        hasTransition:
                                                                            true,
                                                                        transitionType:
                                                                            PageTransitionType.fade,
                                                                        duration:
                                                                            Duration(milliseconds: 0),
                                                                      ),
                                                                    },
                                                                  );

                                                                  _model.cartQResponse =
                                                                      await CartQuantityCall
                                                                          .call(
                                                                    authToken:
                                                                        FFAppState()
                                                                            .authToken,
                                                                    id: int.parse(
                                                                        FFAppState()
                                                                            .userId),
                                                                  );
                                                                  if ((_model
                                                                          .cartQResponse
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                          .cartQuantity = (_model
                                                                              .cartQResponse
                                                                              ?.jsonBody ??
                                                                          '');
                                                                    });
                                                                  }
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        (_model.decrementResponse?.jsonBody ??
                                                                                '')
                                                                            .toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .customColor3,
                                                                    ),
                                                                  );
                                                                }

                                                                setState(() {});
                                                              },
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Text(
                                                          getJsonField(
                                                            itemsInCartItem,
                                                            r'''$.quantity''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            getJsonField(
                                                                      itemsInCartItem,
                                                                      r'''$.stock_quantity''',
                                                                    ) ==
                                                                    getJsonField(
                                                                      itemsInCartItem,
                                                                      r'''$.quantity''',
                                                                    )
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                        borderRadius: 10.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 35.0,
                                                        icon: Icon(
                                                          Icons.add,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 15.0,
                                                        ),
                                                        showLoadingIndicator:
                                                            true,
                                                        onPressed: getJsonField(
                                                                  itemsInCartItem,
                                                                  r'''$.stock_quantity''',
                                                                ) ==
                                                                getJsonField(
                                                                  itemsInCartItem,
                                                                  r'''$.quantity''',
                                                                )
                                                            ? null
                                                            : () async {
                                                                _model.incrementResponse =
                                                                    await CartGroup
                                                                        .updateItemInCartCall
                                                                        .call(
                                                                  userToken:
                                                                      FFAppState()
                                                                          .userToken,
                                                                  itemKey:
                                                                      getJsonField(
                                                                    itemsInCartItem,
                                                                    r'''$.key''',
                                                                  ).toString(),
                                                                  quantity: functions
                                                                      .incrementQty(
                                                                          getJsonField(
                                                                    itemsInCartItem,
                                                                    r'''$.quantity''',
                                                                  )),
                                                                );
                                                                if ((_model
                                                                        .incrementResponse
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Item incremented successfully',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .customColor1,
                                                                    ),
                                                                  );
                                                                  if (Navigator.of(
                                                                          context)
                                                                      .canPop()) {
                                                                    context
                                                                        .pop();
                                                                  }
                                                                  context
                                                                      .pushNamed(
                                                                    'CartPage',
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      kTransitionInfoKey:
                                                                          TransitionInfo(
                                                                        hasTransition:
                                                                            true,
                                                                        transitionType:
                                                                            PageTransitionType.fade,
                                                                        duration:
                                                                            Duration(milliseconds: 0),
                                                                      ),
                                                                    },
                                                                  );

                                                                  _model.cartQQResponse =
                                                                      await CartQuantityCall
                                                                          .call(
                                                                    authToken:
                                                                        FFAppState()
                                                                            .authToken,
                                                                    id: int.parse(
                                                                        FFAppState()
                                                                            .userId),
                                                                  );
                                                                  if ((_model
                                                                          .cartQQResponse
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                          .cartQuantity = (_model
                                                                              .cartQQResponse
                                                                              ?.jsonBody ??
                                                                          '');
                                                                    });
                                                                  }
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        (_model.incrementResponse?.jsonBody ??
                                                                                '')
                                                                            .toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .customColor3,
                                                                    ),
                                                                  );
                                                                }

                                                                setState(() {});
                                                              },
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              '${getJsonField(
                                                itemsInCartItem,
                                                r'''$.single_price''',
                                              ).toString()} x ${getJsonField(
                                                itemsInCartItem,
                                                r'''$.quantity''',
                                              ).toString()}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        height: 4.0,
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: Text(
                                                    '${getJsonField(
                                                      itemsInCartItem,
                                                      r'''$.total_price''',
                                                    ).toString()} EGP',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 23.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                                if ('${getJsonField(
                                                      itemsInCartItem,
                                                      r'''$.discount_percentage''',
                                                    ).toString()}' !=
                                                    '0')
                                                  Text(
                                                    '${getJsonField(
                                                      itemsInCartItem,
                                                      r'''$.total_regular_price''',
                                                    ).toString()} EGP',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                        ),
                                                  ),
                                              ],
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 10.0,
                                              buttonSize: 46.0,
                                              icon: Icon(
                                                Icons.delete_outline_rounded,
                                                color: Color(0xFFE62424),
                                                size: 20.0,
                                              ),
                                              showLoadingIndicator: true,
                                              onPressed: () async {
                                                _model.apiResult25g =
                                                    await CartGroup
                                                        .removeItemCall
                                                        .call(
                                                  userToken:
                                                      FFAppState().userToken,
                                                  itemKey: getJsonField(
                                                    itemsInCartItem,
                                                    r'''$.key''',
                                                  ).toString(),
                                                );
                                                if ((_model.apiResult25g
                                                        ?.succeeded ??
                                                    true)) {
                                                  if (Navigator.of(context)
                                                      .canPop()) {
                                                    context.pop();
                                                  }
                                                  context.pushNamed(
                                                    'CartPage',
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 0),
                                                      ),
                                                    },
                                                  );

                                                  _model.cartQQQResponse =
                                                      await CartQuantityCall
                                                          .call(
                                                    authToken:
                                                        FFAppState().authToken,
                                                    id: int.parse(
                                                        FFAppState().userId),
                                                  );
                                                  if ((_model.cartQQQResponse
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .cartQuantity = (_model
                                                              .cartQQQResponse
                                                              ?.jsonBody ??
                                                          '');
                                                    });
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .clearSnackBars();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Item Removed Successfully',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            Color(0xFF3B9B24),
                                                      ),
                                                    );
                                                  }
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .clearSnackBars();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        (_model.apiResult25g
                                                                    ?.jsonBody ??
                                                                '')
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          Color(0xB9FF4343),
                                                    ),
                                                  );
                                                }

                                                setState(() {});
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  if ('${getJsonField(
                        columnGetCustomCartResponse.jsonBody,
                        r'''$.items''',
                      ).toString()}' !=
                      '[]')
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '50y4iv1r' /* Order Summary */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).titleSmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'ogj5mk6r' /* Subtotal */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ),
                                Text(
                                  '${getJsonField(
                                    columnGetCustomCartResponse.jsonBody,
                                    r'''$.subtotal''',
                                  ).toString()} EGP',
                                  textAlign: TextAlign.end,
                                  style:
                                      FlutterFlowTheme.of(context).titleSmall,
                                ),
                              ],
                            ),
                          ),
                          if ('${getJsonField(
                                columnGetCustomCartResponse.jsonBody,
                                r'''$.discount_percentage''',
                              ).toString()}' !=
                              '0')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'bjbvjpob' /* Discount */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                  Text(
                                    '${getJsonField(
                                      columnGetCustomCartResponse.jsonBody,
                                      r'''$.discount_price''',
                                    ).toString()} EGP',
                                    textAlign: TextAlign.end,
                                    style:
                                        FlutterFlowTheme.of(context).titleSmall,
                                  ),
                                ],
                              ),
                            ),
                          Divider(
                            height: 2.0,
                            thickness: 1.0,
                            indent: 16.0,
                            endIndent: 16.0,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 24.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'utumtrnp' /* Total To Pay */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ),
                                Text(
                                  '${getJsonField(
                                    columnGetCustomCartResponse.jsonBody,
                                    r'''$.total''',
                                  ).toString()} EGP',
                                  textAlign: TextAlign.end,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                FFAppState().checkoutCartProducts = functions
                                    .filterOrderProducts(getJsonField(
                                      columnGetCustomCartResponse.jsonBody,
                                      r'''$.items''',
                                    )!)
                                    .toList()
                                    .cast<dynamic>();
                                if (FFAppState().checkoutCartProducts.length !=
                                    0) {
                                  context.pushNamed('ShippingDetails');
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'cart is empty',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0x00000000),
                                    ),
                                  );
                                }
                              },
                              text: FFLocalizations.of(context).getText(
                                '8o5fi3dd' /* Proceed to Shipping */,
                              ),
                              options: FFButtonOptions(
                                width: 320.0,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
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
                                borderRadius: BorderRadius.circular(8.0),
                                hoverColor: Colors.black,
                                hoverTextColor:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if ('${getJsonField(
                        columnGetCustomCartResponse.jsonBody,
                        r'''$.items''',
                      ).toString()}' ==
                      '[]')
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'pb9j1vrh' /* Your Cart is Empty */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              context.goNamed('Shop');
                            },
                            text: FFLocalizations.of(context).getText(
                              'fdqrjwrm' /* Go Shopping */,
                            ),
                            options: FFButtonOptions(
                              width: 130.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
