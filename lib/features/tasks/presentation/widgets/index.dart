import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:seysmoprognoz/core/config/constants.dart';
import 'package:seysmoprognoz/core/config/extensions.dart';
import 'package:seysmoprognoz/core/config/input_styles.dart';
import 'package:seysmoprognoz/core/cubit/quake_params_cubit.dart';
import 'package:seysmoprognoz/core/cubit/theme_context.dart';
import 'package:seysmoprognoz/core/entities/barrel.dart';
import 'package:seysmoprognoz/core/entities/preview_entity.dart';
import 'package:seysmoprognoz/core/widgets/barrel.dart';
import 'package:seysmoprognoz/core/widgets/index.dart';

import '../pages/index.dart';
import 'custom_track_shape.dart';

part 'preview_single_item.dart';
part 'task_card.dart';
part 'task_preview_top.dart';
part 'task_form.dart';
part 'tasks_bottom.dart';
