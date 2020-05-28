import 'package:flutter/material.dart';
import 'package:flutter_app/post_bloc.dart';
import 'package:flutter_app/post_event.dart';
import 'package:flutter_app/post_model.dart';
import 'package:flutter_app/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data_input_tile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => PostBloc(),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0),
          alignment: Alignment.center,
          child: BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              if (state is PostWithDataState) {
                return buildPostWithDataState(state);
              } else if (state is PostLoadingState) {
                return CircularProgressIndicator();
              } else {
                return Text('Something happened.');
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildPostWithDataState(PostWithDataState postWithDataState) {
    final _postBloc = BlocProvider.of<PostBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              DataInputTile<RowOneValue>(
                value: RowOneValue.low,
                mainColor: Theme.of(context).accentColor,
                borderWidth: 5.0,
                onTap: () {
                  _postBloc.add(PostLoadingComplete(
                      postModel: PostModel(
                        rowOneValue: RowOneValue.low,
                        rowTwoValue: postWithDataState.postModel.rowTwoValue
                      )));
                },
                blocValue: postWithDataState.postModel.rowOneValue,
              ),
              DataInputTile<RowOneValue>(
                value: RowOneValue.high,
                mainColor: Theme.of(context).accentColor,
                borderWidth: 5.0,
                onTap: () {
                  _postBloc.add(PostLoadingComplete(
                      postModel: PostModel(
                        rowOneValue: RowOneValue.high,
                        rowTwoValue: postWithDataState.postModel.rowTwoValue
                      )));
                },
                blocValue: postWithDataState.postModel.rowOneValue,
              )
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              DataInputTile<RowTwoValue>(
                value: RowTwoValue.low,
                mainColor: Theme.of(context).accentColor,
                borderWidth: 5.0,
                onTap: () {
                  _postBloc.add(PostLoadingComplete(
                      postModel: PostModel(
                        rowOneValue: postWithDataState.postModel.rowOneValue,
                        rowTwoValue: RowTwoValue.low,
                      )));
                },
                blocValue: postWithDataState.postModel.rowTwoValue,
              ),
              DataInputTile<RowTwoValue>(
                value: RowTwoValue.high,
                mainColor: Theme.of(context).accentColor,
                borderWidth: 5.0,
                onTap: () {
                  _postBloc.add(PostLoadingComplete(
                      postModel: PostModel(
                        rowOneValue: postWithDataState.postModel.rowOneValue,
                        rowTwoValue: RowTwoValue.high,
                      )));
                },
                blocValue: postWithDataState.postModel.rowTwoValue,
              )
            ],
          ),
        ],
      ),
    );
  }
}

