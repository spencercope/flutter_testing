import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_app/post_model.dart';
import './bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  @override
  PostState get initialState => PostWithDataState(postModel: PostModel());

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    print(event);
    yield PostLoadingState();
    if (event is PostLoadingComplete) {
      yield PostWithDataState(
        postModel: event.postModel,
      );
    }
  }
}
