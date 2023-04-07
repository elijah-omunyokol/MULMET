// // ignore_for_file: depend_on_referenced_packages

// import 'package:flutter/material.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';

// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Row(
//             children: [
//               InkWell(
//                 onLongPress: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const WifiScreen()),
//                   );
//                 },
//                 child: const Icon(Icons.wifi),
//               ),
//               InkWell(
//                 onLongPress: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const BluetoothScreen()),
//                   );
//                 },
//                 child: const Icon(Icons.bluetooth),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Bluetooth screen

// class BluetoothScreen extends StatelessWidget {
//   const BluetoothScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       color: Colors.lightBlue,
//       home: StreamBuilder<BluetoothState>(
//         stream: FlutterBluePlus.instance.state,
//         initialData: BluetoothState.unknown,
//         builder: (context, snapshot) {
//           final state = snapshot.data;
//           if (state == BluetoothState.on) {
//             return const FindDevicesScreen();
//           }
//           return BluetoothOffScreen(state: state);
//         },
//       ),
//     );
//   }
// }

// class BluetoothOffScreen extends StatelessWidget {
//   const BluetoothOffScreen({Key? key, required this.state}) : super(key: key);

//   final BluetoothState? state;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightBlue,
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             const Icon(
//               Icons.bluetooth_disabled,
//               size: 200.0,
//               color: Colors.white54,
//             ),
//             Text(
//               'Bluetooth Adapter is ${state != null ? state.toString().substring(15) : 'not available'}.',
//               style: Theme.of(context)
//                   .primaryTextTheme
//                   .subtitle2
//                   ?.copyWith(color: Colors.white),
//             ),
//             ElevatedButton(
//               child: const Text('TURN ON'),
//               onPressed: () => FlutterBluePlus.instance.turnOn(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class FindDevicesScreen extends StatelessWidget {
//   const FindDevicesScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Find Devices'),
//         actions: [
//           ElevatedButton(
//             child: const Text('TURN OFF'),
//             style: ElevatedButton.styleFrom(
//               primary: Colors.black,
//               onPrimary: Colors.white,
//             ),
//             onPressed: () => FlutterBluePlus.instance.turnOff(),
//           ),
//         ],
//       ),
//       body: RefreshIndicator(
//         onRefresh: () => FlutterBluePlus.instance
//             .startScan(timeout: const Duration(seconds: 4)),
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               StreamBuilder<List<BluetoothDevice>>(
//                 stream: Stream.periodic(const Duration(seconds: 2))
//                     .asyncMap((_) =>
//                         FlutterBluePlus.instance.connectedDevices),
//                 initialData: const [],
//                 builder: (context, snapshot) {
//                   final devices = snapshot.data!;
//                   if (devices.isEmpty) {
//                     return const SizedBox.shrink();
//                   }
//                   return Column(
//                     children: devices
//                         .map(
//                           (device) => const ListTile()).toList());
                           
                