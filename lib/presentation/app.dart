import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapid_api_provider/presentation/detail.dart';
import 'package:rapid_api_provider/presentation/search.dart';
// import 'package:rapid_api_provider/infrastructure/state/app.state.dart';

import '../infrastructure/app.state.dart';

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final TextEditingController _searchCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();

    // ignore: unused_local_variable
    Provider.of<AppState>(context, listen: false).fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, state, widget) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            // elevation: 0,
            backgroundColor: Colors.amber,
            leadingWidth: 100,
            toolbarHeight: 80,
            leading: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Column(
                children: const [
                  Text(
                    "Movie",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("IMDB",
                      style: TextStyle(fontSize: 13, color: Colors.white))
                ],
              ),
            ),
            title: Container(
              height: 45,
              width: double.infinity,
              // color: Colors.white,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                    controller: _searchCtrl,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => SearchResult(
                                  text: _searchCtrl.text,
                                ),
                              ),
                            );
                            // state.fetchSearch(_searchCtrl.text);
                          }),
                    )),
              ),
            ),
          ),
          body: state.isLoading == true
              ? Center(
                  child: CircularProgressIndicator(
                      backgroundColor: Colors.white, color: Colors.amber))
              : ListView.builder(
                  itemCount: state.movies != null ? state.movies.length : 0,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: Card(
                        elevation: 20,
                        color: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/logo.jpg',
                              fit: BoxFit.contain,
                            ),
                            Column(
                              children: [
                                ListTile(
                                  // leading: Icon(Icons.arrow_drop_down_circle),
                                  title: Text(state.movies[index].title,
                                      style: TextStyle(
                                          color: Colors.blue.shade900,
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(
                                    state.movies[index].year,
                                    style: TextStyle(
                                        color: Colors.blue.shade900,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => MovieDetailPage(
                                imdbId: state.movies[index].imdbId),
                          ),
                        );
                      },
                    );
                  },
                ));
    });
  }
}
