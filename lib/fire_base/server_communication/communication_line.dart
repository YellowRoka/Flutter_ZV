import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zv/fire_base/data_model.dart';

class CommunicationDataSource{

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future updateGoods(GoodsData data) /*async*/ {
    return firestore.collection('goodslist').doc(data.id.toString()).set(
      {
        'id'       : data.id,
        'shop'     : data.shop,
        'goods'    : data.goods,
        'count'    : data.count,
        'boughted' : data.boughted
      }
    ); 
  }

  Future removeGoods(int id) async{
    return firestore.collection('goodslist').doc(id.toString()).delete(); 
  }


  Stream<dynamic> getAllGoodsV3() async*{
    await for (var querySnapshot in firestore.collection('goodslist').snapshots()) {
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    yield allData;
    }
  }

  Stream<dynamic> getAllGoodsV2() {
    return firestore.collection('goodslist').snapshots().map((event){
      final allData = event.docs.map((doc) => doc.data()).toList();
      return allData;
    });
  }
  
  /*Stream<List<GoodsData>>? getAllGoodsV1(){
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  DatabaseReference _ref = FirebaseDatabase.instance.reference().child('goodslist');
  return null;
  //_ref.set("");
  /*return firestore
    .collection('goodslist')
    .withConverter<GoodsData>(
      fromFirestore: (snapshots, _) => GoodsGata.fromJson(snapshots.data()!),
      //toFirestore: (movie, _) => movie.toJson(),
    );;*/
}*/

//help: https://stackoverflow.com/questions/46611369/get-all-from-a-firestore-collection-in-flutter
  Future<dynamic> getAllGoods() async{
    //allData =  firestore.collection('goodslist').doc('0').get().then((s) => s.data());
    QuerySnapshot querySnapshot = await firestore.collection('goodslist').get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    return allData;

  }

}
