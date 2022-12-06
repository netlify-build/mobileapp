import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/cast_card_widget.dart';
import '../components/movie_card_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetailsWidget extends StatefulWidget {
  const MovieDetailsWidget({
    Key? key,
    this.movieId,
  }) : super(key: key);

  final int? movieId;

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'MovieDetails',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: FutureBuilder<ApiCallResponse>(
                future: MovieDetailsCall.call(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }
                  final columnMovieDetailsResponse = snapshot.data!;
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 400,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: Stack(
                            children: [
                              Image.network(
                                'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2${getJsonField(
                                  columnMovieDetailsResponse.jsonBody,
                                  r'''$.backdrop_path''',
                                ).toString()}',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                width: double.infinity,
                                height: 400,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      FlutterFlowTheme.of(context)
                                          .primaryBackground
                                    ],
                                    stops: [0, 1],
                                    begin: AlignmentDirectional(0, -1),
                                    end: AlignmentDirectional(0, 1),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 1),
                                child: Container(
                                  width: double.infinity,
                                  height: 96,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24, 0, 16, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  getJsonField(
                                                    columnMovieDetailsResponse
                                                        .jsonBody,
                                                    r'''$.title''',
                                                  ).toString(),
                                                  'Master E Movie',
                                                ),
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 8, 0, 8),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      functions
                                                          .getYearFromDateTime(
                                                              valueOrDefault<
                                                                  String>(
                                                        getJsonField(
                                                          columnMovieDetailsResponse
                                                              .jsonBody,
                                                          r'''$.release_date''',
                                                        ).toString(),
                                                        '2022',
                                                      )),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 12,
                                                              ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 0, 8, 0),
                                                      child: Container(
                                                        width: 4,
                                                        height: 4,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        getJsonField(
                                                          columnMovieDetailsResponse
                                                              .jsonBody,
                                                          r'''$.genres[0:2]..name''',
                                                        ).toString(),
                                                        'Thriller',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 12,
                                                              ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 0, 8, 0),
                                                      child: Container(
                                                        width: 4,
                                                        height: 4,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      functions.durationInHM(
                                                          valueOrDefault<int>(
                                                        getJsonField(
                                                          columnMovieDetailsResponse
                                                              .jsonBody,
                                                          r'''$.runtime''',
                                                        ),
                                                        0,
                                                      )),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons.solidStar,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .warning,
                                                    size: 16,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                4, 0, 0, 0),
                                                    child: Text(
                                                      getJsonField(
                                                        columnMovieDetailsResponse
                                                            .jsonBody,
                                                        r'''$.vote_average''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                2, 0, 0, 0),
                                                    child: Text(
                                                      functions
                                                          .numOfReviewsFormater(
                                                              valueOrDefault<
                                                                  int>(
                                                        getJsonField(
                                                          columnMovieDetailsResponse
                                                              .jsonBody,
                                                          r'''$.vote_count''',
                                                        ),
                                                        0,
                                                      )),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 24, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            context.pushNamed(
                                              'PlayNow',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                ),
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: 48,
                                            height: 48,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  getJsonField(
                                                    columnMovieDetailsResponse
                                                        .jsonBody,
                                                    r'''$.title''',
                                                  ),
                                                ).image,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: FaIcon(
                                                FontAwesomeIcons.play,
                                                color: Colors.white,
                                                size: 24,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 24, 24, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        context.pop();
                                      },
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Color(0xB3272B30),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.arrow_back_ios_outlined,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xB3272B30),
                                        shape: BoxShape.circle,
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          final bookmarkCreateData =
                                              createBookmarkRecordData(
                                            userId: currentUserUid,
                                            movieId: widget.movieId,
                                            isMovie: true,
                                            title: getJsonField(
                                              columnMovieDetailsResponse
                                                  .jsonBody,
                                              r'''$.title''',
                                            ).toString(),
                                            voteAverage: valueOrDefault<double>(
                                              getJsonField(
                                                columnMovieDetailsResponse
                                                    .jsonBody,
                                                r'''$.vote_average''',
                                              ),
                                              0.0,
                                            ),
                                            poster: getJsonField(
                                              columnMovieDetailsResponse
                                                  .jsonBody,
                                              r'''$.poster_path''',
                                            ).toString(),
                                          );
                                          await BookmarkRecord.collection
                                              .doc()
                                              .set(bookmarkCreateData);
                                        },
                                        child: Icon(
                                          Icons.bookmark,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Story',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: Text(
                                  getJsonField(
                                    columnMovieDetailsResponse.jsonBody,
                                    r'''$.overview''',
                                  ).toString(),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 24, 0, 8),
                          child: Text(
                            'Cast',
                            style:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 112,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: FutureBuilder<ApiCallResponse>(
                            future: MovieCastCall.call(
                              movieId: widget.movieId,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              final listViewMovieCastResponse = snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final cast = getJsonField(
                                    listViewMovieCastResponse.jsonBody,
                                    r'''$.cast''',
                                  ).toList().take(10).toList();
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: cast.length,
                                    itemBuilder: (context, castIndex) {
                                      final castItem = cast[castIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24, 0, 0, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child: Container(
                                                    height: 500,
                                                    child: CastCardWidget(
                                                      image: castItem,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                          child: CastCardWidget(
                                            key: Key('CastCard_${castIndex}'),
                                            image:
                                                'https://www.themoviedb.org/t/p/w276_and_h350_face${getJsonField(
                                              castItem,
                                              r'''$.profile_path''',
                                            ).toString()}',
                                            name: getJsonField(
                                              castItem,
                                              r'''$.name''',
                                            ).toString(),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 24, 0, 8),
                          child: Text(
                            'Similar',
                            style:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 224,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: FutureBuilder<ApiCallResponse>(
                            future: SimilerMoviesCall.call(),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              final listViewSimilerMoviesResponse =
                                  snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final similarMovies = getJsonField(
                                    listViewSimilerMoviesResponse.jsonBody,
                                    r'''$.results''',
                                  ).toList().take(8).toList();
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: similarMovies.length,
                                    itemBuilder: (context, similarMoviesIndex) {
                                      final similarMoviesItem =
                                          similarMovies[similarMoviesIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24, 0, 0, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            context.pushNamed(
                                              'MovieDetails',
                                              queryParams: {
                                                'movieId': serializeParam(
                                                  getJsonField(
                                                    similarMoviesItem,
                                                    r'''$.id''',
                                                  ),
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: MovieCardWidget(
                                            key: Key(
                                                'MovieCard_${similarMoviesIndex}'),
                                            imagePath: valueOrDefault<String>(
                                              getJsonField(
                                                similarMoviesItem,
                                                r'''$.poster_path''',
                                              ).toString(),
                                              '/wKiOkZTN9lUUUNZLmtnwubZYONg.jpg',
                                            ),
                                            title: getJsonField(
                                              similarMoviesItem,
                                              r'''$.title''',
                                            ).toString(),
                                            duration: '1h 37m',
                                            rating: valueOrDefault<String>(
                                              getJsonField(
                                                similarMoviesItem,
                                                r'''$.vote_average''',
                                              ).toString(),
                                              '5.5',
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
