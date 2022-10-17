import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class VideoTradingHistoryPageWidget extends StatefulWidget {
  const VideoTradingHistoryPageWidget({
    Key? key,
    this.video,
  }) : super(key: key);

  final DocumentReference? video;

  @override
  _VideoTradingHistoryPageWidgetState createState() =>
      _VideoTradingHistoryPageWidgetState();
}

class _VideoTradingHistoryPageWidgetState
    extends State<VideoTradingHistoryPageWidget> {
  PagingController<DocumentSnapshot?, TransactionRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'VideoTradingHistoryPage'});
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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.chevron_left,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('VIDEO_TRADING_HISTORY_chevron_left_ICN_O');
            logFirebaseEvent('IconButton_Navigate-Back');
            context.pop();
          },
        ),
        title: Text(
          'Video Trading  History',
          style: FlutterFlowTheme.of(context).title2,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: PagedListView<DocumentSnapshot<Object?>?, TransactionRecord>(
          pagingController: () {
            final Query<Object?> Function(Query<Object?>) queryBuilder =
                (transactionRecord) =>
                    transactionRecord.where('video', isEqualTo: widget.video);
            if (_pagingController != null) {
              final query = queryBuilder(TransactionRecord.collection);
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
            _pagingQuery = queryBuilder(TransactionRecord.collection);
            _pagingController!.addPageRequestListener((nextPageMarker) {
              queryTransactionRecordPage(
                queryBuilder: (transactionRecord) =>
                    transactionRecord.where('video', isEqualTo: widget.video),
                nextPageMarker: nextPageMarker,
                pageSize: 25,
                isStream: true,
              ).then((page) {
                _pagingController!.appendPage(
                  page.data,
                  page.nextPageMarker,
                );
                final streamSubscription = page.dataStream?.listen((data) {
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
          scrollDirection: Axis.vertical,
          builderDelegate: PagedChildBuilderDelegate<TransactionRecord>(
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
              final listViewTransactionRecord =
                  _pagingController!.itemList![listViewIndex];
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 0,
                        color: FlutterFlowTheme.of(context).lineColor,
                        offset: Offset(0, 1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(0),
                    shape: BoxShape.rectangle,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 4,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    StreamBuilder<UserRecord>(
                                      stream: UserRecord.getDocument(
                                          listViewTransactionRecord.from!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        final usernameUserRecord =
                                            snapshot.data!;
                                        return Text(
                                          usernameUserRecord.displayName!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        );
                                      },
                                    ),
                                    Text(
                                      formatNumber(
                                        listViewTransactionRecord.amount!,
                                        formatType: FormatType.custom,
                                        format: 'HKD \$',
                                        locale: '',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Text(
                                    'Purchased',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Text(
                            dateTimeFormat(
                              'yMMMd',
                              listViewTransactionRecord.createdAt!,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            style: FlutterFlowTheme.of(context).bodyText2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
