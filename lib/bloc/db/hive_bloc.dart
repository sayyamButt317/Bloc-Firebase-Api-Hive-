import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:msb_task3/Network/service/db_model.dart';
import 'package:msb_task3/Utils/log_helper.dart';
import 'package:msb_task3/box/hive_box.dart';

part 'hive_event.dart';
part 'hive_state.dart';

class HiveBloc extends Bloc<HiveEvent, HiveState> {
  late Box<HivedbModel> boxTransaction;

  HiveBloc() : super(HiveInitial()) {
    _openBox();
    on<Create>(_onCreate);
    on<GetData>(_onGetData);
  }

  void _openBox() async {
    boxTransaction = await Boxes.hiveBoxOpening();
  }

  void _onCreate(Create event, Emitter<HiveState> emit) async {
    try {
      await boxTransaction.add(event.hivedbModel);
      final transaction = boxTransaction.values.toList();
      emit(DisplayAllDatas(hivedbModel: transaction));
    } catch (e) {
      logger.e('$e');
    }
  }

  void _onGetData(GetData event, Emitter<HiveState> emit) async {
    try {
      emit(const DataLoading());
      await Future.delayed(const Duration(seconds: 1));
      final transactions = boxTransaction.values.toList();
      emit(DisplayAllDatas(hivedbModel: transactions));
    } catch (e) {
      logger.e('$e');
    }
  }
}
