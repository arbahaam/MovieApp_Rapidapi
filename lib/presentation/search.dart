import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapid_api_provider/infrastructure/app.state.dart';
import 'package:rapid_api_provider/presentation/app.dart';

import 'detail.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({
    Key key,
    this.text,
  }) : super(key: key);
  final String text;
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AppState>(context, listen: false).fetchSearch(widget.text);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, state, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            actions: [],
            backgroundColor: Colors.amber,
            title: Text(widget.text),
          ),
          body: state.isLoading == true
              ? Center(
                  child: CircularProgressIndicator(
                      backgroundColor: Colors.white, color: Colors.amber))
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount:
                        state.search != null ? state.search.search.length : 1,
                    itemBuilder: (BuildContext ctx, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MovieDetailPage(
                                      imdbId:
                                          state.search.search[index].imdbId),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 180,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: state.search.search[index].poster !=
                                            null
                                        ? NetworkImage(
                                            state.search.search[index].poster)
                                        : AssetImage("assets/logo.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                // color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MovieDetailPage(
                                            imdbId: state
                                                .search.search[index].imdbId),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 170,
                                      width: 200,
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Text(
                                              state.search.search[index].title,
                                              style: TextStyle(
                                                  color: Colors.blue.shade800,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Text(state
                                                .search.search[index].type),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: ActionChip(
                                              backgroundColor: Colors.amber,
                                              label: Text(
                                                state.search.search[index].year,
                                                style: TextStyle(
                                                    color:
                                                        Colors.blue.shade800),
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: ActionChip(
                                              backgroundColor: Colors.amber,
                                              label: Text(
                                                state.search.search[index]
                                                    .imdbId,
                                                style: TextStyle(
                                                    color:
                                                        Colors.blue.shade800),
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
