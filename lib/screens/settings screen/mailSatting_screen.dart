// import 'package:flutter/material.dart';





// class MailMasterSettingsScreen extends StatelessWidget {
//   const MailMasterSettingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: CDrawer(),
//       appBar: cAppBar(key: key),
//       body: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ctext("Mail", fontWeight: FontWeight.w500),
//             const SizedBox(
//               height: 8,
//             ),
//             cCard(
//               border: true,
//               shadow: false,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: cTextFieldCommon(
//                   validate: () {},
//                   hint: "Enter Mail ID",
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             ctext("Mail Host", fontWeight: FontWeight.w500),
//             const SizedBox(
//               height: 8,
//             ),
//             cCard(
//               border: true,
//               shadow: false,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: cTextFieldCommon(
//                   validate: () {},
//                   hint: "Enter Mail Host ID",
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             ctext("Email/Username", fontWeight: FontWeight.w500),
//             const SizedBox(
//               height: 8,
//             ),
//             cCard(
//               border: true,
//               shadow: false,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: cTextFieldCommon(
//                   validate: () {},
//                   hint: "Enter Email/Username",
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             ctext("Mail Password", fontWeight: FontWeight.w500),
//             const SizedBox(
//               height: 8,
//             ),
//             cCard(
//               border: true,
//               shadow: false,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: cTextFieldCommon(
//                   validate: () {},
//                   hint: "Enter Mail Password",
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             ctext("Mail Port", fontWeight: FontWeight.w500),
//             const SizedBox(
//               height: 8,
//             ),
//             cCard(
//               border: true,
//               shadow: false,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: cTextFieldCommon(
//                   validate: () {},
//                   hint: "Enter Mail Port",
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             ctext("Security Type", fontWeight: FontWeight.w500),
//             const SizedBox(
//               height: 8,
//             ),
//             cDropDown(items: ["SSL", "TSL"], fillColor: Colors.white),
//             const SizedBox(
//               height: 20,
//             ),
//             cButton("Submit", width: 100)
//           ],
//         ),
//       ),
//     );
//   }
// }
