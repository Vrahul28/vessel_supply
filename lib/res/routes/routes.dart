import 'package:get/get.dart';
import 'package:vessel_supply/Pages/active_RFQ_page.dart';
import 'package:vessel_supply/Pages/crew_management_page/view/crew_management_page.dart';
import 'package:vessel_supply/Pages/crew/view/crew_profile.dart';
import 'package:vessel_supply/Pages/deliveries_page/deliveries_tracker_page.dart';
import 'package:vessel_supply/Pages/inventory/view/inventor_page.dart';
import 'package:vessel_supply/Pages/new_request_page.dart';
import 'package:vessel_supply/dashboard/dashboard.dart';

import '../../Pages/audit_detail_page/view/audit_details_page.dart';
import '../../Pages/audit_trail_page/view/audit_trail_page.dart';
import '../../Pages/document_page/view/document_center.dart';
import '../../Pages/document_page/view/document_viewer.dart';
import '../../Pages/help_center/view/help_center_page.dart';
import '../../Pages/setting_page/view/setting_page.dart';
import '../../Pages/support_page/view/support_page.dart';
import '../../Pages/sync_logs/view/sync_logs_page.dart';
import '../../Pages/app_lock/view/app_lock_page.dart';
import '../../Pages/aura_dashboard/view/aura_dashboard_page.dart';
import '../../Pages/crew_request_page/view/crew_request_page.dart';
import '../../Pages/request_sent_page/view/request_sent_page.dart';
import '../../Pages/review_page/view/review_page.dart';
import '../../Pages/select_item_page/view/select_item_page.dart';
import '../../Pages/supplier_page/view/supplier_page.dart';
import '../../Pages/acknowlegde_delivery_page/view/acknowledge_delivery_page.dart';
import '../../Pages/delivery_tracker/view/delivery_no_page.dart';
import '../../Pages/delivery_tracker/view/delivery_tracker_page.dart';
import '../../Pages/document_page/view/document_page.dart';
import '../../Pages/cleaning_rags/view/cleaning_rags.dart';
import '../../Pages/login_page/view/login_page.dart';
import '../../Pages/notification_page/view/notification_page.dart';
import '../../Pages/offline_storage_page.dart/view/offline_storage_page.dart';
import '../../Pages/security_page/view/security_page.dart';
import '../routes_name/routes_name.dart';

class Routes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.login,
          page: () => const LoginPage(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.rightToLeft,
        ),
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
          page: () => const CrewProfile(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RoutesName.cleaningRags,
          page: () => const CleaningRags(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RoutesName.offlineStoragePage,
          page: () => const OfflineStoragePage(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RoutesName.notificationPage,
          page: () => const NotificationPage(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RoutesName.auraDashboard,
          page: () => const AuraDashboardPage(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RoutesName.appLockPage,
          page: () => const AppLockPage(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RoutesName.supplierPage,
          page: () => const SupplierPage(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RoutesName.crewRequestPage,
          page: () => const CrewRequestPage(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RoutesName.selectItemsPage,
          page: () => const SelectItemsPage(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RoutesName.reviewConfirmPage,
          page: () => const ReviewConfirmPage(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RoutesName.requestSentPage,
          page: () => const RequestSentPage(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RoutesName.settingPage,
          page: () => const SettingPage(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RoutesName.deliveryTrackerPage,
          page: () => const DeliveryTrackerPage(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RoutesName.acknowledgeDeliveryPage,
          page: () => const AcknowledgeDeliveryPage(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RoutesName.deliveryNoPage,
          page: () => const DeliveryNoPage(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RoutesName.auditTrailPage,
          page: () => const AuditTrailPage(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.rightToLeft,
        ),
         GetPage(
          name: RoutesName.auditDetailsPage,
          page: () => const AuditDetailsScreen(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.rightToLeft,
        ),
         GetPage(
          name: RoutesName.documentsPage,
          page: () => const DocumentsPage(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RoutesName.supportPage,
          page: () => const SupportPage(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RoutesName.helpCeneterPage,
          page: () => const HelpCenterPage(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RoutesName.syncPage,
          page: () => const SyncSupportLogsPage(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RoutesName.documentViwer,
          page: () => const DocumentViewer(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: RoutesName.documentCenter,
          page: () => const DocumentCenter(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.rightToLeft,
        ),
      ];
}
