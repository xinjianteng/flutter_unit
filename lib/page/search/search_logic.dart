import 'package:get/get.dart';

import 'search_state.dart';

class SearchLogic extends GetxController {
  final SearchState state = SearchState();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void search() async {
    if (state.searchStr.isNotEmpty) {

    } else {}
  }
}
