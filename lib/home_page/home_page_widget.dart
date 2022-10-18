import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  PagingController<DocumentSnapshot?, VideoRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          logFirebaseEvent('HOME_FloatingActionButton_d7h4q5z5_ON_TA');
          logFirebaseEvent('FloatingActionButton_navigate_to');

          context.pushNamed('UploadPage');
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: Icon(
          Icons.upload_sharp,
          color: FlutterFlowTheme.of(context).primaryBtnText,
          size: 24,
        ),
      ),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          FFLocalizations.of(context).getText(
            '9nr62lay' /* Home */,
          ),
          style: FlutterFlowTheme.of(context).title1,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'lm1dkdek' /* Adjust Filters */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 40,
                        icon: Icon(
                          Icons.tune_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 44),
                  child: PagedListView<DocumentSnapshot<Object?>?, VideoRecord>(
                    pagingController: () {
                      final Query<Object?> Function(Query<Object?>)
                          queryBuilder = (videoRecord) => videoRecord
                              .orderBy('created_at', descending: true);
                      if (_pagingController != null) {
                        final query = queryBuilder(VideoRecord.collection);
                        if (query != _pagingQuery) {
                          // The query has changed
                          _pagingQuery = query;
                          _streamSubscriptions.forEach((s) => s?.cancel());
                          _streamSubscriptions.clear();
                          _pagingController!.refresh();
                        }
                        return _pagingController!;
                      }

                      _pagingController = PagingController(firstPageKey: null);
                      _pagingQuery = queryBuilder(VideoRecord.collection);
                      _pagingController!
                          .addPageRequestListener((nextPageMarker) {
                        queryVideoRecordPage(
                          queryBuilder: (videoRecord) => videoRecord
                              .orderBy('created_at', descending: true),
                          nextPageMarker: nextPageMarker,
                          pageSize: 25,
                          isStream: true,
                        ).then((page) {
                          _pagingController!.appendPage(
                            page.data,
                            page.nextPageMarker,
                          );
                          final streamSubscription =
                              page.dataStream?.listen((data) {
                            final itemIndexes = _pagingController!.itemList!
                                .asMap()
                                .map((k, v) => MapEntry(v.reference.id, k));
                            data.forEach((item) {
                              final index = itemIndexes[item.reference.id];
                              final items = _pagingController!.itemList!;
                              if (index != null) {
                                items.replaceRange(index, index + 1, [item]);
                                _pagingController!.itemList = {
                                  for (var item in items) item.reference: item
                                }.values.toList();
                              }
                            });
                            setState(() {});
                          });
                          _streamSubscriptions.add(streamSubscription);
                        });
                      });
                      return _pagingController!;
                    }(),
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    builderDelegate: PagedChildBuilderDelegate<VideoRecord>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      ),

                      itemBuilder: (context, _, listViewIndex) {
                        final listViewVideoRecord =
                            _pagingController!.itemList![listViewIndex];
                        return InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'HOME_PAGE_PAGE_Row_b2xmc6ep_ON_TAP');
                            logFirebaseEvent('Row_navigate_to');

                            context.pushNamed(
                              'VideoPage',
                              queryParams: {
                                'id': serializeParam(
                                  listViewVideoRecord.reference,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    listViewVideoRecord.cover!,
                                    width: 75,
                                    height: 75,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        listViewVideoRecord.title!,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                      StreamBuilder<UserRecord>(
                                        stream: UserRecord.getDocument(
                                            listViewVideoRecord.owner!),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          final textUserRecord = snapshot.data!;
                                          return Text(
                                            textUserRecord.displayName!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: FlutterFlowTheme.of(context).grayIcon,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
