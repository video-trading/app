import '../backend/backend.dart';
import '../backend/braintree/payment_manager.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({Key? key}) : super(key: key);

  @override
  _PaymentWidgetState createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  String? transactionId;
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
        List<VideoRecord> paymentVideoRecordList = snapshot.data!;
        // Return an empty Container when the document does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final paymentVideoRecord = paymentVideoRecordList.isNotEmpty
            ? paymentVideoRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 30,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'Review & Confirm',
              style: FlutterFlowTheme.of(context).subtitle1,
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                paymentVideoRecord!.title!,
                                style: FlutterFlowTheme.of(context).subtitle1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 24,
                    thickness: 2,
                    indent: 16,
                    endIndent: 16,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Rate',
                          style: FlutterFlowTheme.of(context).subtitle1,
                        ),
                        Text(
                          paymentVideoRecord!.price!.toString(),
                          style: FlutterFlowTheme.of(context).title3,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 24,
                    thickness: 2,
                    indent: 16,
                    endIndent: 16,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Text(
                        'You may see a temporary hold on your payment method in the amount of your Taskers hourly rate of \$15. You can cancel at any time. Tasks cancelled less than 24 hours before start time may be billed a cancellation fee of one our. Tasks have a one-hour minimum.',
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final transacAmount = paymentVideoRecord!.price!;
                        final transacDisplayName = paymentVideoRecord!.title;
                        if (kIsWeb) {
                          showSnackbar(
                              context, 'Payments not yet supported on web.');
                          return;
                        }

                        final dropInRequest = BraintreeDropInRequest(
                          cardEnabled: true,
                          clientToken: braintreeClientToken(),
                          collectDeviceData: true,
                          paypalRequest: BraintreePayPalRequest(
                            amount: transacAmount.toString(),
                            currencyCode: 'USD',
                            displayName: transacDisplayName,
                          ),
                        );
                        final dropInResult =
                            await BraintreeDropIn.start(dropInRequest);
                        if (dropInResult == null) {
                          return;
                        }
                        showSnackbar(
                          context,
                          'Processing payment...',
                          duration: 10,
                          loading: true,
                        );
                        final paymentResponse = await processBraintreePayment(
                          transacAmount,
                          dropInResult.paymentMethodNonce.nonce,
                          dropInResult.deviceData,
                        );
                        if (paymentResponse.errorMessage != null) {
                          showSnackbar(context,
                              'Error: ${paymentResponse.errorMessage}');
                          return;
                        }
                        showSnackbar(context, 'Success!');
                        transactionId = paymentResponse.transactionId!;

                        context.goNamed('PaymentConfirmPage');

                        setState(() {});
                      },
                      text: 'Confirm & Chat',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                        elevation: 2,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
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
  }
}
