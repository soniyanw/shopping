import 'package:built_collection/built_collection.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:shopping/core/services/api_services.dart';
import 'package:shopping/data/api_services_imp.dart';
import 'package:shopping/model/products.dart';
import 'package:state_notifier/state_notifier.dart';

import '../core/view_model/view_model.dart';
import '../model/app_state.dart';
import '../provider/app_state_notifier.dart';
import '../ui.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<AppViewModel, AppState>(
      create: (_) => AppViewModel(),
      child: child,
    );
  }
}

class AppViewModel extends AppStateNotifier<AppState>
    with LocatorMixin
    implements AppBaseViewModel {
  AppViewModel() : super(AppState());

  @override
  Future<void> init() async {}

  void decrement() {
    state = state.rebuild((AppStateBuilder b) => b.count = b.count! - 1);
  }

  void increment() {
    state = state.rebuild((AppStateBuilder b) => b.count = b.count! + 1);
  }

  Future<void> getproducts() async {
    APIServices imp = new APIServicesImp();
    BuiltList<Products> a = await imp.getprods();
    state = state.rebuild((p0) {
      p0.products = a.toBuilder();
    });
  }
}
