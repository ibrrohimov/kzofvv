import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:seysmoprognoz/core/config/extensions.dart';
import 'package:seysmoprognoz/core/cubit/language_cubit.dart';
import 'package:seysmoprognoz/core/cubit/notoification_cubit.dart';
import 'package:seysmoprognoz/core/utils/helpers.dart';
import 'package:seysmoprognoz/core/widgets/barrel.dart';
import 'package:seysmoprognoz/core/widgets/index.dart';
import 'package:seysmoprognoz/features/earthquakes/data/models/quake_model.dart';
import 'package:seysmoprognoz/features/earthquakes/presentation/pages/_index.dart';

part 'quake_card.dart';
part 'search_by_country.dart';
part 'quake_comment.dart';
