// ignore_for_file: non_constant_identifier_names, avoid_function_literals_in_foreach_calls

import 'dart:collection';

import 'package:void_01/src/env/models/item/adapters/item.dart';

import 'package:flutter/material.dart';
import 'package:void_01/src/env/models/item/adapters/itemadapter.dart';
import 'package:xid/xid.dart';
import 'package:hive/hive.dart';

class Itemrepository extends ChangeNotifier {
  final List<Item> _Item = [];
  // late LazyBox favoriteBox;
  late LazyBox box;
  final List<Item> _item2 = [];

  Itemrepository() {
    _startRepository();
  }

  _startRepository() async {
    await _readFavoritas();
    await _openBox();
  }

  _openBox() async {
    Hive.registerAdapter(ItemHiveAdapter());
    box = await Hive.openLazyBox<Item>('item_favoritas');
  }

  _readFavoritas() {
    box.keys.forEach((c) async {
      Item m = await box.get(c);
      _item2.add(m);
    });
    notifyListeners();
  }

  addItem(List<Item> key) {
    key.forEach((c) {
      if (!_item2.any((a) => a.key == c.key)) {
        box.put(c.title, c);
        _item2.add(c);
      }
    });
  }

  UnmodifiableListView<Item> get lista => UnmodifiableListView(_item2);
  var xid = Xid();

