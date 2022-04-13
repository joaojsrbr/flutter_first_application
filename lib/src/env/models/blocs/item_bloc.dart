import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:void_01/src/env/models/blocs/Item_events.dart';
import 'package:void_01/src/env/models/blocs/Item_state.dart';
import 'package:void_01/src/env/models/item/repository.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final _ItemRepo = Itemrepository();

  ItemBloc() : super(ItemInitialState()) {
    on<LoadItemEvent>(
      (event, emit) => emit(
        ItemSuccessState(
          itens: _ItemRepo.loadItem(),
        ),
      ),
    );
    on<AddItemEvent>(
      (event, emit) => emit(
        ItemSuccessState(
          itens: _ItemRepo.addItem(event.item),
        ),
      ),
    );
    on<RemoveItemEvent>(
      (event, emit) => emit(
        ItemSuccessState(
          itens: _ItemRepo.removeItem(
              event.title, event.icon, event.urlfoto, event.descr),
        ),
      ),
    );
  }
}
