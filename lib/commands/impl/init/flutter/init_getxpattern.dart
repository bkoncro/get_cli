import 'dart:io';

import '../../../../common/utils/logger/log_utils.dart';
import '../../../../common/utils/pubspec/pubspec_utils.dart';
import '../../../../core/internationalization.dart';
import '../../../../core/locales.g.dart';
import '../../../../core/structure.dart';
import '../../../../functions/create/create_list_directory.dart';
import '../../../../functions/create/create_main.dart';
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
    Directory(Structure.replaceAsExpected(path: 'lib/app/global_widgets')),
    Directory(Structure.replaceAsExpected(path: 'lib/app/routes')),
    Directory(Structure.replaceAsExpected(path: 'lib/app/core')),
    Directory(Structure.replaceAsExpected(path: 'lib/app/core/theme')),
    Directory(Structure.replaceAsExpected(path: 'lib/app/core/utils')),
    Directory(Structure.replaceAsExpected(path: 'lib/app/core/values')),
  ];
  GetXMainSample(isServer: isServerProject).create();
  await Future.wait([
    CreatePageCommand().execute(isInit: true),
  ]);
  createListDirectory(initialDirs);

  LogService.success(Translation(LocaleKeys.sucess_getx_pattern_generated));
}
