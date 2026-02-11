import 'package:get/get.dart';
import 'package:vessel_supply/Pages/active_RFQ_page.dart';
import 'package:vessel_supply/Pages/crew/crew_management_page.dart';
import 'package:vessel_supply/Pages/crew/crew_profile.dart';
import 'package:vessel_supply/Pages/deliveries_page.dart';
import 'package:vessel_supply/Pages/inventory/inventor_page.dart';
import 'package:vessel_supply/Pages/new_request_page.dart';
import 'package:vessel_supply/dashboard/dashboard.dart';


import '../../Pages/app_lock/app_lock_page.dart';
import '../../Pages/aura_dashboard/aura_dashboard_page.dart';
import '../../Pages/inventory/cleaning_rags.dart';
import '../../Pages/notification_page/notification_page.dart';
import '../../Pages/offline_storage_page.dart/offline_storage_page.dart';
import '../../Pages/security_page.dart';
import '../routes_name/routes_name.dart';

class Routes {
  static appRoutes() => [
    GetPage(
      name: RoutesName.dashboard,
      page: () => const Dashboard(),
      transitionDuration: const Duration(microseconds: 250),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.activeRFQ,
      page: () => const ActiveRfqPage(),
      transitionDuration: const Duration(microseconds: 250),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.deliveries,
      page: () => const DeliveriesPage(),
      transitionDuration: const Duration(microseconds: 250),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.newRequests,
      page: () => const NewRequestPage(),
      transitionDuration: const Duration(microseconds: 250),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.securityPage,
      page: () => const SecurityPage(),
      transitionDuration: const Duration(microseconds: 250),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.inventory,
      page: () => const InventoryPage(),
      transitionDuration: const Duration(microseconds: 250),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.crewManagement,
      page: () => const CrewManagementScreen(),
      transitionDuration: const Duration(microseconds: 250),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.crewProfile,
      page: () => const  CrewProfile(),
      transitionDuration: const Duration(microseconds: 250),
      transition: Transition.rightToLeft,
    ),
     GetPage(
      name: RoutesName.cleaningRags,
      page: () => const  CleaningRags(),
      transitionDuration: const Duration(microseconds: 250),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.offlineStoragePage,
      page: () => const  OfflineStoragePage(),
      transitionDuration: const Duration(microseconds: 250),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.notificationPage,
      page: () => const  NotificationPage(),
      transitionDuration: const Duration(microseconds: 250),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.auraDashboard,
      page: () => const  AuraDashboardPage(),
      transitionDuration: const Duration(microseconds: 250),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.appLockPage,
      page: () => const  AppLockPage(),
      transitionDuration: const Duration(microseconds: 250),
      transition: Transition.rightToLeft,
    ),
  ];
}