import '/backend/api_requests/api_calls.dart';
import '/components/app_bar/app_bar_widget.dart';
import '/components/product_card/product_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'shop_model.dart';
export 'shop_model.dart';

class ShopWidget extends StatefulWidget {
  const ShopWidget({Key? key}) : super(key: key);

  @override
  _ShopWidgetState createState() => _ShopWidgetState();
}

class _ShopWidgetState extends State<ShopWidget> {
  late ShopModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShopModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().isLoggedIn &&
          (FFAppState().userEmail != null && FFAppState().userEmail != '') &&
          (FFAppState().userPassword != null &&
              FFAppState().userPassword != '')) {
        _model.cartResponse = await CartQuantityCall.call(
          id: int.parse(FFAppState().userId),
          authToken: FFAppState().authToken,
        );
        setState(() {
          FFAppState().cartQuantity = (_model.cartResponse?.jsonBody ?? '');
        });
      }
      _model.productsResult = await ProductsGroup.allProductsCall.call(
        authToken: FFAppState().authToken,
        filterParameters: '&orderby=popular',
        perPage: '&per_page=20',
        page: '&page=${_model.currentPage}',
      );
      if ((_model.productsResult?.succeeded ?? true)) {
        setState(() {
          _model.wpTotalPages =
              (_model.productsResult?.getHeader('x-wp-totalpages') ?? '');
        });
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            title: wrapWithModel(
              model: _model.appBarModel,
              updateCallback: () => setState(() {}),
              child: AppBarWidget(),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: FutureBuilder<ApiCallResponse>(
              future:
                  (_model.apiRequestCompleter1 ??= Completer<ApiCallResponse>()
                        ..complete(ProductsGroup.productsCall.call(
                          authToken: FFAppState().authToken,
                          filter: 'sales',
                        )))
                      .future,
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
                final columnProductsResponse = snapshot.data!;
                return RefreshIndicator(
                  onRefresh: () async {
                    setState(() => _model.apiRequestCompleter2 = null);
                    await _model.waitForApiRequestCompleted2();
                    setState(() => _model.apiRequestCompleter1 = null);
                    await _model.waitForApiRequestCompleted1();
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FutureBuilder<ApiCallResponse>(
                          future: ProductsGroup.getSlidesCall.call(
                            authToken: FFAppState().authToken,
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
                            final customProductCarouselGetSlidesResponse =
                                snapshot.data!;
                            return Container(
                              width: double.infinity,
                              height: 300.0,
                              child: custom_widgets.CustomProductCarousel(
                                width: double.infinity,
                                height: 300.0,
                                imageWidth: MediaQuery.sizeOf(context).width,
                                imageHeight: 300.0,
                                gallery: customProductCarouselGetSlidesResponse
                                    .jsonBody,
                                isBanner: true,
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 16.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'bs1g74xe' /* Shop By Category */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'AllCats',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '58zn1lkl' /* View all */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 14.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 140.0,
                                constraints: BoxConstraints(
                                  maxHeight: 180.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: (_model.apiRequestCompleter2 ??=
                                            Completer<ApiCallResponse>()
                                              ..complete(ProductsGroup
                                                  .getCategoriesCall
                                                  .call(
                                                authToken:
                                                    FFAppState().authToken,
                                              )))
                                        .future,
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: SpinKitChasingDots(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      final listViewGetCategoriesResponse =
                                          snapshot.data!;
                                      return Builder(
                                        builder: (context) {
                                          final cats = getJsonField(
                                            listViewGetCategoriesResponse
                                                .jsonBody,
                                            r'''$''',
                                          ).toList();
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: cats.length,
                                            itemBuilder: (context, catsIndex) {
                                              final catsItem = cats[catsIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 8.0, 0.0),
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 200),
                                                  curve: Curves.bounceOut,
                                                  width: 80.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'SingleCat',
                                                        queryParameters: {
                                                          'catId':
                                                              serializeParam(
                                                            getJsonField(
                                                              catsItem,
                                                              r'''$.id''',
                                                            ),
                                                            ParamType.int,
                                                          ),
                                                          'catName':
                                                              serializeParam(
                                                            getJsonField(
                                                              catsItem,
                                                              r'''$.name''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl: (getJsonField(
                                                                          catsItem,
                                                                          r'''$..image''',
                                                                        ) !=
                                                                        null) &&
                                                                    (getJsonField(
                                                                          catsItem,
                                                                          r'''$..image..src''',
                                                                        ) !=
                                                                        false)
                                                                ? getJsonField(
                                                                    catsItem,
                                                                    r'''$..image..src''',
                                                                  )
                                                                : 'https://motifeg.com/wp-content/uploads/2023/02/not-loaded-scaled.webp',
                                                            height: 80.0,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: Text(
                                                            functions.replaceAMP(
                                                                getJsonField(
                                                              catsItem,
                                                              r'''$.name''',
                                                            ).toString()),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 16.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'zr8oqzsg' /* Best Selling */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('AllProdudcts');
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'uc478lnm' /* View all */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 14.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 16.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 260.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      final singleProduct =
                                          (ProductsGroup.productsCall
                                                      .productsList(
                                                        columnProductsResponse
                                                            .jsonBody,
                                                      )
                                                      ?.toList() ??
                                                  [])
                                              .take(10)
                                              .toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: singleProduct.length,
                                        itemBuilder:
                                            (context, singleProductIndex) {
                                          final singleProductItem =
                                              singleProduct[singleProductIndex];
                                          return ProductCardWidget(
                                            key: Key(
                                                'Key1d6_${singleProductIndex}_of_${singleProduct.length}'),
                                            productImage: getJsonField(
                                                      singleProductItem,
                                                      r'''$.main_image.featured_image''',
                                                    ) !=
                                                    null
                                                ? getJsonField(
                                                    singleProductItem,
                                                    r'''$.main_image.featured_image''',
                                                  )
                                                : 'https://motifeg.com/wp-content/uploads/2023/02/not-loaded-scaled.webp',
                                            productRate: getJsonField(
                                              singleProductItem,
                                              r'''$.reviews.average_rating''',
                                            ).toString(),
                                            title: getJsonField(
                                              singleProductItem,
                                              r'''$.title''',
                                            ).toString(),
                                            price: getJsonField(
                                              singleProductItem,
                                              r'''$.price''',
                                            ).toString(),
                                            regularPrice: getJsonField(
                                              singleProductItem,
                                              r'''$.regular_price''',
                                            ).toString(),
                                            discount: getJsonField(
                                              singleProductItem,
                                              r'''$.discount_percentage''',
                                            ).toString(),
                                            id: getJsonField(
                                              singleProductItem,
                                              r'''$.id''',
                                            ),
                                            stock: getJsonField(
                                              singleProductItem,
                                              r'''$.stock_quantity''',
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
