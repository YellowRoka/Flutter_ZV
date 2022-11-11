part of 'goods_bloc.dart';

abstract class GoodsState extends Equatable {
  const GoodsState();
  
  @override
  List<Object> get props => [];
}

class GoodsStateInitialed extends GoodsState {
  const GoodsStateInitialed();
  
  @override
  List<Object> get props => [];
}

class GoodsStateAdded extends GoodsState {
  const GoodsStateAdded();
  
  @override
  List<Object> get props => [];
}

class GoodsdStateRemoved extends GoodsState {
  const GoodsdStateRemoved();
  
  @override
  List<Object> get props => [];
}

class GoodsStateLoaded extends GoodsState {
  const GoodsStateLoaded(this.goodsList);

  final List<GoodsData?> goodsList;
  
  @override
  List<Object> get props => [goodsList];
}

class GoodsStateLoading extends GoodsState {
  const GoodsStateLoading();

  @override
  List<Object> get props => [];
}

