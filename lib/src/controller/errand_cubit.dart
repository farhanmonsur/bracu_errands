import 'package:bloc/bloc.dart';
import 'package:bracu_errands/src/model/failure/failure.dart';
import 'package:bracu_errands/src/respository/i_errand_repository.dart';
import 'package:bracu_errands/src/respository/utils/logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:bracu_errands/src/model/errand.dart';

part 'errand_state.dart';
part 'errand_cubit.freezed.dart';

@injectable
class ErrandCubit extends Cubit<ErrandState> {
  ErrandCubit(this._errandRepository) : super(ErrandState.initial());

  final IErrandRepository _errandRepository;

  Future<void> fetchErrands() async {
    emit(state.copyWith(loading: true));
    final errandListOption = await _errandRepository.getErrands();

    errandListOption.fold(
      (failure) => emit(
        state.copyWith(loading: false, errandsFailure: failure),
      ),
      (errandList) => emit(
        state.copyWith(
            loading: false,
            errands: errandList.where((e) {
              if (!e.isActive && !e.isComplete) {
                return true;
              }
              return false;
            }).toList()),
      ),
    );
  }

  Future<void> acceptErrand(String errandId, String performerId) async {
    emit(state.copyWith(loading: true));
    final errandOption = await _errandRepository.acceptErrandById(
      errandId,
      performerId,
    );
    errandOption.fold(
      (failure) => emit(
        state.copyWith(loading: false, errandsFailure: failure),
      ),
      (errand) {
        final newList = state.errands..removeWhere((e) => e.id == errandId);
        logger.d(newList, 'newList');
        final newActiveList = state.activeErrands..add(errand);
        logger.d(newActiveList, 'newActiveList');
        emit(
          state.copyWith(
              loading: false, errands: newList, activeErrands: newActiveList),
        );
      },
    );
  }

  Future<void> completeErrand(String errandId) async {
    emit(state.copyWith(loading: true));
    final errandOption = await _errandRepository.completeErrandById(
      errandId,
    );
    errandOption.fold(
      (failure) => emit(
        state.copyWith(loading: false, errandsFailure: failure),
      ),
      (errand) {
        final newList = state.activeErrands
          ..removeWhere((e) => e.id == errandId);
        logger.d(newList, 'newList');
        emit(
          state.copyWith(loading: false, activeErrands: newList),
        );
      },
    );
  }

  Future<void> fetchErrandsByPerformerId(String performerId) async {
    emit(state.copyWith(loading: true));
    final errandListOption =
        await _errandRepository.getErrandsByPerformerId(performerId);

    errandListOption.fold(
      (failure) => emit(
        state.copyWith(loading: false, activeErrandsFailure: failure),
      ),
      (errandList) => emit(
        state.copyWith(
            loading: false,
            activeErrands: errandList.where((e) {
              if (!e.isComplete) return true;
              return false;
            }).toList()),
      ),
    );
  }

  Future<void> fetchErrandById(String errandId) async {
    emit(state.copyWith(loading: true));
    final errandOption = await _errandRepository.getErrandById(errandId);

    errandOption.fold(
      (failure) => emit(
        state.copyWith(loading: false, errandsFailure: failure),
      ),
      (errand) => emit(
        state.copyWith(loading: false, errand: errand),
      ),
    );
  }

  Future<void> postErrand(String description) async {
    emit(state.copyWith(loading: true));
    final errandOption =
        await _errandRepository.postErrand(description: description);

    errandOption.fold(
      (failure) => emit(
        state.copyWith(loading: false, errandsFailure: failure),
      ),
      (errand) => emit(
        state.copyWith(loading: false, created: true),
      ),
    );
  }
}
