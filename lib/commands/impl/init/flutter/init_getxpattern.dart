import 'dart:io';

import '../../../../common/utils/logger/log_utils.dart';
import '../../../../common/utils/pubspec/pubspec_utils.dart';
import '../../../../core/internationalization.dart';
import '../../../../core/locales.g.dart';
import '../../../../core/structure.dart';
import '../../../../functions/create/create_list_directory.dart';
import '../../../../functions/create/create_main.dart';
import '../../../../functions/create/create_single_file.dart';
import '../../../../samples/impl/getx_pattern/get_main.dart';
import '../../commads_export.dart';
import '../../install/install_get.dart';

Future<void> createInitGetxPattern() async {
  var canContinue = await createMain();
  if (!canContinue) return;

  var isServerProject = PubspecUtils.isServerProject;
  if (!isServerProject) {
    await installGet();
  }
  var initialDirs = [
    Directory(Structure.replaceAsExpected(path: 'lib/app/data/')),
    Directory(Structure.replaceAsExpected(path: 'lib/app/data/services')),
    Directory(Structure.replaceAsExpected(path: 'lib/app/data/models')),
    Directory(Structure.replaceAsExpected(path: 'lib/app/data/providers')),
    Directory(Structure.replaceAsExpected(path: 'lib/app/data/providers/apis')),
    Directory(Structure.replaceAsExpected(path: 'lib/app/widgets')),
    Directory(Structure.replaceAsExpected(path: 'lib/app/widgets/components')),
    Directory(Structure.replaceAsExpected(path: 'lib/app/widgets/parts')),
    Directory(Structure.replaceAsExpected(path: 'lib/app/widgets/shimmers')),
    Directory(Structure.replaceAsExpected(path: 'lib/app/widgets/dialogs')),    
    Directory(Structure.replaceAsExpected(path: 'lib/app/routes')),
    Directory(Structure.replaceAsExpected(path: 'lib/app/core')),
    Directory(Structure.replaceAsExpected(path: 'lib/app/core/configs')),
    Directory(Structure.replaceAsExpected(path: 'lib/app/core/theme')),
    Directory(Structure.replaceAsExpected(path: 'lib/app/core/utils')),
  ];
  GetXMainSample(isServer: isServerProject).create();
  await Future.wait([
    CreatePageCommand().execute(isInit: true),
  ]);
  createListDirectory(initialDirs);
  writeFile('lib/app/data/models/index.dart','');
  writeFile('lib/app/widgets/index.dart','');
  writeFile('lib/app/core/index.dart','');

  writeFile('lib/app/data/services/.gitignore','!.gitignore');
  writeFile('lib/app/data/models/.gitignore','!.gitignore');
  writeFile('lib/app/data/providers/apis/.gitignore','!.gitignore');
  writeFile('lib/app/widgets/components/.gitignore','!.gitignore');
  writeFile('lib/app/widgets/parts/.gitignore','!.gitignore');
  writeFile('lib/app/widgets/shimmers/.gitignore','!.gitignore');
  writeFile('lib/app/widgets/dialogs/.gitignore','!.gitignore');   
  writeFile('lib/app/core/configs/.gitignore','!.gitignore');
  writeFile('lib/app/core/theme/.gitignore','!.gitignore');
  writeFile('lib/app/core/utils/.gitignore','!.gitignore');
  LogService.success(Translation(LocaleKeys.sucess_getx_pattern_generated));
}
