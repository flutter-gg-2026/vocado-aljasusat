import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'team_di.config.dart'; 

@InjectableInit(
  initializerName: 'initTeam',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/team'],
)
void configureTeam(GetIt getIt) {
  getIt.initTeam();
}
