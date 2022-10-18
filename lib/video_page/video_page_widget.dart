import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/comment_bottom_sheet_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoPageWidget extends StatefulWidget {
  const VideoPageWidget({
    Key? key,
    this.id,
  }) : super(key: key);

  final DocumentReference? id;

  @override
  _VideoPageWidgetState createState() => _VideoPageWidgetState();
}

class _VideoPageWidgetState extends State<VideoPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'VideoPage'});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<VideoRecord>(
      stream: VideoRecord.getDocument(widget.id!),
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
        final videoPageVideoRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                logFirebaseEvent('VIDEO_PAGE_PAGE_Icon_gyiadnrv_ON_TAP');
                logFirebaseEvent('Icon_navigate_back');
                context.pop();
              },
              child: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 32,
              ),
            ),
            title: Text(
              videoPageVideoRecord.title!,
              style: FlutterFlowTheme.of(context).title2,
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowVideoPlayer(
                            path: videoPageVideoRecord.video!,
                            videoType: VideoType.network,
                            autoPlay: false,
                            looping: false,
                            showControls: true,
                            allowFullScreen: true,
                            allowPlaybackSpeedMenu: false,
                            lazyLoad: true,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                videoPageVideoRecord.title!,
                                style: FlutterFlowTheme.of(context).title2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                dateTimeFormat(
                                  'relative',
                                  videoPageVideoRecord.createdAt!,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                videoPageVideoRecord.description!,
                                style: FlutterFlowTheme.of(context).bodyText2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 60,
                                icon: Icon(
                                  Icons.thumb_up,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 30,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                              Text(
                                formatNumber(
                                  videoPageVideoRecord.likes!,
                                  formatType: FormatType.compact,
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 60,
                                icon: Icon(
                                  Icons.thumb_down,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 30,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'xid9vx36' /* Dislike */,
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (videoPageVideoRecord.owner !=
                                currentUserReference)
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'VIDEO_PAGE_PAGE_PURCHASE_BTN_ON_TAP');
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed(
                                      'PaymentPage',
                                      queryParams: {
                                        'video': serializeParam(
                                          videoPageVideoRecord.reference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: formatNumber(
                                    videoPageVideoRecord.price!,
                                    formatType: FormatType.custom,
                                    format: 'HKD \$###.0#',
                                    locale: '',
                                  ),
                                  options: FFButtonOptions(
                                    height: 40,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () async {
                    logFirebaseEvent(
                        'VIDEO_PAGE_PAGE_ListTile_wuhan982_ON_TAP');
                    logFirebaseEvent('ListTile_bottom_sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: CommentBottomSheetWidget(),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  child: ListTile(
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'p6jhmf1e' /* Comments */,
                      ),
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        '9ztnbda9' /* view all comments */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20,
                    ),
                    tileColor: Color(0x00F5F5F5),
                    dense: false,
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () async {
                    logFirebaseEvent(
                        'VIDEO_PAGE_PAGE_ListTile_6bszclqz_ON_TAP');
                    logFirebaseEvent('ListTile_navigate_to');

                    context.pushNamed(
                      'VideoTradingHistoryPage',
                      queryParams: {
                        'video': serializeParam(
                          videoPageVideoRecord.reference,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                    );
                  },
                  child: ListTile(
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'c8cgf2jr' /* Transactions */,
                      ),
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        'gvxb1pia' /* view all transactions */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20,
                    ),
                    tileColor: Color(0x00F5F5F5),
                    dense: false,
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        );
      },
    );
  }
}
