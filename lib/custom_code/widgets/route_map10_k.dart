// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_flutter/google_maps_flutter.dart' as gmap;
import 'package:geolocator/geolocator.dart';
import 'dart:async';

/// 10K route widget
class RouteMap10K extends StatefulWidget {
  const RouteMap10K({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  State<RouteMap10K> createState() => _RouteMap10KState();
}

class _RouteMap10KState extends State<RouteMap10K> {
  StreamSubscription<Position>? positionStream;
  late gmap.BitmapDescriptor? customIcon;
  gmap.Marker? userLocationMarker;
  late gmap.GoogleMapController mapController;
  final gmap.LatLng _initialCenter =
      const gmap.LatLng(33.91838404142354, -98.4973221596422);

// Full route coordinates
  final List<gmap.LatLng> _routeCoordinates = [
    gmap.LatLng(33.91840581192688, -98.49734501945909),
    gmap.LatLng(33.92622396896699, -98.50375436400425),
    gmap.LatLng(33.92687063880495, -98.50453444991544),
    gmap.LatLng(33.92716795610978, -98.50521125716739),
    gmap.LatLng(33.92749531274401, -98.50662206165183),
    gmap.LatLng(33.92748083152506, -98.50749725570307),
    gmap.LatLng(33.92731976935737, -98.50839166391384),
    gmap.LatLng(33.92693065298083, -98.50968846075044),
    gmap.LatLng(33.9267987464074, -98.51115928839094),
    gmap.LatLng(33.92680552004181, -98.51172387118919),
    gmap.LatLng(33.92677543708847, -98.51181025074649),
    gmap.LatLng(33.92389885225484, -98.51189181037145),
    gmap.LatLng(33.92385395891007, -98.51205021544693),
    gmap.LatLng(33.92475238634257, -98.5124501224774),
    gmap.LatLng(33.9255764182916, -98.51284759704244),
    gmap.LatLng(33.9262794797535, -98.51315004418767),
    gmap.LatLng(33.92643515402361, -98.51329916239273),
    gmap.LatLng(33.92655939378076, -98.5135177165952),
    gmap.LatLng(33.92657090662761, -98.51414283707946),
    gmap.LatLng(33.92645022473833, -98.51423974084275),
    gmap.LatLng(33.9224861139955, -98.51236605566399),
    gmap.LatLng(33.92204217066455, -98.5122423138045),
    gmap.LatLng(33.91989490063937, -98.51179557921017),
    gmap.LatLng(33.91851815589249, -98.51165992794361),
    gmap.LatLng(33.9175943237015, -98.51129691918663),
    gmap.LatLng(33.91694004290801, -98.51168218311682),
    gmap.LatLng(33.91678703842194, -98.51169133049419),
    gmap.LatLng(33.9168372102592, -98.51249251472039),
    gmap.LatLng(33.91715296672766, -98.51243530912446),
    gmap.LatLng(33.91889755202935, -98.51233603236278),
    gmap.LatLng(33.91957891453571, -98.51271924653798),
    gmap.LatLng(33.91972325120006, -98.51342182399415),
    gmap.LatLng(33.91949158241692, -98.5145310840265),
    gmap.LatLng(33.91938051164036, -98.51498465354553),
    gmap.LatLng(33.91930874939553, -98.51583981899084),
    gmap.LatLng(33.91960451976725, -98.51586077431354),
    gmap.LatLng(33.919676525999, -98.51671722859345),
    gmap.LatLng(33.91975476340801, -98.51731917302511),
    gmap.LatLng(33.91986594303521, -98.51737354525977),
    gmap.LatLng(33.91986876701316, -98.51753165125987),
    gmap.LatLng(33.91992810195153, -98.51791524199963),
    gmap.LatLng(33.91969344366777, -98.51798567336041),
    gmap.LatLng(33.91960015156664, -98.51820361021603),
    gmap.LatLng(33.9195756000365, -98.51866603693685),
    gmap.LatLng(33.91949809298248, -98.51892992960988),
    gmap.LatLng(33.91951467037183, -98.51922163874937),
    gmap.LatLng(33.91931079011278, -98.51957159204339),
    gmap.LatLng(33.91899329804694, -98.5197034718828),
    gmap.LatLng(33.91855540916092, -98.51966756384103),
    gmap.LatLng(33.91779998212597, -98.5200868641176),
    gmap.LatLng(33.91670849614093, -98.52055254451012),
    gmap.LatLng(33.91623619101953, -98.52022035184048),
    gmap.LatLng(33.91577399841638, -98.52004078404049),
    gmap.LatLng(33.91521961092587, -98.52018589781612),
    gmap.LatLng(33.91494682816811, -98.51968817010706),
    gmap.LatLng(33.91500893843361, -98.51918524607214),
    gmap.LatLng(33.91538603265677, -98.5180741392612),
    gmap.LatLng(33.91554385463775, -98.51755950417967),
    gmap.LatLng(33.91575372021831, -98.51760283209154),
    gmap.LatLng(33.91601480187931, -98.51749274691),
    gmap.LatLng(33.91611265661136, -98.51724001134916),
    gmap.LatLng(33.91602374147537, -98.51692653803579),
    gmap.LatLng(33.91591970335887, -98.51668596837757),
    gmap.LatLng(33.91603330562283, -98.51625887330181),
    gmap.LatLng(33.916272769232, -98.51608152464061),
    gmap.LatLng(33.9165767221434, -98.5157566350678),
    gmap.LatLng(33.91678113345844, -98.51552372494145),
    gmap.LatLng(33.91664761912821, -98.51508102184428),
    gmap.LatLng(33.91643303192124, -98.514416914851),
    gmap.LatLng(33.91621452486117, -98.5139006139882),
    gmap.LatLng(33.91599552022451, -98.51351685795304),
    gmap.LatLng(33.91566615738289, -98.51330671635412),
    gmap.LatLng(33.91543575606685, -98.51327010332946),
    gmap.LatLng(33.91501310911396, -98.5131030913032),
    gmap.LatLng(33.91469896421143, -98.513011601969),
    gmap.LatLng(33.91447461295086, -98.51310158586182),
    gmap.LatLng(33.91379406231816, -98.51291039037397),
    gmap.LatLng(33.91354054954694, -98.51262785610457),
    gmap.LatLng(33.91300260421659, -98.51231843214686),
    gmap.LatLng(33.91283580681336, -98.51186311564501),
    gmap.LatLng(33.91280923504585, -98.5111339643921),
    gmap.LatLng(33.91273300289912, -98.5101144262903),
    gmap.LatLng(33.91256486538673, -98.50950981723933),
    gmap.LatLng(33.91268596781707, -98.509101319739),
    gmap.LatLng(33.91285563966632, -98.50868100838758),
    gmap.LatLng(33.91313277639122, -98.50771881370338),
    gmap.LatLng(33.9133752572645, -98.50694023568022),
    gmap.LatLng(33.9135443052926, -98.50638159955446),
    gmap.LatLng(33.91362588670589, -98.50598478146456),
    gmap.LatLng(33.91382619123227, -98.50565467439517),
    gmap.LatLng(33.91392274199642, -98.50535924429107),
    gmap.LatLng(33.91403583386637, -98.50511676371906),
    gmap.LatLng(33.91403667849753, -98.50485038217171),
    gmap.LatLng(33.91400851119057, -98.50457332501162),
    gmap.LatLng(33.91405329526894, -98.50426999697324),
    gmap.LatLng(33.91413820835729, -98.50404870059775),
    gmap.LatLng(33.91435855144807, -98.50384375090769),
    gmap.LatLng(33.9145254656485, -98.50364108556752),
    gmap.LatLng(33.91465181404173, -98.50324728328765),
    gmap.LatLng(33.91483741259881, -98.50268989108007),
    gmap.LatLng(33.91488028869107, -98.50231044013064),
    gmap.LatLng(33.91505995160927, -98.50195261907896),
    gmap.LatLng(33.91524429283639, -98.50157673822274),
    gmap.LatLng(33.91533026582333, -98.50130116669),
    gmap.LatLng(33.91547550306656, -98.50094376211128),
    gmap.LatLng(33.9156640557688, -98.50067246358289),
    gmap.LatLng(33.91592816211078, -98.50034778376164),
    gmap.LatLng(33.91603879624667, -98.50026031484435),
    gmap.LatLng(33.91613925245228, -98.50005919037181),
    gmap.LatLng(33.91620733368387, -98.49994778775938),
    gmap.LatLng(33.91640431530103, -98.4996935631892),
    gmap.LatLng(33.91651526226642, -98.49956444027335),
    gmap.LatLng(33.91656651072277, -98.49948573667925),
    gmap.LatLng(33.91663703482604, -98.49929185378532),
    gmap.LatLng(33.9166856821065, -98.49909600328499),
    gmap.LatLng(33.91676367591041, -98.49888598509263),
    gmap.LatLng(33.91692204012466, -98.49866580660897),
    gmap.LatLng(33.91714231395831, -98.4984254860638),
    gmap.LatLng(33.91734557504996, -98.4982673434961),
    gmap.LatLng(33.91755798781806, -98.4981145520834),
    gmap.LatLng(33.91769493296697, -98.49804763119413),
    gmap.LatLng(33.91836132251709, -98.4976996693385),
    gmap.LatLng(33.91859725895426, -98.49759007873519),
    gmap.LatLng(33.91896160137939, -98.49739912830422),
    gmap.LatLng(33.91922078980888, -98.49723345147038),
    gmap.LatLng(33.91936101289999, -98.49706137470906),
    gmap.LatLng(33.91958068586924, -98.49702050478953),
    gmap.LatLng(33.91982997993276, -98.49697509765322),
    gmap.LatLng(33.92026325919596, -98.49686997403602),
    gmap.LatLng(33.92070620401598, -98.49678276332963),
    gmap.LatLng(33.9208945380169, -98.49676015358024),
    gmap.LatLng(33.92117673876701, -98.49662799982556),
    gmap.LatLng(33.92125094325101, -98.49647814915667),
    gmap.LatLng(33.92141302084178, -98.49632549168915),
    gmap.LatLng(33.9215056191188, -98.4960778273774),
    gmap.LatLng(33.92150077587407, -98.4959147104264),
    gmap.LatLng(33.92158187672881, -98.49565149269863),
    gmap.LatLng(33.92182195713077, -98.49535745265136),
    gmap.LatLng(33.92200471239333, -98.49508083773702),
    gmap.LatLng(33.92200164039513, -98.49492093782273),
    gmap.LatLng(33.92199003058894, -98.4947781216118),
    gmap.LatLng(33.92184389513658, -98.49464437881552),
    gmap.LatLng(33.92169514039945, -98.49456866838011),
    gmap.LatLng(33.92164329204095, -98.49442582969537),
    gmap.LatLng(33.92173572981335, -98.49425972774664),
    gmap.LatLng(33.92194314021864, -98.49404855622072),
    gmap.LatLng(33.92194948587094, -98.49396505732796),
    gmap.LatLng(33.92193312547445, -98.49389772890072),
    gmap.LatLng(33.92195089187865, -98.49378205511765),
    gmap.LatLng(33.92205649154882, -98.49358518009346),
    gmap.LatLng(33.92174886937804, -98.49333110759686),
    gmap.LatLng(33.92142303155744, -98.49307967097641),
    gmap.LatLng(33.92045540441582, -98.49474532427891),
    gmap.LatLng(33.92101879076996, -98.49529017002529),
    gmap.LatLng(33.92046277564855, -98.4956988951309),
    gmap.LatLng(33.92019339527696, -98.49593373333896),
    gmap.LatLng(33.91993603353248, -98.4957447797859),
    gmap.LatLng(33.91947280756002, -98.4964938058127),
    gmap.LatLng(33.91844803042254, -98.49568161670422),
    gmap.LatLng(33.91780585181392, -98.49681113778446),
    gmap.LatLng(33.91392253605295, -98.4936901737898),
    gmap.LatLng(33.91320160316289, -98.49487434562633),
    gmap.LatLng(33.91542279034993, -98.49664206134192),
    gmap.LatLng(33.91562971156432, -98.49670314175175),
    gmap.LatLng(33.91585003548808, -98.49681262851696),
    gmap.LatLng(33.9163101118065, -98.49710701287877),
    gmap.LatLng(33.91666774679217, -98.49748421310568)
  ];

  @override
  void initState() {
    super.initState();
    _loadCustomMarker();
    _startLocationUpdates();
  }

  Future<void> _loadCustomMarker() async {
    customIcon = await gmap.BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(48, 48)),
      'assets/images/bike_marker.png',
    );
  }

  void _startLocationUpdates() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }
    if (permission == LocationPermission.deniedForever) return;

    final locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 500, // update every 500 meters
    );

    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      final currentLatLng = gmap.LatLng(position.latitude, position.longitude);

      setState(() {
        userLocationMarker = gmap.Marker(
          markerId: const gmap.MarkerId('user_location'),
          position: currentLatLng,
          icon: customIcon ?? gmap.BitmapDescriptor.defaultMarker,
        );
      });

      mapController.animateCamera(
        gmap.CameraUpdate.newLatLng(currentLatLng),
      );
    });
  }

  @override
  void dispose() {
    positionStream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width.toDouble(),
      height: widget.height.toDouble(),
      child: gmap.GoogleMap(
        initialCameraPosition: gmap.CameraPosition(
          target: _initialCenter,
          zoom: 13,
        ),
        onMapCreated: (gmap.GoogleMapController controller) {
          mapController = controller;
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: {
          if (userLocationMarker != null) userLocationMarker!,
        },
        polylines: {
          gmap.Polyline(
            polylineId: const gmap.PolylineId("ride_route"),
            points: _routeCoordinates,
            color: Colors.blue,
            width: 5,
          ),
        },
      ),
    );
  }
}
