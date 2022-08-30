// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/downloads/downloads_bloc.dart' as _i11;
import '../../../application/fast_laugh/fast_laugh_bloc.dart' as _i12;
import '../../../application/new_and_hot/new_and_hot_bloc.dart' as _i9;
import '../../../application/search/search_bloc.dart' as _i10;
import '../../../infrastructure/downloads/downloads_repository.dart' as _i4;
import '../../../infrastructure/new_and_hot/new_and_hot_repository.dart' as _i6;
import '../../../infrastructure/search/search_repository.dart' as _i8;
import '../../downloads/i_downloads_fazard.dart' as _i3;
import '../../hot_and_new/new_and_hot_fazard.dart' as _i5;
import '../../search/i_search_fazard.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IDownloadsFazard>(() => _i4.DownloadsRepository());
  gh.lazySingleton<_i5.INewAndHotFazard>(() => _i6.HotAndNewRepository());
  gh.lazySingleton<_i7.ISearchFazard>(() => _i8.SearchRepository());
  gh.factory<_i9.NewAndHotBloc>(
      () => _i9.NewAndHotBloc(get<_i5.INewAndHotFazard>()));
  gh.factory<_i10.SearchBloc>(() =>
      _i10.SearchBloc(get<_i3.IDownloadsFazard>(), get<_i7.ISearchFazard>()));
  gh.factory<_i11.DownloadsBloc>(
      () => _i11.DownloadsBloc(get<_i3.IDownloadsFazard>()));
  gh.factory<_i12.FastLaughBloc>(
      () => _i12.FastLaughBloc(get<_i3.IDownloadsFazard>()));
  return get;
}
