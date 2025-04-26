import 'dart:io';

String getFriendlyErrorMessage(dynamic error) {
  if (error is SocketException) {
    return 'No internet connection. Please check your network.';
  } else if (error is HttpException) {
    return error.message;
  } else if (error.toString().contains("404")) {
    return 'The resource you requested was not found.';
  } else {
    return 'Something went wrong. Please try again.';
  }
}