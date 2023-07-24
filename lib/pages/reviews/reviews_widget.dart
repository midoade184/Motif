import '/components/single_review/single_review_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reviews_model.dart';
export 'reviews_model.dart';

class ReviewsWidget extends StatefulWidget {
  const ReviewsWidget({
    Key? key,
    this.reviews,
  }) : super(key: key);

  final dynamic reviews;

  @override
  _ReviewsWidgetState createState() => _ReviewsWidgetState();
}

class _ReviewsWidgetState extends State<ReviewsWidget> {
  late ReviewsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 46.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 24.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'xrr0gz6i' /* Reviews */,
          ),
          style: FlutterFlowTheme.of(context).titleMedium,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3.0,
                      color: Color(0x39000000),
                      offset: Offset(0.0, 1.0),
                    )
                  ],
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 24.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Text(
                              getJsonField(
                                widget.reviews,
                                r'''$.review_count''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context).displaySmall,
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'avy8stjd' /* # of Ratings */,
                            ),
                            style: FlutterFlowTheme.of(context).bodySmall,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Text(
                                  getJsonField(
                                    widget.reviews,
                                    r'''$.average_rating''',
                                  ).toString(),
                                  style:
                                      FlutterFlowTheme.of(context).displaySmall,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 0.0, 12.0),
                                child: Icon(
                                  Icons.star_rounded,
                                  color: Color(0xFFFFA130),
                                  size: 24.0,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'qgf6c18w' /* Avg. Rating */,
                            ),
                            style: FlutterFlowTheme.of(context).bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 6.0),
                child: Builder(
                  builder: (context) {
                    final reviews = getJsonField(
                      widget.reviews,
                      r'''$.reviews''',
                    ).toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: reviews.length,
                      itemBuilder: (context, reviewsIndex) {
                        final reviewsItem = reviews[reviewsIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 10.0),
                          child: wrapWithModel(
                            model: _model.singleReviewModels.getModel(
                              getJsonField(
                                reviewsItem,
                                r'''$.user_email''',
                              ).toString(),
                              reviewsIndex,
                            ),
                            updateCallback: () => setState(() {}),
                            child: SingleReviewWidget(
                              key: Key(
                                'Keywwr_${getJsonField(
                                  reviewsItem,
                                  r'''$.user_email''',
                                ).toString()}',
                              ),
                              review: getJsonField(
                                reviewsItem,
                                r'''$.review''',
                              ).toString(),
                              userName: getJsonField(
                                reviewsItem,
                                r'''$.user''',
                              ).toString(),
                              userAvatar: getJsonField(
                                reviewsItem,
                                r'''$.user_avatar''',
                              ),
                              userRating: getJsonField(
                                reviewsItem,
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
            ],
          ),
        ),
      ),
    );
  }
}
