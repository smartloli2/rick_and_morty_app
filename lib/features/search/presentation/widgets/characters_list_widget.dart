import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/core/extensions/string_extension.dart';
import 'package:rick_and_morty_app/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/character_details/presentation/character_details_screen.dart';
import 'package:rick_and_morty_app/features/search/logic/search_store.dart';

class CharactersListWidget extends StatefulWidget {
  final List<Character> characters;
  final VoidCallback? updateHome;
  final bool isLoadingMore;

  const CharactersListWidget({
    required this.characters,
    required this.isLoadingMore,
    this.updateHome,
  });

  @override
  _CharactersListWidgetState createState() => _CharactersListWidgetState();
}

class _CharactersListWidgetState extends State<CharactersListWidget> {
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
            ListView.separated(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return const Divider(height: 1);
              },
              shrinkWrap: true,
              itemCount: widget.characters.length,
              itemBuilder: (context, index) {
                final character = widget.characters[index];
                return ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      CharacterDetailScreen.routeName,
                      arguments:
                          CharacterDetailsArguments(character: character),
                    );

                    context
                        .read<SearchStore>()
                        .cacheCharacter(character)
                        .then((value) => widget.updateHome?.call());
                  },
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(character.image),
                  ),
                  title: Text(character.name),
                  subtitle: Text(
                    character.status.capitalize +
                        ' - ' +
                        character.species.capitalize,
                  ),
                );
              },
            ),
            if (widget.isLoadingMore)
              JumpingDotsProgressIndicator(fontSize: 30),
          ],
        ),
      ),
    );
  }
}
