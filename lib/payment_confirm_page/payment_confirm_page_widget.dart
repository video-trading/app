import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentConfirmPageWidget extends StatefulWidget {
  const PaymentConfirmPageWidget({Key? key}) : super(key: key);

  @override
  _PaymentConfirmPageWidgetState createState() =>
      _PaymentConfirmPageWidgetState();
}

class _PaymentConfirmPageWidgetState extends State<PaymentConfirmPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
        List<VideoRecord> paymentConfirmPageVideoRecordList = snapshot.data!;
        // Return an empty Container when the document does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final paymentConfirmPageVideoRecord =
            paymentConfirmPageVideoRecordList.isNotEmpty
                ? paymentConfirmPageVideoRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        buttonSize: 46,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        icon: Icon(
                          Icons.close_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20,
                        ),
                        onPressed: () async {
                          context.pop();
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Color(0xFF4B39EF),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
                      child: Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Text(
                    'Payment Confirmed!',
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF4B39EF),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Text(
                    formatNumber(
                      paymentConfirmPageVideoRecord!.price!,
                      formatType: FormatType.custom,
                      format: 'HKD\$ ',
                      locale: '',
                    ),
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Poppins',
                          fontSize: 40,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
                  child: Text(
                    'Your payment has been confirmed, it may take 1-2 hours in order for your payment to go through and show up in your transation list.',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText2,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            context.goNamed('HomePage');
                          },
                          text: 'Go Home',
                          options: FFButtonOptions(
                            width: 230,
                            height: 50,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
