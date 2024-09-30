import 'package:flutter/material.dart';
import '../../Data/Customer_model.dart';
import 'Floor_info.dart';
import 'items.dart';

class ViewDetails extends StatefulWidget {
  final CustomerDataModel customerData;

  const ViewDetails({Key? key, required this.customerData}) : super(key: key);

  @override
  State<ViewDetails> createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3,  vsync: this, );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'New Leads',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none, size: 25, color: Colors.black),
                onPressed: () {},
              ),
              Positioned(
                right: 2,
                top: 2,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 13,
                    minHeight: 13,
                  ),
                  child: const Text(
                    '99',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.search, size: 25, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.red,
            tabs: const [
              Tab(text: 'Items'),
              Tab(text: 'Floor Info'),
              Tab(text: 'Send Quote'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Passing customerData to each tab
                _buildHeaderRow(widget.customerData),
                _buildHeaderRow1(widget.customerData),
                Center(child: Text('Send Quotes info')),
                // FloorInfoPage(customerData: widget.customerData),
                // SendQuotePage(customerData: widget.customerData),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Use the data in the individual widgets/pages
Widget _buildHeaderRow(CustomerDataModel estimate) {
  return ItemsPage(customerData: estimate);
  // return ItemsPage();
}

Widget _buildHeaderRow1(CustomerDataModel estimate) {
  return FloorInfoPage(customerData: estimate,);
  // return ItemsPage();
}

// class FloorInfoPage extends StatelessWidget {
//   final CustomerDataModel customerData;
//
//   const FloorInfoPage({Key? key, required this.customerData}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Use customerData in this widget
//     return Center(
//       child: Text('Floor Info for ${customerData.name}'),
//     );
//   }
// }

// class SendQuotePage extends StatelessWidget {
//   final CustomerDataModel customerData;
//
//   const SendQuotePage({Key? key, required this.customerData}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Use customerData in this widget
//     return Center(
//       child: Text('Send Quote for ${customerData.name}'),
//     );
//   }
// }
