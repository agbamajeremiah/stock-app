import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'package:stock/core/dependency/injection_container.config.dart';

GetIt sl = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
@injectableInit
Future<void> configureDependencies() => $initGetIt(sl);
