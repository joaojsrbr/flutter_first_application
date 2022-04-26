import 'package:flutter_bloc/flutter_bloc.dart';

import '../item/repository.dart';
import 'Item_events.dart';
import 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  // ignore: non_constant_identifier_names
  final _ItemRepo = Itemrepository();

  ItemBloc() : super(ItemInitialState()) {
    on<LoadItemEvent>(
      (event, emit) => emit(
        ItemSuccessState(
          itens: _ItemRepo.loadItem(),
          // itens2: [],
        ),
      ),
    );
    on<AddItemEvent>(
      (event, emit) => emit(
        ItemSuccessState(
            // itens: _ItemRepo.loadItem(),
            // itens2: _ItemRepo.addItem(event.key),
            ),
      ),
    );
    on<RemoveItemEvent>(
      (event, emit) => emit(
        ItemSuccessState(
          itens: _ItemRepo.removeItem(event.key),
        ),
      ),
    );
  }
}
