import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import '../../Data/Customer_Controller.dart';
import '../../Data/Customer_model.dart';
import '../Details/View_Details.dart';

class NewLeads extends StatefulWidget {
  const NewLeads({Key? key}) : super(key: key);

  @override
  _NewLeadsState createState() => _NewLeadsState();
}
class _NewLeadsState extends State<NewLeads> {
  final CustomerDataController _service = CustomerDataController();
  late Future<List<CustomerDataModel>> _futureEstimates;

  @override
  void initState() {
    super.initState();
    _futureEstimates = _service.fetchCustomerData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: FutureBuilder<List<CustomerDataModel>>(
        future: _futureEstimates,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => _buildEstimateCard(snapshot.data![index]),
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
  Widget _buildEstimateCard(CustomerDataModel estimate) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(16),
      child: IntrinsicHeight(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildDateColumn(estimate),
              Expanded(
                flex: 85,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeaderRow(estimate),
                      const SizedBox(height: 9),
                      Text(estimate.movingFrom, style:  TextStyle(fontSize: 14,color: Colors.grey.shade700)),
                      const SizedBox(height: 9),
                      _buildIconsRow(estimate),
                      const SizedBox(height: 9),
                      Text(estimate.toCity.trim(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text(estimate.movingTo, style:  TextStyle(fontSize: 14,color: Colors.grey.shade700)),
                      const SizedBox(height: 17),
                      _buildButtons( estimate),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateColumn(CustomerDataModel estimate) {
    return Container(
      width: 60,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            DateFormat('MMM').format(estimate.movingOn),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            DateFormat('dd').format(estimate.movingOn),
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          Text(
            DateFormat('hh:mm').format(estimate.movingOn),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderRow(CustomerDataModel estimate) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(estimate.fromCity.trim(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text('E${estimate.estimateId}', style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildIconsRow(CustomerDataModel estimate) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.arrow_downward, color: Colors.red),
        _buildIconWithText(Icons.home, '${estimate.propertySize}'),
        _buildIconWithText(Icons.inventory, '${estimate.totalItems} Items'),
        _buildIconWithText(Icons.archive, '20 boxes'),
        _buildIconWithText(Icons.route, '${estimate.distance} kms'),
      ],
    );
  }

  Widget _buildIconWithText(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: Colors.red, size: 20),
        SizedBox(height: 5),
        Text(text, style: TextStyle(fontSize: 11)),
      ],
    );
  }


  Widget _buildButtons(CustomerDataModel estimate) {


    return Row(
      children: [
        Expanded(
          child: ElevatedButton(

            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewDetails(customerData: estimate,)),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: const BorderSide(color: Colors.red),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // Makes the button rectangular
              ),
            ),
            child: Text('View Details',style: TextStyle(fontSize: 12,color: Colors.red),),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Handle Submit Quote
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // Makes the button rectangular
              ),
            ),
            child: const Text(
              'Submit Quote',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }



}