  List<Item> loadItem() {
    _Item.addAll([
      Item(
          key: xid.toBytes(),
          urlfoto:
              "https://www.asurascans.com/wp-content/uploads/2021/02/cover4.gif",
          title: "1",
          icon:
              "https://cdn.discordapp.com/icons/290931718708527114/a_44cf7cea00070f135e450ed5c3df1003.webp",
          descr:
              "Deuses de outro mundo, os Deuses Externos.\n<Desespero que Alcança os Céus>, <Tristeza Presa no Pântano>, <Aquele que não Pôde Nascer>, <Caos Tolo>.\nPessoas normais perdiam suas vidas só de olhar para eles. Esses serem estavam destruindo o mundo… Depois de anos de lutas, os sobreviventes finais chegaram a uma conclusão.\n“Um Interno não pode derrotar um Externo.”\nNaquele momento, Cronos, um ser divino capaz de manipular o tempo, se sacrificou e girou os Mecanismos do Relógio.\n“Não temos como vencer. Por enquanto.”\n“Volte para uma linha do tempo antiga. E recomece.”\nA pessoa escolhida por todos os deuses para voltar ao passado. O último humano a escalar a Torre, mas que conseguiu lutar com os deuses até o fim – Kim Yuwon.\n“Um Interno não pode derrotar um Externo. Sendo assim…”\n“Ainda vencerei no final.”\nSerá que ele poderá recuperar os companheiros que lutaram juntos até o final para liderá-los a uma vitória contra os Deuses Externos?"),
      Item(
          key: xid.toBytes(),
          urlfoto:
              "https://www.asurascans.com/wp-content/uploads/2021/02/cover4.gif",
          title: "2",
          icon:
              "https://cdn.discordapp.com/icons/290931718708527114/a_44cf7cea00070f135e450ed5c3df1003.webp",
          descr:
              "Deuses de outro mundo, os Deuses Externos.\n<Desespero que Alcança os Céus>, <Tristeza Presa no Pântano>, <Aquele que não Pôde Nascer>, <Caos Tolo>.\nPessoas normais perdiam suas vidas só de olhar para eles. Esses serem estavam destruindo o mundo… Depois de anos de lutas, os sobreviventes finais chegaram a uma conclusão.\n“Um Interno não pode derrotar um Externo.”\nNaquele momento, Cronos, um ser divino capaz de manipular o tempo, se sacrificou e girou os Mecanismos do Relógio.\n“Não temos como vencer. Por enquanto.”\n“Volte para uma linha do tempo antiga. E recomece.”\nA pessoa escolhida por todos os deuses para voltar ao passado. O último humano a escalar a Torre, mas que conseguiu lutar com os deuses até o fim – Kim Yuwon.\n“Um Interno não pode derrotar um Externo. Sendo assim…”\n“Ainda vencerei no final.”\nSerá que ele poderá recuperar os companheiros que lutaram juntos até o final para liderá-los a uma vitória contra os Deuses Externos?"),
      Item(
          key: xid.toBytes(),
          urlfoto:
              "https://www.asurascans.com/wp-content/uploads/2021/02/cover4.gif",
          title: "3",
          icon:
              "https://cdn.discordapp.com/icons/290931718708527114/a_44cf7cea00070f135e450ed5c3df1003.webp",
          descr:
              "Deuses de outro mundo, os Deuses Externos.\n<Desespero que Alcança os Céus>, <Tristeza Presa no Pântano>, <Aquele que não Pôde Nascer>, <Caos Tolo>.\nPessoas normais perdiam suas vidas só de olhar para eles. Esses serem estavam destruindo o mundo… Depois de anos de lutas, os sobreviventes finais chegaram a uma conclusão.\n“Um Interno não pode derrotar um Externo.”\nNaquele momento, Cronos, um ser divino capaz de manipular o tempo, se sacrificou e girou os Mecanismos do Relógio.\n“Não temos como vencer. Por enquanto.”\n“Volte para uma linha do tempo antiga. E recomece.”\nA pessoa escolhida por todos os deuses para voltar ao passado. O último humano a escalar a Torre, mas que conseguiu lutar com os deuses até o fim – Kim Yuwon.\n“Um Interno não pode derrotar um Externo. Sendo assim…”\n“Ainda vencerei no final.”\nSerá que ele poderá recuperar os companheiros que lutaram juntos até o final para liderá-los a uma vitória contra os Deuses Externos?"),
      Item(
          key: xid.toBytes(),
          urlfoto:
              "https://www.asurascans.com/wp-content/uploads/2021/02/cover4.gif",
          title: "4",
          icon:
              "https://cdn.discordapp.com/icons/290931718708527114/a_44cf7cea00070f135e450ed5c3df1003.webp",
          descr:
              "Deuses de outro mundo, os Deuses Externos.\n<Desespero que Alcança os Céus>, <Tristeza Presa no Pântano>, <Aquele que não Pôde Nascer>, <Caos Tolo>.\nPessoas normais perdiam suas vidas só de olhar para eles. Esses serem estavam destruindo o mundo… Depois de anos de lutas, os sobreviventes finais chegaram a uma conclusão.\n“Um Interno não pode derrotar um Externo.”\nNaquele momento, Cronos, um ser divino capaz de manipular o tempo, se sacrificou e girou os Mecanismos do Relógio.\n“Não temos como vencer. Por enquanto.”\n“Volte para uma linha do tempo antiga. E recomece.”\nA pessoa escolhida por todos os deuses para voltar ao passado. O último humano a escalar a Torre, mas que conseguiu lutar com os deuses até o fim – Kim Yuwon.\n“Um Interno não pode derrotar um Externo. Sendo assim…”\n“Ainda vencerei no final.”\nSerá que ele poderá recuperar os companheiros que lutaram juntos até o final para liderá-los a uma vitória contra os Deuses Externos?"),
      Item(
          key: xid.toBytes(),
          urlfoto:
              "https://www.asurascans.com/wp-content/uploads/2021/02/cover4.gif",
          title: "5",
          icon:
              "https://cdn.discordapp.com/icons/290931718708527114/a_44cf7cea00070f135e450ed5c3df1003.webp",
          descr:
              "Deuses de outro mundo, os Deuses Externos.\n<Desespero que Alcança os Céus>, <Tristeza Presa no Pântano>, <Aquele que não Pôde Nascer>, <Caos Tolo>.\nPessoas normais perdiam suas vidas só de olhar para eles. Esses serem estavam destruindo o mundo… Depois de anos de lutas, os sobreviventes finais chegaram a uma conclusão.\n“Um Interno não pode derrotar um Externo.”\nNaquele momento, Cronos, um ser divino capaz de manipular o tempo, se sacrificou e girou os Mecanismos do Relógio.\n“Não temos como vencer. Por enquanto.”\n“Volte para uma linha do tempo antiga. E recomece.”\nA pessoa escolhida por todos os deuses para voltar ao passado. O último humano a escalar a Torre, mas que conseguiu lutar com os deuses até o fim – Kim Yuwon.\n“Um Interno não pode derrotar um Externo. Sendo assim…”\n“Ainda vencerei no final.”\nSerá que ele poderá recuperar os companheiros que lutaram juntos até o final para liderá-los a uma vitória contra os Deuses Externos?"),
      Item(
          key: xid.toBytes(),
          urlfoto:
              "https://www.asurascans.com/wp-content/uploads/2021/02/cover4.gif",
          title: "6",
          icon:
              "https://cdn.discordapp.com/icons/290931718708527114/a_44cf7cea00070f135e450ed5c3df1003.webp",
          descr:
              "Deuses de outro mundo, os Deuses Externos.\n<Desespero que Alcança os Céus>, <Tristeza Presa no Pântano>, <Aquele que não Pôde Nascer>, <Caos Tolo>.\nPessoas normais perdiam suas vidas só de olhar para eles. Esses serem estavam destruindo o mundo… Depois de anos de lutas, os sobreviventes finais chegaram a uma conclusão.\n“Um Interno não pode derrotar um Externo.”\nNaquele momento, Cronos, um ser divino capaz de manipular o tempo, se sacrificou e girou os Mecanismos do Relógio.\n“Não temos como vencer. Por enquanto.”\n“Volte para uma linha do tempo antiga. E recomece.”\nA pessoa escolhida por todos os deuses para voltar ao passado. O último humano a escalar a Torre, mas que conseguiu lutar com os deuses até o fim – Kim Yuwon.\n“Um Interno não pode derrotar um Externo. Sendo assim…”\n“Ainda vencerei no final.”\nSerá que ele poderá recuperar os companheiros que lutaram juntos até o final para liderá-los a uma vitória contra os Deuses Externos?"),
      Item(
          key: xid.toBytes(),
          urlfoto:
              "https://www.asurascans.com/wp-content/uploads/2021/02/cover4.gif",
          title: "7",
          icon:
              "https://cdn.discordapp.com/icons/290931718708527114/a_44cf7cea00070f135e450ed5c3df1003.webp",
          descr:
              "Deuses de outro mundo, os Deuses Externos.\n<Desespero que Alcança os Céus>, <Tristeza Presa no Pântano>, <Aquele que não Pôde Nascer>, <Caos Tolo>.\nPessoas normais perdiam suas vidas só de olhar para eles. Esses serem estavam destruindo o mundo… Depois de anos de lutas, os sobreviventes finais chegaram a uma conclusão.\n“Um Interno não pode derrotar um Externo.”\nNaquele momento, Cronos, um ser divino capaz de manipular o tempo, se sacrificou e girou os Mecanismos do Relógio.\n“Não temos como vencer. Por enquanto.”\n“Volte para uma linha do tempo antiga. E recomece.”\nA pessoa escolhida por todos os deuses para voltar ao passado. O último humano a escalar a Torre, mas que conseguiu lutar com os deuses até o fim – Kim Yuwon.\n“Um Interno não pode derrotar um Externo. Sendo assim…”\n“Ainda vencerei no final.”\nSerá que ele poderá recuperar os companheiros que lutaram juntos até o final para liderá-los a uma vitória contra os Deuses Externos?"),
      Item(
          key: xid.toBytes(),
          urlfoto:
              "https://www.asurascans.com/wp-content/uploads/2021/02/cover4.gif",
          title: "8",
          icon:
              "https://cdn.discordapp.com/icons/290931718708527114/a_44cf7cea00070f135e450ed5c3df1003.webp",
          descr:
              "Deuses de outro mundo, os Deuses Externos.\n<Desespero que Alcança os Céus>, <Tristeza Presa no Pântano>, <Aquele que não Pôde Nascer>, <Caos Tolo>.\nPessoas normais perdiam suas vidas só de olhar para eles. Esses serem estavam destruindo o mundo… Depois de anos de lutas, os sobreviventes finais chegaram a uma conclusão.\n“Um Interno não pode derrotar um Externo.”\nNaquele momento, Cronos, um ser divino capaz de manipular o tempo, se sacrificou e girou os Mecanismos do Relógio.\n“Não temos como vencer. Por enquanto.”\n“Volte para uma linha do tempo antiga. E recomece.”\nA pessoa escolhida por todos os deuses para voltar ao passado. O último humano a escalar a Torre, mas que conseguiu lutar com os deuses até o fim – Kim Yuwon.\n“Um Interno não pode derrotar um Externo. Sendo assim…”\n“Ainda vencerei no final.”\nSerá que ele poderá recuperar os companheiros que lutaram juntos até o final para liderá-los a uma vitória contra os Deuses Externos?"),
    ]);

    return _Item;
  }

  readitens() {
    return _Item;
  }

  List<Item> removeItem(List<int> key) {
    _Item.removeWhere((item) => item.key == key);

    return _Item;
  }
}
