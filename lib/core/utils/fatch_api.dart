import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';

Future<dynamic> fetchApi({
  required String url,
  bool? get,
  Object? params,
  Function()? onSuccess,
  Function(DioError)? onError,
  bool errorLogShow = false,
  bool showLoading = true,
  bool showErrorToast = true,
}) async {
  try {
    if (showLoading) {
      EasyLoading.show();
    }

    log("API Calling ${AppConst.baseUrl + url} --> ${params.toString()}");

    // Check internet connectivity
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      if (showErrorToast) {
        EasyLoading.showError("No Internet Connection");
      }
      return null;
    }

    var response = get == null
        ? await dio.post(
            AppConst.baseUrl + url,
            data: params,
          )
        : await dio.get(
            AppConst.baseUrl + url,
          );

    if (kDebugMode) {
      print(response.data.toString());
    }

    if (response.statusCode == 200) {
      if (response.data['status'].toString() == 'true' ||
          response.data['status'].toString() == 'success') {
        log("Got Data Successfully");

        if (showLoading) {
          EasyLoading.dismiss();
        }
        onSuccess != null ? onSuccess() : null;
        return response.data;
      } else {
        if (showErrorToast) {
          EasyLoading.showError(response.data['msg']);
        }
        return null;
      }
    } else if (response.statusCode == 401) {
      // Handle unauthorized access (status code 401)
      if (showErrorToast) {
        EasyLoading.showError("Unauthorized Access");
      }
      return null;
    } else if (response.statusCode == 403) {
      // Handle forbidden access (status code 403)
      if (showErrorToast) {
        EasyLoading.showError("Forbidden Access");
      }
      return null;
    } else if (response.statusCode == 404) {
      // Handle resource not found (status code 404)
      if (showErrorToast) {
        EasyLoading.showError("Resource Not Found");
      }
      return null;
    } else if (response.statusCode == 500) {
      // Handle internal server error (status code 500)
      if (showErrorToast) {
        EasyLoading.showError("Internal Server Error");
      }
      return null;
    } else {
      if (showErrorToast) {
        EasyLoading.showError("Didn't Get Data From API");
      }
      if (kDebugMode) {
        print(response.data.toString());
      }
      log(response.toString());
      return null;
    }
  } on DioError catch (e) {
    if (showLoading) {
      EasyLoading.dismiss();
    }
    if (onError != null) {
      onError(e);
    } else {
      if (errorLogShow) {
        EasyLoading.showError(e.toString());
        log(e.toString());
      }
    }
    return null;
  }
}
