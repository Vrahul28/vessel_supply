import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../res/routes_name/routes_name.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/rfq_card.dart';


class ActiveRfqPage extends StatefulWidget {
  const ActiveRfqPage({super.key});

  @override
  State<ActiveRfqPage> createState() => _ActiveRfqPageState();
}

class _ActiveRfqPageState extends State<ActiveRfqPage> {
  int currentNavIndex = 0;
  String _searchQuery = '';
  late TextEditingController _searchController;

  // Sample RFQ data
  final List<Map<String, dynamic>> _rfqList = [
    {
      'number': '2041',
      'department': 'Engine Dept',
      'status': RFQStatus.pending,
    },
    {
      'number': '2042',
      'department': 'Navigation Dept',
      'status': RFQStatus.accepted,
    },
    {
      'number': '2043',
      'department': 'Deck Dept',
      'status': RFQStatus.delivered,
    },
    {
      'number': '2044',
      'department': 'Galley Dept',
      'status': RFQStatus.draft,
    },
    {
      'number': '2045',
      'department': 'Engine Dept',
      'status': RFQStatus.pending,
    },
    {
      'number': '2046',
      'department': 'Electrical Dept',
      'status': RFQStatus.accepted,
    },
    {
      'number': '2047',
      'department': 'Maintenance Dept',
      'status': RFQStatus.delivered,
    },
    {
      'number': '2048',
      'department': 'Supply Dept',
      'status': RFQStatus.draft,
    },
  ];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _filteredRfqList {
    if (_searchQuery.isEmpty) {
      return _rfqList;
    }
    return _rfqList
        .where((rfq) =>
            rfq['number'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
            rfq['department']
                .toLowerCase()
                .contains(_searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F7),
      appBar: CustomAppBarActiveRFQ(
            title: 'Active RFQs',
              onBackPressed: () {
                Navigator.pop(context);
              },
              onNewPressed: () {
                Get.toNamed(RoutesName.newRequests);
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(content: Text('Create new RFQ')),
                // );
              },
            ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            // Search Bar - scrolls with the list
            SliverToBoxAdapter(
              child: CustomSearchBar(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),

            // RFQ List
            if (_filteredRfqList.isEmpty)
              SliverFillRemaining(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.inbox_outlined,
                        size: 64,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No RFQs found',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final rfq = _filteredRfqList[index];
                    return RFQCard(
                      rfqNumber: rfq['number'],
                      department: rfq['department'],
                      status: rfq['status'],
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'RFQ #${rfq['number']} selected'),
                          ),
                        );
                      },
                    );
                  },
                  childCount: _filteredRfqList.length,
                ),
              ),
          ],
        ),
      ),
    );
  }
}