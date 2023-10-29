import 'package:amazon/controller/services/user_data_crud_services.dart';
import 'package:amazon/model/address_model.dart';
import 'package:flutter/material.dart';

class AddressProvider extends ChangeNotifier {
  List<AddressModel> allAddressModel = [];
  AddressModel currentSelectedAddress = AddressModel();
  bool fetchedCurrentAddress = false;
  bool fetchedAllAdresses = false;

  getAllAddress() async {
    allAddressModel = await UserDataCRUD.getAllAddress();
    fetchedAllAdresses = true;
    notifyListeners();
  }

  getCurrentSelectedAddress() async {
    currentSelectedAddress = await UserDataCRUD.getCurrentSelectedAddress();
    fetchedCurrentAddress = true;
    notifyListeners();
  }
}
