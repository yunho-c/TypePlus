import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchWorkerProvider = Provider((ref) => SearchWorker());

class SearchWorker {
  Future<List<String>> performSearch(String query) async {
    return Future.delayed(const Duration(milliseconds: 500), () {
      return ['Result 1 for "$query"', 'Result 2 for "$query"'];
    });
  }
}
