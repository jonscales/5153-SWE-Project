import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'schedules_model.dart';
export 'schedules_model.dart';

class SchedulesWidget extends StatefulWidget {
  const SchedulesWidget({super.key});

  static String routeName = 'Schedules';
  static String routePath = '/schedules';

  @override
  State<SchedulesWidget> createState() => _SchedulesWidgetState();
}

class _SchedulesWidgetState extends State<SchedulesWidget> {
  late SchedulesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SchedulesModel());

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
            'Schedules',
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
        body: Stack(
          children: [
            Opacity(
              opacity: 0.3,
              child: Align(
                alignment: AlignmentDirectional(0.0, 1.0),
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
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.showRideTimes = !_model.showRideTimes;
                              safeSetState(() {});
                            },
                            text: 'Race & Ride Start Times',
                            icon: Icon(
                              Icons.expand_more,
                              size: 30.0,
                            ),
                            options: FFButtonOptions(
                              width: 350.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconAlignment: IconAlignment.end,
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFFEFBC39),
                              textStyle: FlutterFlowTheme.of(context)
                                  .displayLarge
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Color(0xFFEFBC39),
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (_model.showRideTimes)
                      Container(
                        width: 360.0,
                        height: 200.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                          border: Border.all(
                            color: Color(0xFFF2A506),
                            width: 4.0,
                          ),
                        ),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 350.0,
                                    height: 75.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFDBC00),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(0.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.black,
                                            borderRadius: 8.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            fillColor: Color(0x004B39EF),
                                            icon: Icon(
                                              Icons.calendar_month,
                                              color: Color(0xFF040404),
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              await launchURL(
                                                  'hthttps://www.google.com/calendar/render?action=TEMPLATE&text=Mountain%20Bike%20Races&location=Bridwell%20Ag%20Center&dates=20250822T130000Z/20250822T140000Z');
                                            },
                                          ),
                                        ),
                                        Text(
                                          'Friday 8/22\n 8 AM  Mountain Bike Races   \n Bridwell Ag Center',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                lineHeight: 1.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 350.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFDBC00),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(0.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.black,
                                            borderRadius: 8.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            fillColor: Color(0x004B39EF),
                                            icon: Icon(
                                              Icons.calendar_month,
                                              color: Color(0xFF040404),
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              await launchURL(
                                                  'https://www.google.com/calendar/render?action=TEMPLATE&text=USA%20Cycling%20Criterium&location=8th%20St%20Coffee%20House&dates=20250822T223000Z/20250822T233000Z');
                                            },
                                          ),
                                        ),
                                        Text(
                                          '5:30 PM    USA Cycling Criterium\n 8th St Coffee House',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                lineHeight: 1.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 350.0,
                                    height: 75.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFCF68107),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(0.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                    ),
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.black,
                                            borderRadius: 8.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            fillColor: Color(0x004B39EF),
                                            icon: Icon(
                                              Icons.calendar_month,
                                              color: Color(0xFF040404),
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              await launchURL(
                                                  'https://www.google.com/calendar/render?action=TEMPLATE&text=All%20Endurance%20Rides&location=Scott%20Ave&dates=20250823T120500Z/20250823T130500Z');
                                            },
                                          ),
                                        ),
                                        Text(
                                          'Saturday 8/23\n7:05 AM    All Endurance Rides   \nScott Ave',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                lineHeight: 1.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 350.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFCF68107),
                                    ),
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.black,
                                            borderRadius: 8.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            fillColor: Color(0x004B39EF),
                                            icon: Icon(
                                              Icons.calendar_month,
                                              color: Color(0xFF040404),
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              await launchURL(
                                                  'https://www.google.com/calendar/render?achttps://www.google.com/calendar/render?action=TEMPLATE&text=USA%20Cycling%20Criterium&location=8th%20%26%20Travis&dates=20250823T193000Z/20250823T203000Z');
                                            },
                                          ),
                                        ),
                                        Text(
                                          '2:30 PM   USA Cycling Criterium   \n8th & Travis',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                lineHeight: 1.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 350.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFCF68107),
                                    ),
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.black,
                                            borderRadius: 8.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            fillColor: Color(0x004B39EF),
                                            icon: Icon(
                                              Icons.calendar_month,
                                              color: Color(0xFF040404),
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              await launchURL(
                                                  'https://www.google.com/calendar/render?action=TEMPLATE&text=Grava%20del%20Fuego&location=701%20Indiana&dates=20250824T000500Z/20250824T010500Z');
                                            },
                                          ),
                                        ),
                                        Text(
                                          '7:05 PM    Grava del Fuego    \n701 Indiana',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                lineHeight: 1.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 350.0,
                                    height: 75.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEE4A05),
                                    ),
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.black,
                                            borderRadius: 8.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            fillColor: Color(0x004B39EF),
                                            icon: Icon(
                                              Icons.calendar_month,
                                              color: Color(0xFF040404),
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              await launchURL(
                                                  'https://www.google.com/calendar/render?action=TEMPLATE&text=USA%20Cycling%20Criterium&location=8th%20%26%20Ohio%20Sts&dates=20250824T120000Z/20250824T130000Z');
                                            },
                                          ),
                                        ),
                                        Text(
                                          'Sunday 8/24\n 7 AM   USA Cycling Criterium\n8th & Ohio Sts',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 350.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEA4A05),
                                    ),
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.black,
                                            borderRadius: 8.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            fillColor: Color(0x004B39EF),
                                            icon: Icon(
                                              Icons.calendar_month,
                                              color: Color(0xFF040404),
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              await launchURL(
                                                  'https://www.google.com/calendar/render?action=TEMPLATE&text=Wee-Chi-Tah%20Trail%20Runs&location=Bridwell%20Ag%20Center&dates=20250824T120000Z/20250824T130000Z');
                                            },
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Text(
                                            ' 7 AM  Wee-Chi-Tah Trail Runs  \n Bridwell Ag Center',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  lineHeight: 1.0,
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.showEventTime = !_model.showEventTime;
                              safeSetState(() {});
                            },
                            text: 'Venue Event Times',
                            icon: Icon(
                              Icons.expand_more,
                              size: 30.0,
                            ),
                            options: FFButtonOptions(
                              width: 350.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconAlignment: IconAlignment.end,
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFFEF7D39),
                              textStyle: FlutterFlowTheme.of(context)
                                  .displayLarge
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Color(0xFFEF7D39),
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (_model.showEventTime)
                      Container(
                        width: 350.0,
                        height: 200.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                          border: Border.all(
                            color: Color(0xFFFF710B),
                            width: 4.0,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 350.0,
                                    height: 110.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xEBFF6908),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(0.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                    ),
                                    child: Text(
                                      'Thursday 8/21 MPEC\nSports Massage   3 – 8 PM \nPacket Pickup       4 – 8PM ',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    width: 350.0,
                                    height: 175.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFF4B05),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(0.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                    ),
                                    child: Text(
                                      'Friday 8/22  MPEC\nSports Massage     1 – 9 PM MPEC\nPacket Pickup        2 – 9 PM  MPEC \nFinish Line Village  3 – 9 PM\nSpaghetti Dinner    5:30 – 9 PM ',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    width: 350.0,
                                    height: 280.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF61702),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(0.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                    ),
                                    child: Text(
                                      'Saturday  8/23  \nBreakfast   5 – 8 AM  Exhibit Hall\nPacket Pickup  5:30 – 7 AM MPEC\nFlyover 7:05 AM  Start Line  \nFinish Line Village  8 AM – 4 PM\nSports Massage 9 AM – 2PM MPEC\nOutdoor Concert  10 AM – 3:30 PM  2nd & Lamar',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(2.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.showHours = !_model.showHours;
                              safeSetState(() {});
                            },
                            text: 'Consumer Show  Hours',
                            icon: Icon(
                              Icons.expand_more,
                              size: 30.0,
                            ),
                            options: FFButtonOptions(
                              width: 350.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconAlignment: IconAlignment.end,
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFFEF4A39),
                              textStyle: FlutterFlowTheme.of(context)
                                  .displayLarge
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Color(0xFFEF4A39),
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (_model.showHours)
                      Container(
                        width: 250.0,
                        height: 110.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFEF4A39),
                          borderRadius: BorderRadius.circular(22.0),
                          border: Border.all(
                            color: Color(0xFFFF3001),
                            width: 4.0,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Text(
                                'MPEC Exhibit Hall \nThurs   3 – 8 PM  \nFri      1 – 9 PM\nSat    9 AM – 2 PM',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ].divide(SizedBox(height: 5.0)).around(SizedBox(height: 5.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
