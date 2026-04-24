import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'bottom_nav_di.config.dart'; 

@InjectableInit(
  initializerName: 'initBottomNav',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/bottom_nav'],
)
void configureBottomNav(GetIt getIt) {
  getIt.initBottomNav();
}
