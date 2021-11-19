import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h1_flutter_riverpod/presentation/manager/bindings/views_state.dart';

// class to control the state, in particular to store its current value
// and increase it when the user presses the + button
class ViewsNotifier extends StateNotifier<ViewsState> {
  /// Base constructor defines inital state
  ViewsNotifier({ViewsState? initialState})
      : super(initialState ?? ViewsState.odd());

  void reset() => state = ViewsState.odd();
}
