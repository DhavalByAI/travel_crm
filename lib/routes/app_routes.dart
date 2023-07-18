import 'package:get/get.dart';
import 'package:travel_crm/screens/Tasks/tasks_bindings.dart';
import 'package:travel_crm/screens/Tasks/tasks_screen.dart';
import 'package:travel_crm/screens/bank/all%20transaction/all_transaction_bindings.dart';
import 'package:travel_crm/screens/bank/all%20transaction/all_transaction_screen.dart';
import 'package:travel_crm/screens/bank/bank_cash/bank_cash_bindings.dart';
import 'package:travel_crm/screens/bank/bank_cash/bank_cash_screen.dart';
import 'package:travel_crm/screens/bank/bank_cash/view%20transaction/view_transaction_bindings.dart';
import 'package:travel_crm/screens/bank/bank_cash/view%20transaction/view_transaction_screen.dart';
import 'package:travel_crm/screens/bank/bank_transfer/bank_transfer_bindings.dart';
import 'package:travel_crm/screens/bank/bank_transfer/bank_transfer_screen.dart';
import 'package:travel_crm/screens/bank/category/category_bindings.dart';
import 'package:travel_crm/screens/bank/category/category_screen.dart';
import 'package:travel_crm/screens/bank/expences/expences_bindings.dart';
import 'package:travel_crm/screens/bank/expences/expences_screen.dart';
import 'package:travel_crm/screens/bank/income/income_bindings.dart';
import 'package:travel_crm/screens/bank/income/income_screen.dart';
import 'package:travel_crm/screens/bank/invoice/invoice_bindings.dart';
import 'package:travel_crm/screens/bank/invoice/invoice_screen.dart';
import 'package:travel_crm/screens/customer/query_bindings.dart';
import 'package:travel_crm/screens/customer/query_screen.dart';
import 'package:travel_crm/screens/dashboard/dashboard_bindings.dart';
import 'package:travel_crm/screens/dashboard/dashboard_screen.dart';
import 'package:travel_crm/screens/itinerary/itinerary_bindings.dart';
import 'package:travel_crm/screens/login/login_bindings.dart';
import 'package:travel_crm/screens/login/login_screen.dart';
import 'package:travel_crm/screens/profile/profile_bindings.dart';
import 'package:travel_crm/screens/profile/profile_screen.dart';
import 'package:travel_crm/screens/quotation/quatation_bindings.dart';
import 'package:travel_crm/screens/quotation/quotation_screen.dart';
import 'package:travel_crm/screens/settings%20screen/driver/driver_bindings.dart';
import 'package:travel_crm/screens/settings%20screen/driver/driver_screen.dart';
import 'package:travel_crm/screens/settings%20screen/activity/activity_bindings.dart';
import 'package:travel_crm/screens/settings%20screen/activity/activity_screen.dart';
import 'package:travel_crm/screens/settings%20screen/agents/agents_bindings.dart';
import 'package:travel_crm/screens/settings%20screen/agents/agents_screen.dart';
import 'package:travel_crm/screens/settings%20screen/cabs/cabs_bindings.dart';
import 'package:travel_crm/screens/settings%20screen/cabs/cabs_screen.dart';
import 'package:travel_crm/screens/settings%20screen/destinations/destination_screen.dart';
import 'package:travel_crm/screens/settings%20screen/destinations/destinations_bindings.dart';
import 'package:travel_crm/screens/settings%20screen/hotel/hotel_bindings.dart';
import 'package:travel_crm/screens/settings%20screen/hotel/hotel_screen.dart';
import 'package:travel_crm/screens/settings%20screen/lead%20source/lead_source_bindings.dart';
import 'package:travel_crm/screens/settings%20screen/lead%20source/lead_source_screen.dart';
import 'package:travel_crm/screens/settings%20screen/meal%20plan/meal_plan_bindings.dart';
import 'package:travel_crm/screens/settings%20screen/meal%20plan/meal_plan_screen.dart';
import 'package:travel_crm/screens/settings%20screen/room%20type/room_type_bindings.dart';
import 'package:travel_crm/screens/settings%20screen/room%20type/room_type_screen.dart';
import 'package:travel_crm/screens/settings%20screen/transfer%20price/transfer_price_bindings.dart';
import 'package:travel_crm/screens/settings%20screen/transfer%20price/transfer_price_screen.dart';
import 'package:travel_crm/screens/settings%20screen/visa_extra/visa_bindings.dart';
import 'package:travel_crm/screens/settings%20screen/visa_extra/visa_screen.dart';
import '../screens/customer/sub_pages/query_view_bindings.dart';
import '../screens/customer/sub_pages/query_view_screen.dart';
import '../screens/itinerary/itinerary_screen.dart';
import '../screens/settings screen/destinationArea/destination_area_screen.dart';
import '../screens/settings screen/destinationArea/destinations_area_bindings.dart';
import '../screens/settings screen/master_settings_bindings.dart';
import '../screens/settings screen/master_settings_screen.dart';

