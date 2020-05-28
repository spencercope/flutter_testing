import 'package:equatable/equatable.dart';
import 'package:flutter_app/post_model.dart';

abstract class PostState extends Equatable {
  const PostState();
}

class PostWithDataState extends PostState {
  final PostModel postModel;

  PostWithDataState({this.postModel});

  @override
  List<Object> get props => [];
}

class PostLoadingState extends PostState {
  @override
  List<Object> get props => [];
}

class PostErrorState extends PostState {
  @override
  List<Object> get props => [];
}
