import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/core/extensions/string_extension.dart';
import 'package:rick_and_morty_app/core/log/i_log.dart';
import 'package:rick_and_morty_app/data/db/models/types/show_mode_type.dart';
import 'package:rick_and_morty_app/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/character_details/presentation/character_details_screen.dart';
import 'package:rick_and_morty_app/features/home/presentation/common/character_tile_widget.dart';
import 'package:rick_and_morty_app/features/search/logic/search_store.dart';

class CharactersWidget extends StatefulWidget {
  final List<Character> characters;
  final VoidCallback? updateHome;
  final bool isLoadingMore;
  final ShowModeType showModeType;

  const CharactersWidget({
    required this.characters,
    required this.isLoadingMore,
    required this.showModeType,
    this.updateHome,
  });

  @override
  _CharactersWidgetState createState() => _CharactersWidgetState();
}

class _CharactersWidgetState extends State<CharactersWidget> {
  final ScrollController _controller = ScrollController();

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      if (_controller.position.extentAfter == 0) {
        context.read<SearchStore>().loadMoreCharacters();
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: _handleScrollNotification,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.showModeType == ShowModeType.list)
              ListWidget(
                characters: widget.characters,
                scrollController: _controller,
                updateHome: widget.updateHome,
              ),
            if (widget.showModeType == ShowModeType.grid)
              GridWidget(
                characters: widget.characters,
                scrollController: _controller,
                updateHome: widget.updateHome,
              ),
            if (widget.isLoadingMore)
              JumpingDotsProgressIndicator(fontSize: 30),
          ],
        ),
      ),
    );
  }
}

class ListWidget extends StatelessWidget {
  final List<Character> characters;
  final ScrollController scrollController;
  final VoidCallback? updateHome;

  const ListWidget({
    required this.characters,
    required this.scrollController,
    this.updateHome,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        return const Divider(height: 1);
      },
      shrinkWrap: true,
      itemCount: characters.length,
      itemBuilder: (context, index) {
        final character = characters[index];
        return ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(
              CharacterDetailScreen.routeName,
              arguments: CharacterDetailsArguments(character: character),
            );

            context
                .read<SearchStore>()
                .cacheCharacter(character)
                .then((value) => updateHome?.call());
          },
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(character.image),
          ),
          title: Text(character.name),
          subtitle: Text(
            character.status.capitalize + ' - ' + character.species.capitalize,
          ),
        );
      },
    );
  }
}

class GridWidget extends StatelessWidget {
  final List<Character> characters;
  final ScrollController scrollController;
  final VoidCallback? updateHome;

  const GridWidget({
    required this.characters,
    required this.scrollController,
    this.updateHome,
  });

  @override
  Widget build(BuildContext context) {
    log.info('Hellow ${characters.length}');
    return GridView.builder(
      shrinkWrap: true,
      itemCount: characters.length,
      controller: scrollController,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final character = characters[index];

        return CharacterTileWidget(
          isCached: false,
          character: character,
          onTap: () {
            Navigator.of(context).pushNamed(
              CharacterDetailScreen.routeName,
              arguments: CharacterDetailsArguments(character: character),
            );

            context
                .read<SearchStore>()
                .cacheCharacter(character)
                .then((value) => updateHome?.call());
          },
        );
      },
    );
  }
}
