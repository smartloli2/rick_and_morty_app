import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/core/store_providers.dart';
import 'package:rick_and_morty_app/core/widgets/loading_widget.dart';
import 'package:rick_and_morty_app/core/widgets/null_widget.dart';
import 'package:rick_and_morty_app/features/app/logic/theme_store.dart';
import 'package:rick_and_morty_app/features/home/logic/recently_viewed_characters_store.dart';
import 'package:rick_and_morty_app/features/home/presentation/common/character_horizontal_list_widget.dart';
import 'package:rick_and_morty_app/features/search/presentation/search_screen.dart';

import 'package:sizer/sizer.dart';
import 'widgets/header_widget.dart';
import 'widgets/search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    final themeStore = context.read<ThemeStore>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Observer(
            builder: (context) => IconButton(
              onPressed: () => themeStore.toggleTheme(),
              icon: themeStore.themeMode == ThemeMode.light
                  ? const FaIcon(
                      FontAwesomeIcons.solidSun,
                    )
                  : const FaIcon(
                      FontAwesomeIcons.solidMoon,
                    ),
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const HeaderWidget(),
              SizedBox(height: 2.0.h),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    SearchScreen.routeName,
                    arguments: SearchScreenArguments(
                      updateHome: () => context
                          .read<RecentlyViewedCharactersStore>()
                          .loadWidget(),
                    ),
                  );
                },
                child: const AbsorbPointer(
                  child: SearchBarWidget(),
                ),
              ),
              SizedBox(height: 10.0.h),
              Observer(builder: (context) {
                return context.read<RecentlyViewedCharactersStore>().state.map(
                      initial: (_) => const NullWidget(),
                      loading: (_) => const LoadingWidget(),
                      loaded: (state) => CharacterHorizontalListWidget(
                        characters: state.characters,
                      ),
                    );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
