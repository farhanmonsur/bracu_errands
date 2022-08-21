part of 'errand_cubit.dart';

@freezed
class ErrandState with _$ErrandState {
  const factory ErrandState({
    required bool loading,
    required bool created,
    required List<Errand> errands,
    required List<Errand> activeErrands,
    required Failure errandsFailure,
    required Failure activeErrandsFailure,
  }) = _ErrandState;

  factory ErrandState.initial() => ErrandState(
        loading: true,
        created: false,
        errands: [],
        activeErrands: [],
        errandsFailure: Failure.none(),
        activeErrandsFailure: Failure.none(),
      );
}
