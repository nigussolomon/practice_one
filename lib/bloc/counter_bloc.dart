import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_one/local_store/storage.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterTrigger>((event, emit) async {
      emit(CounterLoading());
      StorageFunc.loadCounter()
          .then((value) => {emit(CounterLoaded(counter: StorageFunc.counter))});
    });
    on<CounterInc>((event, emit) async {
      emit(CounterLoading());
      StorageFunc.counter++;
      emit(CounterLoaded(counter: StorageFunc.counter));
      StorageFunc.saveCounter(StorageFunc.counter);
    });
    on<CounterDec>((event, emit) {
      emit(CounterLoading());
      StorageFunc.counter--;
      emit(CounterLoaded(counter: StorageFunc.counter));
      StorageFunc.saveCounter(StorageFunc.counter);
    });
  }
}
