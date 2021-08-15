import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/data/api/models/character.dart';
import 'package:sizer/sizer.dart';

class CharacterDetailsArguments {
  final Character character;

  const CharacterDetailsArguments({
    required this.character,
  });
}

class CharacterDetailScreen extends StatelessWidget {
  static const routeName = '/character-details';

  final Character character;

  const CharacterDetailScreen({
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: Column(
        children: [
          MainCharacterInfoWidget(character),
          LocationsInfoWidget(character),
          EpisodesInfoWidget(character),
        ],
      ),
    );
  }
}

class MainCharacterInfoWidget extends StatelessWidget {
  final Character character;

  const MainCharacterInfoWidget(this.character);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 45.0.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(character.image),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Species: ${character.species}',
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Status: ${character.status}',
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Gender: ${character.gender}',
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LocationsInfoWidget extends StatelessWidget {
  final Character character;

  const LocationsInfoWidget(this.character);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class EpisodesInfoWidget extends StatelessWidget {
  final Character character;

  const EpisodesInfoWidget(this.character);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
