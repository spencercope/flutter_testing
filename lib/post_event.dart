import 'package:equatable/equatable.dart';
import 'package:flutter_app/post_model.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class PostLoadingComplete extends PostEvent {
  final PostModel postModel;

  PostLoadingComplete({this.postModel});

  @override
  List<Object> get props => [];
}
