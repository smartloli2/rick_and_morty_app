import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/core/extensions/string_extension.dart';
import 'package:rick_and_morty_app/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/character_details/presentation/character_details_screen.dart';
import 'package:rick_and_morty_app/features/search/logic/search_store.dart';

class CharactersListWidget extends StatelessWidget {
  final List<Character> characters;
  final VoidCallback? updateHome;

  const CharactersListWidget({
    required this.characters,
    this.updateHome,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
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
