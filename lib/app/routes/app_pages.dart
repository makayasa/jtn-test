import 'package:get/get.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/reports/bindings/reports_binding.dart';
import '../modules/reports/views/reports_view.dart';
import '../modules/tools/bindings/tools_binding.dart';
import '../modules/tools/views/tools_view.dart';
import '../modules/transaction/bindings/transaction_binding.dart';
import '../modules/transaction/views/transaction_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTION,
      page: () => const TransactionView(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: _Paths.REPORTS,
      page: () => const ReportsView(),
      binding: ReportsBinding(),
    ),
    GetPage(
      name: _Paths.TOOLS,
      page: () => const ToolsView(),
      binding: ToolsBinding(),
    ),
  ];
}
