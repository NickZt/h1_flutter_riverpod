import 'package:freezed_annotation/freezed_annotation.dart';

part 'views_state.freezed.dart';

extension ViewsGetters on ViewsState {
  bool get isEven => this is _Even;
}

@freezed
class ViewsState with _$ViewsState {
  /// Odd/default state
  const factory ViewsState.odd() = _Odd;

  /// Data is loading state
  const factory ViewsState.even() = _Even;
}
