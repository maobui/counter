import 'package:counter/list/post.dart';
import 'package:equatable/equatable.dart';

abstract class PostState extends Equatable {

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PostUninitialized  extends PostState {}

class PostError extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;
  final bool hasReachedMax;

  PostLoaded({this.posts, this.hasReachedMax,});

  PostLoaded copyWith({List<Post> posts, bool hasReachedMax,}) => PostLoaded(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );

  @override
  List<Object> get props => [posts, hasReachedMax];

  @override
  String toString() => 'PostLoaded { posts: ${posts.length}, hasReachedMax: $hasReachedMax }';
}

