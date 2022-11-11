import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zv/fire_base/data_model.dart';

import '../../fire_base/server_communication/communication_line.dart';

part 'goods_event.dart';
part 'goods_state.dart';

class GoodsBloc extends Bloc<GoodsEvent, GoodsState> {

  CommunicationDataSource cds = CommunicationDataSource();
  
  GoodsBloc() : super(GoodsStateInitialed()) {

    on<GoodsEventInit>((event, emit) {
      if(event is GoodsEventInit){
        emit(const GoodsStateInitialed());
      }
    });

    /*on<GoodsEventLoad>((event, emit) async{
      if(event is GoodsEventLoad){

        emit( const GoodsStateLoading() );

        var remoteGoods = await cds.getAllGoods();
        //print(remoteGoods);
        List<GoodsData?> datas = [];
        await for (var it in remoteGoods) {
          GoodsData convertedGoods = GoodsData.fromJson(it); 
          datas.add(convertedGoods);
          
        }
        emit( GoodsStateLoaded( datas) );

      }
    });*/

    on<GoodsEventLoad>((event, emit) async{
      if(event is GoodsEventLoad){
        emit( const GoodsStateLoading() );

        await emit.forEach<dynamic>(cds.getAllGoodsV3(), onData: (remoteGoods){
          List<GoodsData?> datas = [];
          
          for (var it in remoteGoods) {
            GoodsData convertedGoods = GoodsData.fromJson(it); 
            datas.add(convertedGoods);
          }
          return GoodsStateLoaded(datas);
        });
      }
      
    });

    on<GoodsEventAdd>((event, emit) async{
      if(event is GoodsEventAdd){
        var newGood = await event.props[0] as GoodsData;
        await cds.updateGoods(newGood);

        emit( const GoodsStateAdded() );
      }
    });

    on<GoodsEventRemove>((event, emit) async{
      if(event is GoodsEventRemove){
        await cds.removeGoods(event.goods!.id);

        emit( const GoodsdStateRemoved() );
      }
    });

  }

  @override
  void onEvent(GoodsEvent event) {
    print("selected on goods Bloc: $event");
    super.onEvent(event);
  }
}


