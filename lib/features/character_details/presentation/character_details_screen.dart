import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/domain/entities/character.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainCharacterInfoWidget(character),
            SizedBox(height: 2.0.h),
            LocationsInfoWidget(character),
            EpisodesInfoWidget(character),
          ],
        ),
      ),
    );
  }
}

class MainCharacterInfoWidget extends StatelessWidget {
  final Character character;

  const MainCharacterInfoWidget(this.character);

  @override
  Widget build(BuildContext context) {
    final cachedImage = character.cachedImage?.imageFile;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 45.0.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: cachedImage != null
                ? Image.file(cachedImage)
                : Image.network(character.image),
          ),
        ),
        SizedBox(width: 5.0.w),
        Expanded(
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
              const Text(
                'Race:',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              Text(
                character.species,
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              const Text(
                'Status:',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              Text(
                character.status,
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              const Text(
                'Gender:',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              Text(
                character.gender,
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LocationsInfoWidget extends StatelessWidget {
  final Character character;

  const LocationsInfoWidget(this.character);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Last known location:',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 1.0.h),
        Text(
          character.location.name,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ],
    );
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
