import "package:flutter/material.dart";
import "package:music_player_alpha/components/albumCard.dart";
import "package:go_router/go_router.dart";
import "package:provider/provider.dart";

class AlbumView extends StatefulWidget {
  const AlbumView({super.key});

  @override
  State<AlbumView> createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {

  ScrollController scrollController = ScrollController();
  double albumImageInitialSize = 240;
  double albumImageSize = 240;
  double containerHeight = 450;
  double containerInitialHeight = 450;
  double imageOpacity = 1;
  double scrolledAmount = 0;
  bool showTopBar = false;

  @override
  void initState(){
    albumImageSize = albumImageInitialSize;
    scrollController = ScrollController()..addListener((){
        albumImageSize = albumImageInitialSize - scrollController.offset * .5;
        if(albumImageSize < 0) albumImageSize = 0;
        containerHeight = containerInitialHeight - scrollController.offset * .5;
        if(containerHeight < 0) containerHeight = 0;
        imageOpacity = albumImageSize / albumImageInitialSize;
        showTopBar = scrollController.offset > 224;
        scrolledAmount = scrollController.offset;
        setState(() {});
      });
    super.initState();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          color: Colors.teal,
        ),
        SafeArea(
          child: SingleChildScrollView(
            controller: scrollController,
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  // height: 450,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin:  Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0),
                        // Colors.black.withOpacity(0),
                        Colors.black.withOpacity(1),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Container(
                      height: containerHeight,
                      child: Column(
                        children: [
                          SizedBox(height: 40),
                          Opacity(
                            opacity: imageOpacity.clamp(0, 1.0),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.8),
                                    offset: Offset(0, 10),
                                    blurRadius: 44,                         //Larger blur radius is better
                                    spreadRadius: 16,
                                  ),
                                ],
                              ),
                              child: Image(
                                image: AssetImage(context.watch<SelectedAlbumProvider>().selectedAlbumImage),            //$selected_image'),
                                width: albumImageSize,
                                height: albumImageSize,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Music Description, released in the new year",
                                  style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Image(image: AssetImage('assets/spotify_logo.png'), width: 32, height: 32,),
                                    SizedBox(width: 8),
                                    Text('Spotify'),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text("1,187,632 likes · 4m 16s", style: Theme.of(context).textTheme.bodySmall),
                                SizedBox(height: 16),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.favorite),
                                        SizedBox(width: 16),
                                        Icon(Icons.more_horiz),
                                      ],
                                    ),
                                    Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          Container(          //Green Circle with Arrow
                                            width: 56,
                                            height: 56,
                                            alignment: Alignment.center,      //Centering the arrow in the circle
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff14D860),
                                            ),
                                            child: Icon(
                                              Icons.play_arrow,
                                              size: 38,
                                            ),
                                          ),
                                          Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                            ),
                                            child: Icon(
                                              Icons.shuffle,
                                              color: Colors.black,
                                              size: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.black,
                  padding: EdgeInsets.fromLTRB(22,0,0,0),
                  width: MediaQuery.of(context).size.width,
                  // height: 700,
                  child: Column(
                    children: [
                      Text("Lorem ipsum is simple probably latin extract for placeholder There pendaco cremntops polokiris mas dos ciola di roer"),
                      SizedBox(height: 20),
                      Wrap(
                        spacing: 15,
                        runSpacing: 15,
                        clipBehavior: Clip.antiAlias,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AlbumCard(
                                  cover_image: 'sample_cover_3.jpg',
                                  cover_text: 'Best Mode'),
                              AlbumCard(
                                  cover_image: 'sample_cover_2.jpg',
                                  cover_text: 'Motivation Mix'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AlbumCard(
                                  cover_image: 'sample_cover_5.jpg',
                                  cover_text: 'Top 50-Global'),
                              AlbumCard(
                                  cover_image: 'sample_cover_12.jpg',
                                  cover_text: 'Power Gaming'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AlbumCard(
                                  cover_image: 'sample_cover_1.jpg',
                                  cover_text: 'Top Songs - Global'),
                              AlbumCard(
                                  cover_image: 'sample_cover_7.jpg',
                                  cover_text: 'Best Fit'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AlbumCard(
                                  cover_image: 'sample_cover_10.jpg',
                                  cover_text: 'Remixes'),
                              AlbumCard(
                                  cover_image: 'sample_cover_9.jpg',
                                  cover_text: 'Remixes'),
                            ],
                          ),                          
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        //App Bar
        Positioned(
          child: AnimatedOpacity(
            opacity: (scrolledAmount/200.0).clamp(0.0, 1.0),
            duration: Duration(milliseconds: 40),
            child: Container(
              color: Colors.teal,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: SafeArea(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => context.pop(),
                            icon: Icon(Icons.keyboard_arrow_left),
                          ),
                          SizedBox(width: 20,),
                          Text("Rihanna", style: Theme.of(context).textTheme.bodyMedium,),  
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],),
    );
  }
}

class SelectedAlbumProvider extends ChangeNotifier {
  String selectedAlbumImage = '';

  SelectedAlbumProvider({
    this.selectedAlbumImage = 'assets/sample_cover_12.jpg',
  });

  void changeAlbum({
    required String newSelectedAlbum,
  }) async{
    selectedAlbumImage = newSelectedAlbum;
    notifyListeners();
  }
}