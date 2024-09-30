import 'package:flutter/material.dart';
import '../../Data/Customer_model.dart';


class ItemsPage extends StatelessWidget {
  final CustomerDataModel customerData;

  ItemsPage({Key? key, required this.customerData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSection('Living Room', _buildLivingRoomItems()),
            _buildSection('Bed Room', _buildBedRoomItems()),
            _buildCustomItemsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionTile(
        title: Text(title, style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold)),
        children: items,
      ),
    );
  }

  List<Widget> _buildLivingRoomItems() {
    var furnitureInventory = customerData.items?.inventory.firstWhere(
          (inv) => inv.name.toLowerCase() == 'furniture',
      orElse: () => Inventory(id: '', order: 0, name: '', displayName: '', category: []),
    );

    var livingRoomItems = furnitureInventory?.category
        .expand((category) => category.items)
        .where((item) => item.qty > 0)
        .toList() ?? [];

    return livingRoomItems.map(_buildFurnitureItem).toList();
  }

  List<Widget> _buildBedRoomItems() {

    return [];
  }

  Widget _buildFurnitureItem(Item item) {
    IconData icon = Icons.chair_sharp;

    String details = item.type.isNotEmpty
        ? item.type.firstWhere((t) => t.selected, orElse: () => item.type.first).option
        : '';

    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(item.displayName, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(details, style: TextStyle(color: Colors.grey)),
      trailing: Text(item.qty.toString()  , style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }


  Widget _buildCustomItemsSection() {
    var customItems = customerData.items?.customItems?.items ?? [];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionTile(
        title: const Text('Custom Items', style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold)),
        children: customItems.map(_buildCustomItem).toList(),
      ),
    );
  }

  Widget _buildCustomItem(CustomItem item) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(item.itemName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),

            ],
          ),
          Row(
            children: [
              SizedBox(height: 8),
              Text(item.itemDescription),
            ],
          ),

          Row(
            children: [
              SizedBox(height: 8),
              Text('L: ${item.itemLength} ft        W: ${item.itemWidth} ft          H: ${item.itemHeight} ft'),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}





