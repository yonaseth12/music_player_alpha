import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_player_alpha/pages/albumView.dart';
import 'package:provider/provider.dart';

class AlbumCard extends StatelessWidget {
  AlbumCard({
    super.key, required String this.cover_image, required String this.cover_text
  });
  String cover_image = '';
  String cover_text = '';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<SelectedAlbumProvider>().changeAlbum(newSelectedAlbum: 'assets/$cover_image');
        context.push('/album_view');
        },
      child: Row(
        children: [
          Column(children: [
            Image.asset('assets/$cover_image',
                width: 120, 
                height: 120,
                fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text("$cover_text",
                style: TextStyle(color: Colors.white)),
          ]),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}


class SubAlbumCard extends StatelessWidget {
  String cover_image = '';
  String cover_label = '';
  SubAlbumCard({super.key, required this.cover_image, required this.cover_label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 170,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(6),
          ),
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              Image.asset('assets/$cover_image.jpg',
              width: 48,
              height: 48,
              ),
              SizedBox(width: 8),
              Text(cover_label),
            ],
          ),
        ),
      ],
    );
  }
}


class SongCard extends StatelessWidget {
  String songCard_image = '';
  String songCard_label = '';
  SongCard({super.key, required this.songCard_image, required this.songCard_label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140, 
      child: Padding(
        padding: EdgeInsets.only(left: 14, right: 4),
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/$songCard_image.jpg'),
              width: 140,
              height: 140,
              ),
            SizedBox(height: 4),
            Text(
              songCard_label,
              style: Theme.of(context).textTheme.bodySmall,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
        
            ),
          ],),
      ),
    );
  }
}