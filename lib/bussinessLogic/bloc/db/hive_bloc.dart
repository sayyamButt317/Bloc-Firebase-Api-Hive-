import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:msb_task3/Network/service/db_model.dart';
import 'package:msb_task3/bussinessLogic/bloc/db/hive_state.dart';

import '../../../helper/Utils/log_helper.dart';
import '../../../helper/hiveBox/hive_box.dart';
part 'hive_event.dart';

class HiveBloc extends Bloc<HiveEvent, HiveState> {
  late Box<HivedbModel>? box; // Make the box nullable

  HiveBloc() : super(const HiveInitial()) {
    openBox();
    on<AddDataonHive>(_addData);
    on<GetDataFromHive>(_getData);
  }

  void openBox() async {
    box = await HiveBox.hiveBoxOpening();
  }

  void _addData(AddDataonHive event, Emitter<HiveState> emit) async {
    try {
      if (box != null) {
        await box!.add(event.hivedbModel);
        final transaction = box!.values.toList();
        emit(DisplayData(hivedbModelList: transaction));
      } else {
        logger.e('Box is not initialized');
      }
    } catch (e) {
      logger.e('$e');
    }
  }

  void _getData(GetDataFromHive event, Emitter<HiveState> emit) async {
    try {
      if (box != null) {
        emit(const DataLoading());
        final transactions = box!.values.toList();
        emit(DisplayData(hivedbModelList: transactions));
      } else {
        logger.e('Box is not initialized');
      }
    } catch (e) {
      logger.e('$e');
    }
  }
}
