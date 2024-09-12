// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:pollos_digital/app/constants/constants.dart';
// import 'package:pollos_digital/app/models/hives/login.hive.dart';
// import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

// class PusherService {
//   //SERVICES
//   PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
//   final LoginHive _loginHive = LoginHive();

//   Future<void> initPusher() async {
//     await pusher.init(
//       apiKey: PUSHER_API_KEY,
//       cluster: PUSHER_CLUSTER,
//       onAuthorizer: (
//         String channelName,
//         String socketId,
//         dynamic options,
//       ) async =>
//           await onAuthorizer(channelName, socketId, options),
//     );

//     await pusher.connect();
//   }

//   dynamic onAuthorizer(
//     String channelName,
//     String socketId,
//     dynamic options,
//   ) async {
//     //@TODO: VER SE DÁ PRA MELHORAR ESSE MÉTODO
//     String token = _loginHive.getToken();
//     var authUrl = '$API_URL/broadcasting/auth';

//     var result = await http.post(
//       Uri.parse(authUrl),
//       headers: {
//         'Content-Type': 'application/x-www-form-urlencoded',
//         'Authorization': 'Bearer $token',
//       },
//       body: 'socket_id=$socketId&channel_name=$channelName',
//     );

//     var json = jsonDecode(result.body);

//     return json;
//   }

//   Future<void> subscribeTo(
//     String channelName,
//     Function(dynamic event)? onEvent,
//   ) async {
//     await pusher.subscribe(
//       channelName: channelName,
//       onEvent: onEvent,
//     );
//   }

//   Future<void> unsubscribeFrom(String channelName) async {
//     await pusher.unsubscribe(channelName: channelName);
//   }

//   Future<void> unsubscribeMany(List<String> channelNames) async {
//     for (var name in channelNames) {
//       await pusher.unsubscribe(channelName: name);
//     }
//   }

//   Future<void> closePusher() async {
//     await pusher.disconnect();
//   }
// }
