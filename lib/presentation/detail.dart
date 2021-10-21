import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapid_api_provider/infrastructure/app.state.dart';
import 'package:rapid_api_provider/infrastructure/models/best.movies.dart';
import 'package:rapid_api_provider/infrastructure/models/movie.detail.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailPage extends StatefulWidget {
  final String imdbId;
  String videoID;
  final MovieDetail m_detail;
  MovieDetailPage({
    Key key,
    this.imdbId,
    this.videoID,
    this.m_detail,
  }) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  // final state = Provider.of(context,)
  // ignore: prefer_final_fields

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AppState>(context, listen: false).getMovieDetail(widget.imdbId);
  }

// Added new line comment
// Second line comment
// third line comment
// Fourth line
// five line
// 6 line
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context, listen: false).detail;

    final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: state.youtubeTrailerKey, // id youtube video
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    return Consumer<AppState>(builder: (context, state, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[900],
          title: Text(state.detail.title),
        ),
        body: state.isLoading == true
            ? Center(
                child: CircularProgressIndicator(
                    backgroundColor: Colors.white, color: Colors.amber))
            : ListView(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.blueAccent,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InputChip(
                        backgroundColor: Colors.amber[900],
                        avatar: Icon(Icons.info, color: Colors.white),
                        label: Text(state.detail.genres[0],
                            style: TextStyle(color: Colors.white)),
                        onSelected: (bool value) {},
                      ),
                      SizedBox(width: 5),
                      state.detail.genres.length > 1
                          ? InputChip(
                              backgroundColor: Colors.amber[900],
                              avatar: Icon(Icons.info, color: Colors.white),
                              label: Text(state.detail.genres[1],
                                  style: TextStyle(color: Colors.white)),
                              onSelected: (bool value) {},
                            )
                          : SizedBox(),
                      SizedBox(width: 5),
                      state.detail.genres.length > 2
                          ? InputChip(
                              backgroundColor: Colors.amber[900],
                              avatar: Icon(Icons.info, color: Colors.white),
                              label: Text(state.detail.genres[2],
                                  style: TextStyle(color: Colors.white)),
                              onSelected: (bool value) {},
                            )
                          : SizedBox(),
                    ],
                  ),
                  ListTile(
                    title: Text("Description",
                        style: TextStyle(
                            color: Colors.amber[900],
                            fontWeight: FontWeight.bold)),
                    subtitle: Text(state.detail.description,
                        style: TextStyle(color: Colors.amber[900])),
                    leading: Icon(Icons.info, color: Colors.amber[900]),
                  ),
                  ListTile(
                    title: Text("Tagline",
                        style: TextStyle(
                            color: Colors.amber[900],
                            fontWeight: FontWeight.bold)),
                    subtitle: Text(
                        state.detail.tagline == null
                            ? ""
                            : state.detail.tagline,
                        style: TextStyle(color: Colors.amber[900])),
                    leading: Icon(Icons.tag, color: Colors.amber[900]),
                  ),
                  ListTile(
                    title: Text("Year",
                        style: TextStyle(
                            color: Colors.amber[900],
                            fontWeight: FontWeight.bold)),
                    subtitle: Text(state.detail.year,
                        style: TextStyle(color: Colors.amber[900])),
                    leading:
                        Icon(Icons.calendar_today, color: Colors.amber[900]),
                  ),
                  ListTile(
                      title: Text("Release Date",
                          style: TextStyle(
                              color: Colors.amber[900],
                              fontWeight: FontWeight.bold)),
                      subtitle: Text(state.detail.releaseDate.toString(),
                          style: TextStyle(color: Colors.amber[900])),
                      leading: Icon(Icons.calendar_view_month,
                          color: Colors.amber[900])),
                  ListTile(
                    title: Text("Raiting",
                        style: TextStyle(
                            color: Colors.amber[900],
                            fontWeight: FontWeight.bold)),
                    subtitle: Text(state.detail.imdbRating,
                        style: TextStyle(color: Colors.amber[900])),
                    leading: Icon(Icons.star, color: Colors.amber[900]),
                  ),
                  ListTile(
                    title: Text("Language",
                        style: TextStyle(
                            color: Colors.amber[900],
                            fontWeight: FontWeight.bold)),
                    subtitle: Text(state.detail.language[0],
                        style: TextStyle(color: Colors.amber[900])),
                    leading: Icon(Icons.tag, color: Colors.amber[900]),
                  ),
                ],
              ),
      );
    });
  }
}
