import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'b_main_menu_model.dart';
export 'b_main_menu_model.dart';

class BMainMenuWidget extends StatefulWidget {
  const BMainMenuWidget({super.key});

  static String routeName = 'BMainMenu';
  static String routePath = '/bMainMenu';

  @override
  State<BMainMenuWidget> createState() => _BMainMenuWidgetState();
}

class _BMainMenuWidgetState extends State<BMainMenuWidget> {
  late BMainMenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BMainMenuModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 60.0,
            fillColor: FlutterFlowTheme.of(context).primary,
            icon: FaIcon(
              FontAwesomeIcons.bicycle,
              color: FlutterFlowTheme.of(context).info,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Main Menu',
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  fontFamily: 'Inter Tight',
                  color: Color(0xFEF4F7F9),
                  fontSize: 28.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            background: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/TINY_SUN_OVAL_MENU_ICON.png',
                fit: BoxFit.fitHeight,
                alignment: Alignment(0.0, -1.0),
              ),
            ),
          ),
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Opacity(
                opacity: 0.3,
                child: Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        Theme.of(context).brightness == Brightness.dark
                            ? 'assets/images/landing_logo1dark.png'
                            : 'assets/images/landing_logo1.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.contain,
                        alignment: Alignment(0.0, 1.0),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed(CEventsInfoMapsWidget.routeName);
                          },
                          text: 'Info & Events',
                          options: FFButtonOptions(
                            width: 250.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFFEFBC39),
                            textStyle: FlutterFlowTheme.of(context)
                                .displayLarge
                                .override(
                                  fontFamily: 'Inter Tight',
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Color(0xFFEFBC39),
                            ),
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            context
                                .pushNamed(DRegistrationChoiceWidget.routeName);
                          },
                          text: 'On Site Registration',
                          options: FFButtonOptions(
                            width: 300.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFFEF7D39),
                            textStyle: FlutterFlowTheme.of(context)
                                .displayLarge
                                .override(
                                  fontFamily: 'Inter Tight',
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Color(0xFFEF7D39),
                            ),
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed(ELoginWidget.routeName);
                          },
                          text: 'Volunteer Login',
                          options: FFButtonOptions(
                            width: 250.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFFEF5739),
                            textStyle: FlutterFlowTheme.of(context)
                                .displayLarge
                                .override(
                                  fontFamily: 'Inter Tight',
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Color(0xFFEF5739),
                            ),
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                        Divider(
                          thickness: 2.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        if (FFAppState().hasAgreedWaiver)
                          FFButtonWidget(
                            onPressed: () async {
                              currentUserLocationValue =
                                  await getCurrentUserLocation(
                                      defaultLocation: LatLng(0.0, 0.0));
                              await launchURL('tel:9402244662');
                              FFAppState().userLocation =
                                  currentUserLocationValue;
                              safeSetState(() {});
                              _model.apiResultqkb = await SagCall.call(
                                firstName: FFAppState().firstName,
                                lastName: FFAppState().lastName,
                                userLocation:
                                    FFAppState().userLocation?.toString(),
                                status: 'pending',
                              );

                              safeSetState(() {});
                            },
                            text: 'CALL SAG',
                            icon: Icon(
                              Icons.phone,
                              color: Color(0xFFF4EDED),
                              size: 50.0,
                            ),
                            options: FFButtonOptions(
                              width: 250.0,
                              height: 60.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFFEF4639),
                              textStyle: FlutterFlowTheme.of(context)
                                  .displayLarge
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Color(0xFFEFBC39),
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        Divider(
                          thickness: 2.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        Divider(
                          thickness: 2.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed(
                              ProfileWidget.routeName,
                              queryParameters: {
                                'firstName': serializeParam(
                                  FFAppState().firstName,
                                  ParamType.String,
                                ),
                                'lastName': serializeParam(
                                  FFAppState().lastName,
                                  ParamType.String,
                                ),
                                'email': serializeParam(
                                  FFAppState().email,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: 'Profile',
                          options: FFButtonOptions(
                            width: 150.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFFEF3939),
                            textStyle: FlutterFlowTheme.of(context)
                                .displayLarge
                                .override(
                                  fontFamily: 'Inter Tight',
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Color(0xFFEF3939),
                            ),
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 12.0))
                          .around(SizedBox(height: 12.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
