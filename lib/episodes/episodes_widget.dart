import '../backend/api_requests/api_calls.dart';
import '../components/episode_card_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EpisodesWidget extends StatefulWidget {
  const EpisodesWidget({
    Key? key,
    this.tvId,
    this.seasonNum,
    this.seasonName,
  }) : super(key: key);

  final int? tvId;
  final int? seasonNum;
  final String? seasonName;

  @override
  _EpisodesWidgetState createState() => _EpisodesWidgetState();
}

class _EpisodesWidgetState extends State<EpisodesWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Episodes',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                FFIcons.knameLeftArrow2,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 30,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              widget.seasonName!,
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 18,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                child: FutureBuilder<ApiCallResponse>(
                  future: EpisodesCall.call(
                    tvId: widget.tvId,
                    seasonNumber: widget.seasonNum,
                  ),
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
                    final listViewEpisodesResponse = snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final episodes = getJsonField(
                          listViewEpisodesResponse.jsonBody,
                          r'''$.episodes''',
                        ).toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: episodes.length,
                          itemBuilder: (context, episodesIndex) {
                            final episodesItem = episodes[episodesIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                              child: EpisodeCardWidget(
                                key: Key('EpisodeCard_${episodesIndex}'),
                                image: valueOrDefault<String>(
                                  'https://www.themoviedb.org/t/p/w454_and_h254_bestv2${getJsonField(
                                    episodesItem,
                                    r'''$.still_path''',
                                  ).toString()}',
                                  'https://www.themoviedb.org/t/p/w454_and_h254_bestv2/cmCOUjjQ1TfCh1Gj9V4IFAd2XNu.jpg',
                                ),
                                name: getJsonField(
                                  episodesItem,
                                  r'''$.name''',
                                ).toString(),
                                overview: getJsonField(
                                  episodesItem,
                                  r'''$.overview''',
                                ).toString(),
                                relaseDate: valueOrDefault<String>(
                                  getJsonField(
                                    episodesItem,
                                    r'''$.air_date''',
                                  ).toString(),
                                  '2022',
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
            ),
          ),
        ));
  }
}
