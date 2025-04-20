import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'waiver_adult_model.dart';
export 'waiver_adult_model.dart';

class WaiverAdultWidget extends StatefulWidget {
  const WaiverAdultWidget({
    super.key,
    required this.eventName,
  });

  final String? eventName;

  static String routeName = 'WaiverAdult';
  static String routePath = '/waiverAdult';

  @override
  State<WaiverAdultWidget> createState() => _WaiverAdultWidgetState();
}

class _WaiverAdultWidgetState extends State<WaiverAdultWidget> {
  late WaiverAdultModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WaiverAdultModel());

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
            'Waiver Adult',
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
          child: SingleChildScrollView(
            primary: false,
            controller: _model.columnController,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    'Scroll through the entire waiver below',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: Color(0xFFE90000),
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Container(
                  height: 400.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFE95904),
                      width: 4.0,
                    ),
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await _model.listViewController?.animateTo(
                        _model.listViewController!.position.maxScrollExtent,
                        duration: Duration(milliseconds: 10),
                        curve: Curves.ease,
                      );
                      FFAppState().hasScrolledWaiver = true;
                      safeSetState(() {});
                    },
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Text(
                          'THIS WAIVER IS A CONTRACT WITH LEGAL CONSEQUENCES. READ IT CAREFULLY BEFORE SIGNING.\n In consideration of the acceptance of my entry in the Hotter\'N Hell Hundred and/or WeeChiTah Streams & Valley\'s (an affiliate) events on Hotter\'N Hell Hundred Weekend I hereby acknowledge that I am assuming risks and agree to indemnify, not to sue and release from liability the Hotter’N Hell Hundred, its employees, volunteers, members, board, sponsors, promoters, independent contractors and affiliates (collectively releases) and that I am giving up substantial legal rights.  I have read it carefully before signing and I understand what it means and what I am agreeing to.\n     I fully realize the dangers of participating in a bicycle event and fully assume the risks associated with such participation including, by way of example, and not limitation, the following: the dangers of collision with pedestrians, vehicles, other riders, and fixed or moving objects; the dangers arising from surface hazards, equipment failure, inadequate safety equipment, weather conditions, and the releasees’ own negligence, the negligence of others; and the possibility of serious physical and/or mental trauma or injury associated with athletic cycling events. I further agree to abide by the current Center for Disease Control’s (CDC) https://www.cdc.gov/coronavirus/2019 and Wichita Health District https://tx-wichitafalls3.civicplus.com/2088/COVID-19 recommendations for the prevention of the spread of communicable diseases, and I attest to having read the CDC’s guidance. I assume all such risks being known, appreciated, and accepted by me.\n     I hereby waive, release and discharge for myself, my heirs, executors, administrators, legal representatives, assigns, and successors in interest (hereinafter collectively \"successors\") any and all rights and claims which I have or which may hereafter accrue to me against the Hotter’N Hell Hundred its employees, all volunteers, members, board, sponsors, the organizers, independent contractors, affiliates and any promoting organization(s), Medical providers, property owners, law enforcement agencies, all public entities, special districts, and properties (and their respective agents, officials, and employees) through or by which the events will be held for any and all damages which may be sustained by me directly or indirectly in connection with, or arising out of, my participation in or association with the event, or travel to or return from the event.\n     I understand that still and video images of me may be taken in conjunction with the Hotter’N Hell Hundred and agree that they may be used to promote the Hotter’N Hell Hundred and sponsors or for medical purposes.\n     Riders who are treated by medical volunteers shall have no expectation of privacy when medical care is done in an open-air tent. In addition, they shall have no expectation of consent to publish case reports and/or aggregate data in professional literature, and they consent to treatment.\n     I agree that it is my sole responsibility to be familiar with the ride course, and special rules for the event.  I understand and agree that situations may arise during the ride which may be beyond the immediate control of the ride officials or organizers, and I must continually ride so as to endanger neither others nor myself.  I accept responsibility for the condition and adequacy of my equipment. I will wear a helmet certified by ANSI, SNELL, CPSC or DOT performance tests and that can protect me against serious head injury and assume all responsibility and liability for the selection of such a helmet. I have no physical or medical condition which would endanger others or myself if I participate in this event or would interfere with my ability to participate in this event.\n     I agree, for myself and successors, that the above representations are contractually binding, and are not mere recitals, and that should I or my successors assert a claim in contravention of this agreement, I or my successors shall be liable for the expenses (including legal fees) incurred by the releasees in defending the claims.  This agreement may not be modified orally, and a waiver or modification of any provision shall not be construed as a modification of any other provision herein or as consent to any subsequent waiver or modification.  I consent to the release by any third party to releasee and insurance carriers of my name and medical information that relate solely to any injury or death I may suffer arising from this event.  Every term and provision of this contract is intended servable.  If any one or more of them is found to be unenforceable or invalid, that shall not affect the other terms and provisions which shall remain binding and enforceable.\n \nAs a parent or guardian of the above-named minor, I hereby give my permission for my child or ward to participate in the event, and further agree, individually and on behalf of my child or ward, to the terms of the above.\n\n                               TAP HERE\n',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                      controller: _model.listViewController,
                    ),
                  ),
                ),
                if (FFAppState().hasScrolledWaiver)
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Material(
                      color: Colors.transparent,
                      child: Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: CheckboxListTile(
                          value: _model.checkboxListTileValue ??= false,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.checkboxListTileValue = newValue!);
                            if (newValue!) {
                              FFAppState().hasAgreedWaiver = true;
                              safeSetState(() {});
                              FFAppState().ackWaiver = 'Y';
                              safeSetState(() {});
                            }
                          },
                          title: Text(
                            'I have read and agree to the terms above',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color: Color(0xFFFF0101),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          subtitle: Text(
                            functions.makeFullName(
                                FFAppState().firstName, FFAppState().lastName)!,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor: FlutterFlowTheme.of(context).info,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (FFAppState().hasAgreedWaiver)
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await RegisterTestUserCall.call(
                          firstName: FFAppState().firstName,
                          lastName: FFAppState().lastName,
                          email: FFAppState().email,
                          phoneNum: FFAppState().phoneNum,
                          city: FFAppState().city,
                          zipCode: FFAppState().zipCode,
                          emerContName: FFAppState().emerContName,
                          emerContPhone: FFAppState().emerContPhone,
                          ageStr: FFAppState().ageStr,
                          mainEvent: FFAppState().mainEvent,
                          subEvent: FFAppState().subEvent,
                          sex: FFAppState().sex,
                          parentName: FFAppState().parentSigning,
                          ackWaiver: '',
                        );

                        await RegisterRiderCall.call(
                          firstName: FFAppState().firstName,
                          lastName: FFAppState().lastName,
                          email: FFAppState().email,
                          phoneNum: FFAppState().phoneNum,
                          sex: FFAppState().sex,
                          zipCode: FFAppState().zipCode,
                          city: FFAppState().city,
                          emergContName: FFAppState().emerContName,
                          emergContPhone: FFAppState().emerContPhone,
                          subEvent: FFAppState().subEvent,
                          mainEvent: FFAppState().mainEvent,
                          ageStr: FFAppState().ageStr,
                        );

                        await actions.updateProfileEvents();

                        context.pushNamed(
                          PaymentPageWidget.routeName,
                          queryParameters: {
                            'eventName': serializeParam(
                              widget.eventName,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: 'Submit Registration',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF178504),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(24.0),
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
