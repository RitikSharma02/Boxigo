
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../../Data/Customer_model.dart';



class FloorInfoPage extends StatelessWidget {
  final CustomerDataModel customerData;

  FloorInfoPage({
    Key? key,
    required this.customerData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            _buildHouseDetailsSection(
              'Existing house details',
              customerData.old_floor_no,
              customerData.old_elevator_availability,
              customerData.packing_service,
              customerData.old_parking_distance,
              customerData.old_house_additional_info,
            ),
            SizedBox(height: 16),
            _buildHouseDetailsSection(
              'New house details',
              customerData.new_floor_no,
              customerData.new_elevator_availability,
              customerData.unpacking_service,
              customerData.new_parking_distance,
              customerData.new_house_additional_info,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHouseDetailsSection(
      String sectionTitle,
      dynamic floorNo,
      dynamic elevatorAvailable,
      dynamic serviceRequired,
      dynamic distance,
      dynamic additionalInfo,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
              ),
              child: Text(
                sectionTitle,
                style: const TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                ),
              ),
            ),
            _buildInfoRow('Floor No.', floorNo?.toString() ?? 'N/A'),
            _buildInfoRow('Elevator Available', elevatorAvailable == true ? 'Yes' : 'No'),
            _buildInfoRow(
              serviceRequired == customerData.unpacking_service ? 'Unpacking Required' : 'Packing Required',
              serviceRequired == true ? 'Yes' : 'No',
            ),
            _buildInfoRow('Distance from door to truck', '${distance?.toString() ?? 'N/A'}'),
            if (additionalInfo != null && additionalInfo.toString().isNotEmpty)
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      'Additional Information',
                      style: TextStyle( color: Colors.grey[500],fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      additionalInfo.toString(),
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
              // fontWeight: FontWeight.bold,
              color: Colors.grey[500],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}


// class FloorInfoPage extends StatelessWidget {
//   final CustomerDataModel customerData;
//
//   FloorInfoPage({
//     Key? key,
//     required this.customerData,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         // padding: EdgeInsets.only(top: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildCollapsibleSection(
//               'Existing house details',
//               customerData.old_floor_no,
//               customerData.old_elevator_availability,
//               customerData.packing_service,
//               customerData.old_parking_distance,
//               customerData.old_house_additional_info,
//             ),
//             SizedBox(height: 16),
//             _buildCollapsibleSection(
//               'New house details',
//               customerData.new_floor_no,
//               customerData.new_elevator_availability,
//               customerData.unpacking_service,
//               customerData.new_parking_distance,
//               customerData.new_house_additional_info,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   Widget _buildCollapsibleSection(
//       String sectionTitle,
//       dynamic floorNo,
//       dynamic elevatorAvailable,
//       dynamic serviceRequired,
//       dynamic distance,
//       dynamic additionalInfo,
//       ) {
//     return Container(
//       margin: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//             decoration: BoxDecoration(
//               color: Colors.grey[200],
//               borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
//             ),
//             child: Text(
//               sectionTitle,
//               style: TextStyle(
//                 color: Colors.deepOrange,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//           _buildInfoRow('Floor No.', floorNo?.toString() ?? 'N/A'),
//           _buildInfoRow('Elevator Available', elevatorAvailable == true ? 'Yes' : 'No'),
//           _buildInfoRow(
//             serviceRequired == customerData.unpacking_service ? 'Unpacking Required' : 'Packing Required',
//             serviceRequired == true ? 'Yes' : 'No',
//           ),
//           _buildInfoRow('Distance from door to truck', distance?.toString() ?? 'N/A'),
//           if (additionalInfo != null && additionalInfo.toString().isNotEmpty)
//             Padding(
//               padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Additional Information',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     additionalInfo.toString(),
//                     style: TextStyle(color: Colors.grey[700]),
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildInfoRow(String label, String value) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontWeight: FontWeight.w500,
//               color: Colors.grey[600],
//             ),
//           ),
//           Text(
//             value,
//             style: TextStyle(fontWeight: FontWeight.w500),
//           ),
//         ],
//       ),
//     );
//   }
//
//
//
//
//
//
//   // Widget _buildCollapsibleSection(
//   //     String sectionTitle,
//   //     dynamic floorNo,
//   //     dynamic elevatorAvailable,
//   //     dynamic serviceRequired,
//   //     dynamic distance,
//   //     dynamic additionalInfo,
//   //     ) {
//   //   return Container(
//   //     decoration: BoxDecoration(
//   //       color: Colors.white,
//   //       borderRadius: BorderRadius.circular(8),
//   //     ),
//   //     child: ExpansionTile(
//   //       title: Text(
//   //         sectionTitle,
//   //         style: const TextStyle(
//   //           color: Colors.deepOrange,
//   //           fontWeight: FontWeight.bold,
//   //           fontSize: 16,
//   //         ),
//   //       ),
//   //       children: [
//   //         _buildInfoRow('Floor No.', floorNo?.toString() ?? 'N/A'),
//   //         _buildInfoRow('Elevator Available', elevatorAvailable == true ? 'Yes' : 'No'),
//   //         _buildInfoRow(
//   //           serviceRequired == customerData.unpacking_service ? 'Unpacking Required' : 'Packing Required',
//   //           serviceRequired == true ? 'Yes' : 'No',
//   //         ),
//   //         _buildInfoRow('Distance from door to truck', distance?.toString() ?? 'N/A'),
//   //
//   //
//   //
//   //         if (additionalInfo != null && additionalInfo.toString().isNotEmpty)
//   //           const Padding(
//   //             padding: EdgeInsets.only(top: 8.0),
//   //             child: Text(
//   //               'Additional Information',
//   //               style: TextStyle(fontWeight: FontWeight.bold),
//   //             ),
//   //           ),
//   //         if (additionalInfo != null && additionalInfo.toString().isNotEmpty)
//   //           Padding(
//   //             padding: const EdgeInsets.only(top: 4.0),
//   //             child: Text(
//   //               additionalInfo.toString(),
//   //               style: TextStyle(color: Colors.grey[700]),
//   //             ),
//   //           ),
//   //       ],
//   //     ),
//   //   );
//   // }
//   //
//   // Widget _buildInfoRow(String label, String value) {
//   //   return Padding(
//   //     padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //       children: [
//   //         Text(
//   //           label,
//   //           style: const TextStyle(fontWeight: FontWeight.w500),
//   //         ),
//   //         Text(value),
//   //       ],
//   //     ),
//   //   );
//   // }
// }

