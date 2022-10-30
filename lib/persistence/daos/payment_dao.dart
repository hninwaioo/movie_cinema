import 'package:hive/hive.dart';
import 'package:movie_cinema/data/vos/payment_vo.dart';

import '../hive_constants.dart';

class PaymentDao {
  static final PaymentDao _singleton = PaymentDao._internal();

  factory PaymentDao(){
    return _singleton;
  }

  PaymentDao._internal();

  void savedAllPaymentTypes(List<PaymentVO> paymentList) async {
    Map<int, PaymentVO> paymentMap = Map.fromIterable(paymentList,
        key: (payment) => payment.id, value: (payment) => payment);
    await getPaymentBox().putAll(paymentMap);
  }

  List<PaymentVO> getAllPaymentListStream(){
    if(getAllPaymentTypes() != null && getAllPaymentTypes().isNotEmpty){
      return getAllPaymentTypes().toList();
    }else{
      return[];
    }
  }

  Stream<void> getAllPaymentListEventStream(){
    return getPaymentBox().watch();
  }

  List<PaymentVO> getAllPaymentTypes(){
    return getPaymentBox().values.toList();
  }

  Box<PaymentVO> getPaymentBox(){
    return Hive.box<PaymentVO>(BOX_NAME_PAYMENT_VO);
  }
}