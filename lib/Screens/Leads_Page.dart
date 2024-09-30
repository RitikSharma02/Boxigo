import 'package:flutter/material.dart';
import 'Leads/New_leads.dart';

class LeadsTabNavigator extends StatelessWidget {
  const LeadsTabNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => const LeadsPage(),
        );
      },
    );
  }
}

class LeadsPage extends StatefulWidget {
  const LeadsPage({super.key});

  @override
  _LeadsPageState createState() => _LeadsPageState();
}

class _LeadsPageState extends State<LeadsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.asset(
              'images/C_logo1.png',
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: const Text(
          'Leads',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none,size: 25, color: Colors.black),
                onPressed: () {
                },
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
            icon: const Icon(Icons.search,size: 25, color: Colors.black),
            onPressed: () {
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.red,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'New'),
            Tab(text: 'Follow Up'),
            Tab(text: 'Booked'),
            Tab(text: 'In Transition'),
          ],
        ),

      ),





      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text('All Leads Content Here')),
          Center(child: NewLeads() ),
          Center(child: Text('Follow Up Leads Content Here')),
          Center(child: Text('Booked Leads Content Here')),
          Center(child: Text('In Transition Leads Content Here')),
        ],
      ),
    );
  }
}


