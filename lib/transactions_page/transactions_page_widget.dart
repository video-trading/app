import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TransactionsPageWidget extends StatefulWidget {
  const TransactionsPageWidget({
    Key? key,
    this.users,
  }) : super(key: key);

  final DocumentReference? users;

  @override
  _TransactionsPageWidgetState createState() => _TransactionsPageWidgetState();
}

class _TransactionsPageWidgetState extends State<TransactionsPageWidget> {
  PagingController<DocumentSnapshot?, TransactionRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TransactionsPage'});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('TRANSACTIONS_arrow_back_rounded_ICN_ON_T');
            logFirebaseEvent('IconButton_Navigate-Back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'urn2tixm' /* Transactions */,
          ),
          style: FlutterFlowTheme.of(context).subtitle1,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    PagedListView<DocumentSnapshot<Object?>?,
                        TransactionRecord>(
                      pagingController: () {
                        final Query<Object?> Function(Query<Object?>)
                            queryBuilder = (transactionRecord) =>
                                transactionRecord.where('from',
                                    isEqualTo: currentUserReference);
                        if (_pagingController != null) {
                          final query =
                              queryBuilder(TransactionRecord.collection);
                          if (query != _pagingQuery) {
                            // The query has changed
                            _pagingQuery = query;
                            _streamSubscriptions.forEach((s) => s?.cancel());
                            _streamSubscriptions.clear();
                            _pagingController!.refresh();
                          }
                          return _pagingController!;
                        }

                        _pagingController =
                            PagingController(firstPageKey: null);
                        _pagingQuery =
                            queryBuilder(TransactionRecord.collection);
                        _pagingController!
                            .addPageRequestListener((nextPageMarker) {
                          queryTransactionRecordPage(
                            queryBuilder: (transactionRecord) =>
                                transactionRecord.where('from',
                                    isEqualTo: currentUserReference),
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
                      builderDelegate:
                          PagedChildBuilderDelegate<TransactionRecord>(
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
                          return InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'TRANSACTIONS_Container_e7dfvw89_ON_TAP');
                              logFirebaseEvent('Container_Navigate-To');

                              context.pushNamed(
                                'TransactionDetailPage',
                                queryParams: {
                                  'transaction': serializeParam(
                                    listViewTransactionRecord.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 70,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        FlutterFlowTheme.of(context).lineColor,
                                    offset: Offset(0, 1),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 5, 16, 5),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          listViewTransactionRecord.name!,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 0),
                                          child: Text(
                                            listViewTransactionRecord.createdAt!
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      listViewTransactionRecord.amount!
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
