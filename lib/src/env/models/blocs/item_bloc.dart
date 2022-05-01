import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:void_01/src/env/models/blocs/item_events.dart';

import '../item/repository.dart';

import 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final _itemRepo = Itemrepository();

  ItemBloc() : super(ItemInitialState()) {
    on<LoadItemEvent>(
      (event, emit) => emit(
        ItemSuccessState(
          itens: _itemRepo.loadItem(),
        ),
      ),
    );
    on<AddItemEvent>(
      (event, emit) => emit(
        ItemSuccessState(
            itens2: _itemRepo.addItem(event.key), itens: _itemRepo.readitens()),
      ),
    );
    on<RemoveItemEvent>(
      (event, emit) => emit(
        ItemSuccessState(
          itens: _itemRepo.removeItem(event.key),
        ),
      ),
    );
  }
}
