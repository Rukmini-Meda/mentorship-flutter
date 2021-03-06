import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:mentorship_client/remote/repositories/auth_repository.dart';

/// Custom RequestInterceptor which adds current [User]s JWT token to every request
class AuthInterceptor extends RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    String token = await AuthRepository.instance.getToken();

    Map<String, String> headers = {"Authorization": token};

    Request authenticatedRequest = applyHeaders(request, headers);

    return authenticatedRequest;
  }
}