class AppRoutes {
  static const String dashboard = "/dashboard";
  static const String query = "/query";
  static const String viewQuery = "/viewQuery";
  static const String itinerary = "/itinerary";
  static const String quotation = "/quotation";
  static const String profile = "/profile";
  static const String masterSettings = "/masterSettings";
  static const String login = "/login";
  static const String bankCashScreen = "/bankCashScreen";
  static const String categoryScreen = "/categoryScreen";
  static const String bankTransferScreen = "/bankTransferScreen";
  static const String incomeScreen = "/incomeScreen";
  static const String expenseScreen = "/expenseScreen";
  static const String tasks = "/tasks";
  static const String viewTransaction = "/viewTransaction";
  static const String allTransaction = "/allTransaction";
  static const String invoice = "/invoice";
  static const String bill = "/bill";

  static const String msAgent = "/msAgent";
  static const String msDestination = "/msDestination";
  static const String msDestinationArea = "/msDestinationArea";
  static const String msRoomType = "/msRoomType";
  static const String msMealPlan = "/msMealPlan";
  static const String msHotel = "/msHotel";
  static const String msLeadSource = "/msLeadSource";
  static const String msActivity = "/msActivity";
  static const String msVisaExtra = "/msVisaExtra";
  static const String msDriver = "/msDriver";
  static const String msCabs = "/msCabs";
  static const String msTransferPrice = "/msTransferPrice";

  static List<GetPage> pages = [
    GetPage(
        name: login, page: () => LoginScreen(), bindings: [LoginBindings()]),
    GetPage(
        name: dashboard,
        page: () => const DashBoardScreen(),
        bindings: [DashBoardBindings()]),
    GetPage(
        name: query,
        page: () => const QueryScreen(),
        bindings: [QueryBindings()]),
    GetPage(
        name: viewQuery,
        page: () => QueryViewScreen(),
        bindings: [QueryViewBindings()]),
    GetPage(
        name: itinerary,
        page: () => const ItineraryScreen(),
        bindings: [ItineraryBindings()]),
    GetPage(
        name: quotation,
        page: () => QuotationScreen(),
        bindings: [QuotationBindings()]),
    GetPage(
        name: profile,
        page: () => const ProfileScreen(),
        bindings: [ProfileBindings()]),
    GetPage(
        name: masterSettings,
        page: () => const MasterSettingsScreen(),
        bindings: [MasterSettingsBindings()]),
    GetPage(
        name: bankCashScreen,
        page: () => BankCashScreen(),
        bindings: [BankCashBindings()]),
    GetPage(
        name: tasks,
        page: () => const TaskScreen(),
        bindings: [TaskBindings()]),
    GetPage(
        name: bankTransferScreen,
        page: () => BankTransferScreen(),
        bindings: [BankTransferBindings()]),
    GetPage(
        name: categoryScreen,
        page: () => CategoryScreen(),
        bindings: [CategoryBindings()]),
    GetPage(
        name: incomeScreen,
        page: () => IncomeScreen(),
        bindings: [IncomeBindings()]),
    GetPage(
        name: expenseScreen,
        page: () => ExpencesScreen(),
        bindings: [ExpencesBindings()]),
    GetPage(name: msAgent, page: () => AgentScreen(), bindings: [
      AgentBindings(),
    ]),
    GetPage(
        name: msDestination,
        page: () => DestinationScreen(),
        bindings: [DestinationBindings()]),
    GetPage(
        name: msDestinationArea,
        page: () => DestinationAreaScreen(),
        bindings: [DestinationAreaBindings()]),
    GetPage(
        name: msRoomType,
        page: () => RoomTypeScreen(),
        bindings: [RoomTypeBindings()]),
    GetPage(
        name: msMealPlan,
        page: () => MealPlanScreen(),
        bindings: [MealPlanBindings()]),
    GetPage(
        name: msHotel, page: () => HotelScreen(), bindings: [HotelBindings()]),
    GetPage(
        name: msActivity,
        page: () => ActivityScreen(),
        bindings: [ActivityBindings()]),
    GetPage(
        name: msLeadSource,
        page: () => LeadSourceScreen(),
        bindings: [LeadSourceBindings()]),
    GetPage(
        name: msVisaExtra,
        page: () => VisaScreen(),
        bindings: [VisaBindings()]),
    GetPage(
        name: msDriver,
        page: () => DriverScreen(),
        bindings: [DriverBindings()]),
    GetPage(name: msCabs, page: () => CabsScreen(), bindings: [CabsBindings()]),
    GetPage(
        name: msTransferPrice,
        page: () => TransferPriceScreen(),
        bindings: [TransferPriceBindings()]),
    GetPage(
        name: viewTransaction,
        page: () => ViewTransactionScreen(),
        bindings: [ViewTransactionBindings()]),
    GetPage(
        name: allTransaction,
        page: () => AllTransactionScreen(),
        bindings: [AllTransactionBindings()]),
    GetPage(
        name: invoice,
        page: () => InvoiceScreen(),
        bindings: [InvoiceBindings()]),
  ];
}
