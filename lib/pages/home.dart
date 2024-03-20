import 'package:flutter/material.dart';
import 'package:music_player_alpha/components/albumCard.dart';
import 'package:music_player_alpha/navigation/bottomNavigation.dart';
 




class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //To make the background gradient color, we stack all our body on a container having only gradient background color
      body: Stack(alignment: Alignment.topLeft, children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,           //The *.5 factor ensures no component is seen at the bottom forced scrolling. At bottom, inside cover is hidden.
          color: Colors.teal[800],
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0),
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(1),
                  Colors.black.withOpacity(1),
                  Colors.black.withOpacity(1),
                ],
              ),
            ),
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recently Played',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.fontSize,
                            ),
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.history,
                              ),
                              SizedBox(width: 20),
                              Icon(
                                Icons.settings,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          AlbumCard(
                              cover_image: 'sample_cover_4.jpg',
                              cover_text: 'Best Mode'),
                          AlbumCard(
                              cover_image: 'sample_cover_5.jpg',
                              cover_text: 'Motivation Mix'),
                          AlbumCard(
                              cover_image: 'sample_cover_8.jpg',
                              cover_text: 'Top 50-Global'),
                          AlbumCard(
                              cover_image: 'sample_cover_12.jpg',
                              cover_text: 'Power Gaming'),
                          AlbumCard(
                              cover_image: 'sample_cover_14.jpg',
                              cover_text: 'Top Songs - Global'),
                          AlbumCard(
                              cover_image: 'sample_cover_16.jpg',
                              cover_text: 'Best Fit'),
                          AlbumCard(
                              cover_image: 'sample_cover_18.jpg',
                              cover_text: 'Remixes'),
                        ],
                      ),
                    ),
                    SizedBox(height: 1),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Good evening',
                              style: TextStyle(
                                fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                                )),
                          SizedBox(height: 16.0),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              height: 180,
                              child: Wrap(
                                direction: Axis.vertical,
                                spacing: 15,
                                runSpacing: 15,
                                children: [
                                  SubAlbumCard(cover_image: 'top50', cover_label: 'Top 50-Global'),
                                  SubAlbumCard(cover_image: 'sample_cover_3', cover_label: 'Top 50-US'),
                                  SubAlbumCard(cover_image: 'sample_cover_5', cover_label: 'Best Hits'),
                                  SubAlbumCard(cover_image: 'sample_cover_7', cover_label: 'Billboard Top 100'),
                                  SubAlbumCard(cover_image: 'sample_cover_13', cover_label: 'Hip Hop'),
                                  SubAlbumCard(cover_image: 'sample_cover_15', cover_label: 'Game Themes'),
                                  SubAlbumCard(cover_image: 'sample_cover_17', cover_label: 'Rock - 90s'),
                                  SubAlbumCard(cover_image: 'sample_cover_19', cover_label: 'Best of All Time'),
                                  SubAlbumCard(cover_image: 'sample_cover_20', cover_label: 'Latest Release'),
                                  
                                ],
                              ) 
                              ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Based on Your Recent Listening',
                            style: TextStyle(
                              fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          child: Row(
                            children: [
                              SongCard(songCard_image: 'sample_cover_2', songCard_label: 'Selena Gomez, Taylor Swift, Bad Bunny, Drake, Justin Bieber, ...  '),
                              SongCard(songCard_image: 'sample_cover_9', songCard_label: 'Selena Gomez, Taylor Swift, Bad Bunny, Drake, Justin Bieber, ...  '),
                              SongCard(songCard_image: 'sample_cover_10', songCard_label: 'Selena Gomez, Taylor Swift, Bad Bunny, Drake, Justin Bieber, ...  '),
                              SongCard(songCard_image: 'sample_cover_11', songCard_label: 'Selena Gomez, Taylor Swift, Bad Bunny, Drake, Justin Bieber, ...  '),
                              SongCard(songCard_image: 'sample_cover_18', songCard_label: 'Selena Gomez, Taylor Swift, Bad Bunny, Drake, Justin Bieber, ...  '),
                              SongCard(songCard_image: 'sample_cover_1', songCard_label: 'Selena Gomez, Taylor Swift, Bad Bunny, Drake, Justin Bieber, ...  '),
                              SongCard(songCard_image: 'sample_cover_5', songCard_label: 'Selena Gomez, Taylor Swift, Bad Bunny, Drake, Justin Bieber, ...  '),
                            ],
                          ),
                        ),
                        
                      ]
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Recommended Radio',
                            style: TextStyle(
                              fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          child: Row(
                            children: [
                              SongCard(songCard_image: 'sample_cover_7', songCard_label: 'Selena Gomez, Taylor Swift, Bad Bunny, Drake, Justin Bieber, ...  '),
                              SongCard(songCard_image: 'sample_cover_1', songCard_label: 'Selena Gomez, Taylor Swift, Bad Bunny, Drake, Justin Bieber, ...  '),
                              SongCard(songCard_image: 'sample_cover_6', songCard_label: 'Selena Gomez, Taylor Swift, Bad Bunny, Drake, Justin Bieber, ...  '),
                              SongCard(songCard_image: 'sample_cover_13', songCard_label: 'Selena Gomez, Taylor Swift, Bad Bunny, Drake, Justin Bieber, ...  '),
                              SongCard(songCard_image: 'sample_cover_16', songCard_label: 'Selena Gomez, Taylor Swift, Bad Bunny, Drake, Justin Bieber, ...  '),
                              SongCard(songCard_image: 'sample_cover_4', songCard_label: 'Selena Gomez, Taylor Swift, Bad Bunny, Drake, Justin Bieber, ...  '),
                              SongCard(songCard_image: 'sample_cover_8', songCard_label: 'Selena Gomez, Taylor Swift, Bad Bunny, Drake, Justin Bieber, ...  '),
                            ],
                          ),
                        ),
                        
                      ]
                    ),
                  ]),
            ),
          ),
        ),
      ]),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}