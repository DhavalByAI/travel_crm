// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travel_crm/core/utils/date_conversion.dart';
import 'package:travel_crm/core/utils/fatch_api.dart';

import '../../../core/constants/constants.dart';

class BankCashController extends GetxController {
  @override
  void onInit() {
    dataAPI(1);
    super.onInit();
  }

  int page = 1;
  int selectedQueryType = 0;
  var data;
  List bankList = [];
  List creditList = [];
  List cashList = [];

  TextEditingController bnkCardLimit = TextEditingController();
  TextEditingController bnkCurrentLimit = TextEditingController();
  TextEditingController bnkCardDueDate = TextEditingController();

  TextEditingController bnkAccountName = TextEditingController();
  TextEditingController bnkName = TextEditingController();
  TextEditingController bnkAccountNumber = TextEditingController();
  TextEditingController bnkIFSCNumber = TextEditingController();
  TextEditingController bnkOpeningBalance = TextEditingController();
  TextEditingController bnkDescription = TextEditingController();
  TextEditingController bnkOpeningDate = TextEditingController(
      text: convertDate(
          date: DateTime.now().toString(), format: DateFormat('yyyy-MM-dd')));
  int bnkstatus = 1;

  dataAPI(int pageNo) {
    fetchApi(url: "banking/list", params: {
      'page': pageNo,
      "user_id": box.get('userId'),
      "role": box.get('role')
    }).then((value) {
      data = value;
      List tmpBankList = data['data']['banks'];
      List tmpCreditList = data['data']['credit_cards'];
      List tmpCashList = data['data']['cash'];

      if (pageNo > 1) {
        (tmpBankList.isNotEmpty ||
                tmpCashList.isNotEmpty ||
                tmpCreditList.isNotEmpty)
            ? page = pageNo
            : null;
        bankList.addAll(tmpBankList);
        creditList.addAll(tmpCreditList);
        cashList.addAll(tmpCashList);
      } else {
        page = pageNo;
        bankList = tmpBankList;
        creditList = tmpCreditList;
        cashList = tmpCashList;
      }
      update();
    });
  }

  deleteAPI({required String id}) {
    fetchApi(
      url: 'banking/delete/$id}',
    ).then((value) async => await dataAPI(1));
  }

  addbank() {
    fetchApi(
      url: 'banking/add',
      params: {
        'account_type': 'Bank',
        'account_name': bnkAccountName.text,
        'bank_name': bnkName.text,
        'account_number': bnkAccountNumber.text,
        'ifsc': bnkIFSCNumber.text,
        'opening_balance': bnkOpeningBalance.text,
        'description': bnkDescription.text,
        'created_at': bnkOpeningDate.text,
        'status': bnkstatus,
        'currency': 'INR'
      },
    ).then((value) async {
      Get.back();
      await dataAPI(page);
    });
  }

  updateBank(String id_) {
    fetchApi(
      url: 'banking/update/$id_',
      params: {
        'account_type': 'Bank',
        'account_name': bnkAccountName.text,
        'bank_name': bnkName.text,
        'account_number': bnkAccountNumber.text,
        'ifsc': bnkIFSCNumber.text,
        'opening_balance': bnkOpeningBalance.text,
        'description': bnkDescription.text,
        'created_at': bnkOpeningDate.text,
        'status': bnkstatus,
        'currency': 'INR'
      },
    ).then((value) async {
      Get.back();
      await dataAPI(page);
    });
  }

  addCreditCard() {
    fetchApi(
      url: 'banking/card/add',
      params: {
        'account_type': 'Credit Card',
        'account_name': bnkAccountName.text,
        'bank_name': bnkName.text,
        'account_number': bnkAccountNumber.text,
        'card_limit': bnkCardLimit.text,
        'opening_balance': bnkCurrentLimit.text,
        'description': bnkDescription.text,
        'card_duedate': bnkCardDueDate.text,
        'created_at': bnkOpeningDate.text,
        'status': bnkstatus,
        'currency': 'INR'
      },
    ).then((value) async {
      Get.back();
      await dataAPI(page);
    });
  }

  updateCreditCard(String id_) {
    fetchApi(
      url: 'banking/card/update/$id_',
      params: {
        'account_type': 'Credit Card',
        'account_name': bnkAccountName.text,
        'bank_name': bnkName.text,
        'account_number': bnkAccountNumber.text,
        'card_limit': bnkCardLimit.text,
        'opening_balance': bnkCurrentLimit.text,
        'description': bnkDescription.text,
        'card_duedate': bnkCardDueDate.text,
        'created_at': bnkOpeningDate.text,
        'status': bnkstatus,
        'currency': 'INR'
      },
    ).then((value) async {
      Get.back();
      await dataAPI(page);
    });
  }

  updateCash(String id_) {
    fetchApi(
      url: 'banking/cash/update/$id_',
      params: {
        'account_type': 'Cash',
        'account_name': bnkAccountName.text,
        'opening_balance': bnkOpeningBalance.text,
        'description': bnkDescription.text,
        'created_at': bnkOpeningDate.text,
        'status': bnkstatus.toString(),
        'currency': 'INR'
      },
    ).then((value) async {
      Get.back();
      await dataAPI(page);
    });
  }

  addCash() {
    fetchApi(
      url: 'banking/cash/add',
      params: {
        'account_type': 'Cash',
        'account_name': bnkAccountName.text,
        'opening_balance': bnkOpeningBalance.text,
        'description': bnkDescription.text,
        'created_at': bnkOpeningDate.text,
        'status': bnkstatus.toString(),
        'currency': 'INR'
      },
    ).then((value) async {
      Get.back();
      await dataAPI(page);
    });
  }
}
