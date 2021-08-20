import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/core/widgets/loading_widget.dart';
import 'package:rick_and_morty_app/core/widgets/null_widget.dart';
import 'package:rick_and_morty_app/data/db/models/types/show_mode_type.dart';
import 'package:rick_and_morty_app/domain/entities/app_settings.dart';
import 'package:rick_and_morty_app/features/search/logic/settings/settings_store.dart';

class AppSettingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Observer(
          builder: (context) {
            return context.read<SettingsStore>().state.map(
                initial: (_) => const NullWidget(),
                loading: (_) => const LoadingWidget(),
                loaded: (state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: const Text('Show results as grid'),
                        leading: Radio<ShowModeType>(
                          value: ShowModeType.grid,
                          groupValue: state.appSettings.showModeType,
                          onChanged: (ShowModeType? value) {
                            if (value != null) {
                              _updateSettings(
                                context,
                                state.appSettings.copyWith(showModeType: value),
                              );
                            }
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Show results as list'),
                        leading: Radio<ShowModeType>(
                          value: ShowModeType.list,
                          groupValue: state.appSettings.showModeType,
                          onChanged: (ShowModeType? value) {
                            if (value != null) {
                              _updateSettings(
                                context,
                                state.appSettings.copyWith(showModeType: value),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  );
                });
          },
        ),
      );

  void _updateSettings(
    BuildContext context,
    AppSettings newSettings,
  ) =>
      context.read<SettingsStore>().updateSettings(newSettings);
}
