// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'src/controller/auth_bloc.dart' as _i9;
import 'src/controller/errand_cubit.dart' as _i10;
import 'src/controller/login_form/login_form_bloc.dart' as _i7;
import 'src/controller/register_form/register_form_bloc.dart' as _i8;
import 'src/respository/auth_repository.dart' as _i4;
import 'src/respository/errand_repository.dart' as _i6;
import 'src/respository/i_auth_repository.dart' as _i3;
import 'src/respository/i_errand_repository.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IAuthRepository>(() => _i4.AuthRepository());
  gh.lazySingleton<_i5.IErrandRepository>(() => _i6.ErrandRepository());
  gh.factory<_i7.LoginFormBloc>(
      () => _i7.LoginFormBloc(get<_i3.IAuthRepository>()));
  gh.factory<_i8.RegisterFormBloc>(
      () => _i8.RegisterFormBloc(get<_i3.IAuthRepository>()));
  gh.factory<_i9.AuthBloc>(() => _i9.AuthBloc(get<_i3.IAuthRepository>()));
  gh.factory<_i10.ErrandCubit>(
      () => _i10.ErrandCubit(get<_i5.IErrandRepository>()));
  return get;
}
