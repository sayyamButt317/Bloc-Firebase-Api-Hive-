import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:msb_task3/Network/service/db_model.dart';
import 'package:msb_task3/bussinessLogic/bloc/db/hive_state.dart';
import '../../../helper/Utils/log_helper.dart';
import '../../../helper/enum/status.dart';
import '../../../helper/hiveBox/hive_box.dart';
part 'hive_event.dart';

class HiveBloc extends Bloc<HiveEvent, HiveState> {
  late Box<HivedbModel>? box;

  HiveBloc() : super(const HiveState()) {
    openBox();
    on<AddDataonHive>(_addData);
    on<GetDataFromHive>(_getData);
  }

  void openBox() async {
    box = await HiveBox.hiveBoxOpening();
  }

  void _addData(AddDataonHive event, Emitter<HiveState> emit) async {
    try {
      if (box!= null) {
        await box!.add(event.hivedbModel);
        final transaction = box!.values.toList();
        emit(state.copyWith(postStatus: TaskStatus.success, message: "Data added", hivedbModelList: transaction));
      } else {
        emit(const HiveState(postStatus: TaskStatus.failure, message: "Box not initialized"));
      }
    } catch (e) {
      emit(HiveState(postStatus: TaskStatus.failure, message: "Error adding data: $e"));
    }
  }

  void _getData(GetDataFromHive event, Emitter<HiveState> emit) async {
    try {
      if (box!= null) {
        final transactions = box!.values.toList();
        emit(state.copyWith(postStatus: TaskStatus.success, message: "Data loaded", hivedbModelList: transactions));
      } else {
        emit(const HiveState(postStatus: TaskStatus.failure, message: "Box not initialized"));
      }
    } catch (e) {
      logger.e('$e');
      emit(HiveState(postStatus: TaskStatus.failure, message: "Error loading data: $e"));
    }
  }
}
