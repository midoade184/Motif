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
import 'product_page_model.dart';
export 'product_page_model.dart';

class ProductPageWidget extends StatefulWidget {
  const ProductPageWidget({
    Key? key,
    this.id,
    this.discount,
    this.stock,
  }) : super(key: key);

  final int? id;
  final int? discount;
  final int? stock;

  @override
  _ProductPageWidgetState createState() => _ProductPageWidgetState();
}

class _ProductPageWidgetState extends State<ProductPageWidget>
    with TickerProviderStateMixin {
  late ProductPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 100.ms,
          duration: 500.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductPageModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
            future: ProductsGroup.singleProductCall.call(
              authToken: FFAppState().authToken,
              id: widget.id?.toString(),
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
              final productPageSingleProductResponse = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 300.0,
                            child: custom_widgets.CustomProductCarousel(
                              width: double.infinity,
                              height: 300.0,
                              gallery: getJsonField(
                                productPageSingleProductResponse.jsonBody,
                                r'''$.gallery''',
                              ),
                              imageWidth: 1050.0,
                              imageHeight: 300.0,
                              isBanner: false,
                              mainImage: getJsonField(
                                productPageSingleProductResponse.jsonBody,
                                r'''$.main_image.featured_image''',
                              ).toString(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (getJsonField(
                                      productPageSingleProductResponse.jsonBody,
                                      r'''$.reviews.average_rating''',
                                    ) !=
                                    _model.zero)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 24.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        RatingBarIndicator(
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: Color(0xFFFFA130),
                                          ),
                                          direction: Axis.horizontal,
                                          rating: 1.0,
                                          unratedColor: Color(0xFF95A1AC),
                                          itemCount: 1,
                                          itemSize: 24.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            getJsonField(
                                              productPageSingleProductResponse
                                                  .jsonBody,
                                              r'''$.reviews.average_rating''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 15.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'SingleCat',
                                      queryParameters: {
                                        'catId': serializeParam(
                                          getJsonField(
                                            productPageSingleProductResponse
                                                .jsonBody,
                                            r'''$.categories[0].id''',
                                          ),
                                          ParamType.int,
                                        ),
                                        'catName': serializeParam(
                                          getJsonField(
                                            productPageSingleProductResponse
                                                .jsonBody,
                                            r'''$.categories[0].title''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Text(
                                    getJsonField(
                                      productPageSingleProductResponse.jsonBody,
                                      r'''$.categories[0].title''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                        ),
                                  ),
                                ),
                                Text(
                                  getJsonField(
                                    productPageSingleProductResponse.jsonBody,
                                    r'''$.title''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium,
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: formatNumber(
                                          _model.price == null
                                              ? getJsonField(
                                                  productPageSingleProductResponse
                                                      .jsonBody,
                                                  r'''$.price''',
                                                )
                                              : _model.price!,
                                          formatType: FormatType.custom,
                                          format: '#,###,###',
                                          locale: '',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 25.0,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'jnatqdg6' /*   */,
                                        ),
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text: FFAppState().currency,
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12.0,
                                        ),
                                      )
                                    ],
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                                if ((widget.discount != 0) ||
                                    ((_model.discount != null) &&
                                        (_model.discount != 0)))
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: formatNumber(
                                                _model.regularPrice == null
                                                    ? getJsonField(
                                                        productPageSingleProductResponse
                                                            .jsonBody,
                                                        r'''$.regular_price''',
                                                      )
                                                    : _model.regularPrice!,
                                                formatType: FormatType.custom,
                                                format: '#,###,###',
                                                locale: '',
                                              ),
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 15.0,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'svbuwys5' /*   */,
                                              ),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12.0,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                            TextSpan(
                                              text: FFAppState().currency,
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12.0,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEB6B4A),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 2.0, 4.0, 2.0),
                                            child: Text(
                                              '-${(_model.discount == null) || (widget.discount != 0) ? getJsonField(
                                                  productPageSingleProductResponse
                                                      .jsonBody,
                                                  r'''$.discount_percentage''',
                                                ).toString() : _model.discount?.toString()}%',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                if (getJsonField(
                                      productPageSingleProductResponse.jsonBody,
                                      r'''$.variations''',
                                    ) !=
                                    null)
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'fkr7ae8q' /* Options */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 15.0,
                                            ),
                                      ),
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeIn,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: _model.isOptionSelected ==
                                                    false
                                                ? FlutterFlowTheme.of(context)
                                                    .customColor3
                                                : Color(0x00000000),
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Builder(
                                          builder: (context) {
                                            final variations = getJsonField(
                                              productPageSingleProductResponse
                                                  .jsonBody,
                                              r'''$.variations''',
                                            ).toList();
                                            return Wrap(
                                              spacing: 20.0,
                                              runSpacing: 20.0,
                                              alignment: WrapAlignment.start,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              direction: Axis.horizontal,
                                              runAlignment: WrapAlignment.start,
                                              verticalDirection:
                                                  VerticalDirection.down,
                                              clipBehavior: Clip.none,
                                              children: List.generate(
                                                  variations.length,
                                                  (variationsIndex) {
                                                final variationsItem =
                                                    variations[variationsIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 5.0, 5.0, 5.0),
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
                                                      _model.variantID =
                                                          getJsonField(
                                                        variationsItem,
                                                        r'''$.id''',
                                                      );
                                                      _model.price =
                                                          getJsonField(
                                                        variationsItem,
                                                        r'''$.sale_price''',
                                                      );
                                                      _model.regularPrice =
                                                          getJsonField(
                                                        variationsItem,
                                                        r'''$.regular_price''',
                                                      );
                                                      _model.isOptionSelected =
                                                          true;
                                                      _model.stockQty =
                                                          getJsonField(
                                                        variationsItem,
                                                        r'''$.stock_quantity''',
                                                      );
                                                      _model.operationalSalePrice =
                                                          getJsonField(
                                                        variationsItem,
                                                        r'''$.sale_price''',
                                                      );
                                                      _model.operationalRegularPrice =
                                                          getJsonField(
                                                        variationsItem,
                                                        r'''$.regular_price''',
                                                      );
                                                      _model.discount =
                                                          getJsonField(
                                                        variationsItem,
                                                        r'''$.discount''',
                                                      );
                                                      setState(() {
                                                        _model.price = _model
                                                                .operationalSalePrice! *
                                                            _model
                                                                .countControllerValue!;
                                                        _model
                                                            .regularPrice = _model
                                                                .operationalRegularPrice! *
                                                            _model
                                                                .countControllerValue!;
                                                      });
                                                    },
                                                    child: AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 400),
                                                      curve: Curves.easeIn,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: getJsonField(
                                                                    variationsItem,
                                                                    r'''$.id''',
                                                                  ) ==
                                                                  _model
                                                                      .variantID
                                                              ? colorFromCssString(
                                                                  getJsonField(
                                                                    variationsItem,
                                                                    r'''$.attributes.attribute_pa_color''',
                                                                  )
                                                                      .toString()
                                                                      .toLowerCase(),
                                                                )
                                                              : Color(
                                                                  0x00000000),
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        5.0,
                                                                        5.0,
                                                                        5.0),
                                                            child: Container(
                                                              width: 30.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    colorFromCssString(
                                                                  getJsonField(
                                                                    variationsItem,
                                                                    r'''$.attributes.attribute_pa_color''',
                                                                  )
                                                                      .toString()
                                                                      .toLowerCase(),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                          ),
                                                          Builder(
                                                            builder: (context) {
                                                              final attributes =
                                                                  functions
                                                                      .getAttsAsList(
                                                                          variationsItem)
                                                                      .toList();
                                                              return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: List.generate(
                                                                    attributes
                                                                        .length,
                                                                    (attributesIndex) {
                                                                  final attributesItem =
                                                                      attributes[
                                                                          attributesIndex];
                                                                  return Text(
                                                                    '${functions.capitalizeFirstLetter(attributesItem.toString())}${functions.isLastInList(functions.getAttsAsList(variationsItem).map((e) => e.toString()).toList(), attributesItem.toString()) == true ? ' ' : ' , '}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  );
                                                                }),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'xbwrptzc' /* Please select an option */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: _model.isOptionSelected ==
                                                      false
                                                  ? FlutterFlowTheme.of(context)
                                                      .customColor3
                                                  : Color(0x00000000),
                                            ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 24.0,
                            thickness: 2.0,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 8.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    child: ExpandableNotifier(
                                      initialExpanded: false,
                                      child: ExpandablePanel(
                                        header: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 12.0, 0.0),
                                              child: Icon(
                                                Icons.sticky_note_2_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'jd4b0s7b' /* Product Detail */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                        collapsed: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Text(
                                            getJsonField(
                                              productPageSingleProductResponse
                                                  .jsonBody,
                                              r'''$.description''',
                                            ).toString().maybeHandleOverflow(
                                                  maxChars: 25,
                                                  replacement: '…',
                                                ),
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ),
                                        expanded: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              getJsonField(
                                                productPageSingleProductResponse
                                                    .jsonBody,
                                                r'''$.description''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                          ],
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: false,
                                          tapBodyToCollapse: false,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                          expandIcon:
                                              Icons.chevron_right_rounded,
                                          collapseIcon:
                                              Icons.keyboard_arrow_down_rounded,
                                          iconSize: 24.0,
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 24.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    child: ExpandableNotifier(
                                      initialExpanded: false,
                                      child: ExpandablePanel(
                                        header: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 12.0, 0.0),
                                              child: Icon(
                                                Icons.local_shipping_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'uhktjz7y' /* Shipping Information */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                        collapsed: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'tmipu8gi' /* Lorem ipsum dolor sit amet, co... */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ),
                                        expanded: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ufm3poyc' /* Lorem ipsum dolor sit amet, co... */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                          ],
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: false,
                                          tapBodyToCollapse: false,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                          expandIcon:
                                              Icons.chevron_right_rounded,
                                          collapseIcon:
                                              Icons.keyboard_arrow_down_rounded,
                                          iconSize: 24.0,
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'p95otk0m' /* Reviews */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 18.0,
                                          ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'Reviews',
                                          queryParameters: {
                                            'reviews': serializeParam(
                                              getJsonField(
                                                productPageSingleProductResponse
                                                    .jsonBody,
                                                r'''$.reviews''',
                                              ),
                                              ParamType.JSON,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'ybj68142' /* view all */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 13.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 12.0),
                                child: Builder(
                                  builder: (context) {
                                    final reviewsList = getJsonField(
                                      productPageSingleProductResponse.jsonBody,
                                      r'''$.reviews.reviews''',
                                    ).toList().take(3).toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: reviewsList.length,
                                      itemBuilder: (context, reviewsListIndex) {
                                        final reviewsListItem =
                                            reviewsList[reviewsListIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 10.0),
                                          child: wrapWithModel(
                                            model: _model.singleReviewModels
                                                .getModel(
                                              getJsonField(
                                                reviewsListItem,
                                                r'''$.user_email''',
                                              ).toString(),
                                              reviewsListIndex,
                                            ),
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: SingleReviewWidget(
                                              key: Key(
                                                'Key1la_${getJsonField(
                                                  reviewsListItem,
                                                  r'''$.user_email''',
                                                ).toString()}',
                                              ),
                                              review: getJsonField(
                                                reviewsListItem,
                                                r'''$.review''',
                                              ).toString(),
                                              userName: getJsonField(
                                                reviewsListItem,
                                                r'''$.user''',
                                              ).toString(),
                                              userAvatar: getJsonField(
                                                reviewsListItem,
                                                r'''$.user_avatar''',
                                              ),
                                              userRating: getJsonField(
                                                reviewsListItem,
                                                r'''$.user_rating''',
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              wrapWithModel(
                                model: _model.addReviewModel,
                                updateCallback: () => setState(() {}),
                                child: AddReviewWidget(
                                  productID: getJsonField(
                                    productPageSingleProductResponse.jsonBody,
                                    r'''$.id''',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 79.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x320F1113),
                            offset: Offset(0.0, -2.0),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                        ),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 15.0, 10.0, 15.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (getJsonField(
                                  productPageSingleProductResponse.jsonBody,
                                  r'''$.stock_status''',
                                ) ==
                                'instock')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    3.0, 0.0, 3.0, 0.0),
                                child: Container(
                                  width: 130.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: FlutterFlowCountController(
                                    decrementIconBuilder: (enabled) => Icon(
                                      Icons.remove_rounded,
                                      color: enabled
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryText
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      size: 16.0,
                                    ),
                                    incrementIconBuilder: (enabled) => Icon(
                                      Icons.add_rounded,
                                      color: enabled
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      size: 16.0,
                                    ),
                                    countBuilder: (count) => Text(
                                      count.toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                    count: _model.countControllerValue ??= 1,
                                    updateCount: (count) async {
                                      setState(() =>
                                          _model.countControllerValue = count);
                                      if ((_model.operationalSalePrice !=
                                              null) &&
                                          (_model.operationalRegularPrice !=
                                              null)) {
                                        setState(() {
                                          _model.regularPrice =
                                              _model.operationalRegularPrice! *
                                                  _model.countControllerValue!;
                                          _model.price =
                                              _model.operationalSalePrice! *
                                                  _model.countControllerValue!;
                                        });
                                      } else {
                                        setState(() {
                                          _model.regularPrice = getJsonField(
                                                productPageSingleProductResponse
                                                    .jsonBody,
                                                r'''$.regular_price''',
                                              ) *
                                              _model.countControllerValue!;
                                          _model.price = getJsonField(
                                                productPageSingleProductResponse
                                                    .jsonBody,
                                                r'''$.price''',
                                              ) *
                                              _model.countControllerValue!;
                                        });
                                      }
                                    },
                                    stepSize: 1,
                                    minimum: 1,
                                  ),
                                ),
                              ),
                            if (getJsonField(
                                  productPageSingleProductResponse.jsonBody,
                                  r'''$.stock_status''',
                                ) ==
                                'instock')
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if ((FFAppState().userEmail == null ||
                                              FFAppState().userEmail == '') ||
                                          (FFAppState().userPassword == null ||
                                              FFAppState().userPassword ==
                                                  '') ||
                                          (FFAppState().isLoggedIn == false) ||
                                          (FFAppState().userToken == null ||
                                              FFAppState().userToken == '')) {
                                        context.pushNamed('Login-Register');
                                      } else {
                                        _model.addToCartResult =
                                            await CartGroup.addToCartCall.call(
                                          userToken: FFAppState().userToken,
                                          id: _model.variantID != null
                                              ? _model.variantID
                                              : widget.id,
                                          qty: _model.countControllerValue
                                              ?.toString(),
                                        );
                                        if ((_model
                                                .addToCartResult?.succeeded ??
                                            true)) {
                                          _model.cartQResponse =
                                              await CartQuantityCall.call(
                                            authToken: FFAppState().authToken,
                                            id: int.parse(FFAppState().userId),
                                          );
                                          if ((_model
                                                  .cartQResponse?.succeeded ??
                                              true)) {
                                            FFAppState().update(() {
                                              FFAppState().cartQuantity =
                                                  (_model.cartQResponse
                                                          ?.jsonBody ??
                                                      '');
                                            });
                                            ScaffoldMessenger.of(context)
                                                .clearSnackBars();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Item Added To Cart',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                action: SnackBarAction(
                                                  label: 'View Cart',
                                                  textColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  onPressed: () async {
                                                    context
                                                        .pushNamed('CartPage');
                                                  },
                                                ),
                                              ),
                                            );
                                          }
                                        } else {
                                          if (_model.countControllerValue! >
                                              getJsonField(
                                                productPageSingleProductResponse
                                                    .jsonBody,
                                                r'''$.stock_quantity''',
                                              )) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Maximun quantity is ${getJsonField(
                                                    productPageSingleProductResponse
                                                        .jsonBody,
                                                    r'''$.stock_quantity''',
                                                  ).toString()}',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    Color(0xA8E21C3D),
                                              ),
                                            );
                                          } else {
                                            setState(() {
                                              _model.isOptionSelected = false;
                                            });
                                          }
                                        }
                                      }

                                      setState(() {});
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'chbw6ycj' /* Add to Cart */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 160.0,
                                      height: 50.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                    ),
                                  ),
                                ),
                              ),
                            if (getJsonField(
                                  productPageSingleProductResponse.jsonBody,
                                  r'''$.stock_status''',
                                ) ==
                                'outofstock')
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: getJsonField(
                                            productPageSingleProductResponse
                                                .jsonBody,
                                            r'''$.stock_status''',
                                          ) ==
                                          'outofstock'
                                      ? null
                                      : () {
                                          print('Button pressed ...');
                                        },
                                  text: FFLocalizations.of(context).getText(
                                    '1axglhpn' /* Out of Stock */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 130.0,
                                    height: 40.0,
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
                                    disabledColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
