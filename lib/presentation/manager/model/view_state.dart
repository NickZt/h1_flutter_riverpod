import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_state.freezed.dart';

extension ViewGetters on ViewState {
  bool get isEven => this is _Even;
}

@freezed
class ViewState with _$ViewState {
  /// Odd/default state
  const factory ViewState.odd() = _Odd;

  /// Data is loading state
  const factory ViewState.even() = _Even;
}
