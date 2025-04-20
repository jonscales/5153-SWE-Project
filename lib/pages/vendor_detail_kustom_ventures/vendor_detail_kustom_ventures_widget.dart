import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'vendor_detail_kustom_ventures_model.dart';
export 'vendor_detail_kustom_ventures_model.dart';

class VendorDetailKustomVenturesWidget extends StatefulWidget {
  const VendorDetailKustomVenturesWidget({super.key});

  static String routeName = 'VendorDetailKustomVentures';
  static String routePath = '/vendorDetailKustomVentures';

  @override
  State<VendorDetailKustomVenturesWidget> createState() =>
      _VendorDetailKustomVenturesWidgetState();
}

class _VendorDetailKustomVenturesWidgetState
    extends State<VendorDetailKustomVenturesWidget> {
  late VendorDetailKustomVenturesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VendorDetailKustomVenturesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: FaIcon(
                FontAwesomeIcons.bicycle,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'Vendor Info',
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                    fontFamily: 'Inter Tight',
                    color: Color(0xFEF4F7F9),
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
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/landing_logo1.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.contain,
                        alignment: Alignment(0.0, 1.0),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, -0.94),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/KV_Logo_400x200_93a40984-3982-4d5d-b873-0fdc9ba591e2_410x.webp',
                              width: 369.8,
                              height: 92.3,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Kustom Ventures',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: 'Inter Tight',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Bikes & Gear\nMemorabilia',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Inter Tight',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Text(
                          'Booth #: 10',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter Tight',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 100.0,
                            height: 101.2,
                            constraints: BoxConstraints(
                              maxHeight: 40.0,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFF3FB205),
                              borderRadius: BorderRadius.circular(22.0),
                              border: Border.all(
                                color: Colors.transparent,
                              ),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await launchURL(
                                    'CAESwANDaEpEYjI1MFlXbHVaWEpmT1RBMWVYcGhjSE1TalFFS0RWUmxlSFJmYm14b2VHNXVhR01ZQWlJNkVpVkFESUFCQWFnQkFOSUJDZ29JZDJWaWMybDBaUXJpQVFnS0Jnai8vZnYvRDZvQ0FnZ0MrZ01BOGdVTkVna0pBQUFBQUFBQThEOGFBSW9CT2hJMENnZzJaakIxWlhsaGR4SW9LaHNLR1doMGRIQnpPaTh2ZDNkM0xtSnBhMlZ0WVhKMExtTnZiUytxQWdoa2QyVXlkSGhzTVJvQ0NBSENBUUFZQVNLaUFRcDFDaG9LQ3lJSkNRQUFBQUFBQUZsQUVnc2lDUW5Oek16TXpFeFpRQklqRWcwb0Fsb0pDUUFBQUFBQUFEWkFXZ0JpQUdvSUNnWUloZVQrK1E5eUJBb0NDQUFhRmhvSkNRQUFBQUFBQUFBQUlna0pBQUFBQUFBQUFBQWlEUklMSWdrSkFBQUFBQUFBUkVCU0FHb0pDUUFBQUFBQUFGbEFjaFlhQ1FrQUFBQUFBQUFBQUNJSkNRQUFBQUFBQUFBQStnTUE4Z1VORWdrSkFBQUFBQUFBOEQ4YUFNSUJBQT09');
                              },
                              child: Text(
                                'website\n',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      color: Color(0xFFFEFEFF),
                                      letterSpacing: 0.0,
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 12.0)),
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
