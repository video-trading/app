import '../auth/auth_util.dart';
import '../components/logo_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPageWidget extends StatefulWidget {
  const SignInPageWidget({Key? key}) : super(key: key);

  @override
  _SignInPageWidgetState createState() => _SignInPageWidgetState();
}

class _SignInPageWidgetState extends State<SignInPageWidget> {
  TextEditingController? emailAddressController;
  TextEditingController? passwordController;

  late bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'SignInPage'});
  }

  @override
  void dispose() {
    emailAddressController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 30),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          LogoWidget(),
                        ],
                      ),
                    ),
                    Text(
                      'Welcome Back!',
                      style: FlutterFlowTheme.of(context).title1,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: Text(
                        'Use the form below to access your account.',
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child: TextFormField(
                                controller: emailAddressController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Email Address',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  hintText: 'Enter your email here...',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: !passwordVisibility,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle:
                                    FlutterFlowTheme.of(context).bodyText2,
                                hintText: 'Enter your email here...',
                                hintStyle:
                                    FlutterFlowTheme.of(context).bodyText2,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16, 24, 24, 24),
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => passwordVisibility =
                                        !passwordVisibility,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    passwordVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 22,
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FFButtonWidget(
                            onPressed: () {
                              print('Button-ForgotPassword pressed ...');
                            },
                            text: 'Forgot Password?',
                            options: FFButtonOptions(
                              width: 170,
                              height: 40,
                              color: Color(0x00FFFFFF),
                              textStyle: FlutterFlowTheme.of(context).bodyText2,
                              elevation: 0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'SIGN_IN_PAGE_PAGE_Button-Login_ON_TAP');
                              logFirebaseEvent('Button-Login_Auth');
                              GoRouter.of(context).prepareAuthEvent();

                              final user = await signInWithEmail(
                                context,
                                emailAddressController!.text,
                                passwordController!.text,
                              );
                              if (user == null) {
                                return;
                              }

                              context.goNamedAuth('HomePage', mounted);
                            },
                            text: 'Login',
                            options: FFButtonOptions(
                              width: 130,
                              height: 50,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            'Use a social platform to continue',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).bodyText2,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'SIGN_IN_Container_6579oqwn_ON_TAP');
                              logFirebaseEvent('Container_Auth');
                              GoRouter.of(context).prepareAuthEvent();
                              final user = await signInWithGoogle(context);
                              if (user == null) {
                                return;
                              }

                              context.goNamedAuth('HomePage', mounted);
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primaryText,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Color(0x3314181B),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                shape: BoxShape.circle,
                              ),
                              alignment: AlignmentDirectional(0, 0),
                              child: FaIcon(
                                FontAwesomeIcons.google,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 24,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'SIGN_IN_Container_ynm17w2l_ON_TAP');
                              logFirebaseEvent('Container_Auth');
                              GoRouter.of(context).prepareAuthEvent();
                              final user = await signInWithApple(context);
                              if (user == null) {
                                return;
                              }

                              context.goNamedAuth('HomePage', mounted);
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primaryText,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Color(0x3314181B),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                shape: BoxShape.circle,
                              ),
                              alignment: AlignmentDirectional(0, 0),
                              child: FaIcon(
                                FontAwesomeIcons.apple,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 24,
                              ),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryText,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0x3314181B),
                                  offset: Offset(0, 2),
                                )
                              ],
                              shape: BoxShape.circle,
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: FaIcon(
                              FontAwesomeIcons.facebookF,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 24,
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryText,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0x3314181B),
                                  offset: Offset(0, 2),
                                )
                              ],
                              shape: BoxShape.circle,
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: Icon(
                              Icons.phone_sharp,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'SIGN_IN_CREATE_ACCOUNT_BTN_ON_TAP');
                              logFirebaseEvent('Button_Navigate-To');

                              context.pushNamed('SignUpPage');
                            },
                            text: 'Create Account',
                            options: FFButtonOptions(
                              width: 150,
                              height: 30,
                              color: Color(0x00FFFFFF),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
