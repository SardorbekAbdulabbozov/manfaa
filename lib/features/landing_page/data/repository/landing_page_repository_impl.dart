import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:manfaa/core/api_client/api_client.dart';
import 'package:manfaa/features/landing_page/data/repository/landing_page_repository.dart';

class LandingPageRepostioryImpl extends LandingPageRepostiory {
  final ApiClient _dioClient;
  final String _token = '7489517290:AAEA_70pSshe7VihaAeqnVird7h21DYoHIs';

  LandingPageRepostioryImpl({
    required ApiClient dioClient,
  }) : _dioClient = dioClient;

  @override
  Future<bool> submit2Waitlist(String contactInformation) async {
    try {
      bool isSuccess = false;
      await _dioClient.dio
          .post(
            'https://api.telegram.org/bot$_token/sendMessage',
            data: json.encode({
              'text': contactInformation,
              "chat_id": "@manfaa_waitlist",
            }),
          )
          .then((value) => isSuccess = true);

      return isSuccess;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
