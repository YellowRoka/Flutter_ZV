part of 'goods_bloc.dart';

abstract class GoodsEvent extends Equatable {
  const GoodsEvent();

  @override
  List<Object> get props => [];
}

class GoodsEventInit extends GoodsEvent {
  const GoodsEventInit();

  @override
  List<Object> get props => [];
}

class GoodsEventLoad extends GoodsEvent {
  const GoodsEventLoad();

  @override
  List<Object> get props => [];
}

class GoodsEventRemove extends GoodsEvent {
  const GoodsEventRemove(this.goods);

  final GoodsData? goods;

  @override
  List<Object> get props => [goods!];
}

class GoodsEventAdd extends GoodsEvent {
  const GoodsEventAdd(this.goods);

  final GoodsData goods;

  @override
  List<Object> get props => [goods];
}
