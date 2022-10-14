import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CommentBottomSheetWidget extends StatefulWidget {
  const CommentBottomSheetWidget({Key? key}) : super(key: key);

  @override
  _CommentBottomSheetWidgetState createState() =>
      _CommentBottomSheetWidgetState();
}

class _CommentBottomSheetWidgetState extends State<CommentBottomSheetWidget> {
  PagingController<DocumentSnapshot?, CommentRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<VideoRecord>>(
      stream: queryVideoRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<VideoRecord> columnVideoRecordList = snapshot.data!;
        // Return an empty Container when the document does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final columnVideoRecord = columnVideoRecordList.isNotEmpty
            ? columnVideoRecordList.first
            : null;
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: Container(
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  color: Color(0xFFDBE2E7),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Comments',
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 60,
                    icon: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30,
                    ),
                    onPressed: () async {
                      context.pop();
                    },
                  ),
                ],
              ),
            ),
            PagedListView<DocumentSnapshot<Object?>?, CommentRecord>(
              pagingController: () {
                final Query<Object?> Function(Query<Object?>) queryBuilder =
                    (commentRecord) => commentRecord.where('video',
                        isEqualTo: columnVideoRecord!.reference);
                if (_pagingController != null) {
                  final query = queryBuilder(CommentRecord.collection);
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
                _pagingQuery = queryBuilder(CommentRecord.collection);
                _pagingController!.addPageRequestListener((nextPageMarker) {
                  queryCommentRecordPage(
                    queryBuilder: (commentRecord) => commentRecord.where(
                        'video',
                        isEqualTo: columnVideoRecord!.reference),
                    nextPageMarker: nextPageMarker,
                    pageSize: 1,
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
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              builderDelegate: PagedChildBuilderDelegate<CommentRecord>(
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
                  final listViewCommentRecord =
                      _pagingController!.itemList![listViewIndex];
                  return StreamBuilder<UserRecord>(
                    stream:
                        UserRecord.getDocument(listViewCommentRecord.author!),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                        );
                      }
                      final listTileUserRecord = snapshot.data!;
                      return ListTile(
                        title: Text(
                          listTileUserRecord.email!,
                          style: FlutterFlowTheme.of(context).bodyText2,
                        ),
                        subtitle: Text(
                          listViewCommentRecord.content!,
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        dense: false,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}