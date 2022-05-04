// ignore_for_file: non_constant_identifier_names, avoid_function_literals_in_foreach_calls

import 'dart:collection';

import 'package:void_01/src/env/models/item/adapters/item.dart';

import 'package:flutter/material.dart';

import 'package:xid/xid.dart';

class Itemrepository extends ChangeNotifier {
  final List<Item> _Item = [];

  Itemrepository() {
    _startRepository();
  }

  _startRepository() async {
    await loadItem();
  }

  UnmodifiableListView<Item> get lista => UnmodifiableListView(_Item);

  var xid = Xid();

  loadItem() {
    _Item.addAll([
      Item(
          key: Xid().toBytes(),
          urlfoto:
              "https://www.asurascans.com/wp-content/uploads/2021/02/cover4.gif",
          title: "1",
          icon:
              "https://cdn.discordapp.com/icons/290931718708527114/a_44cf7cea00070f135e450ed5c3df1003.webp",
          descr:
              "Deuses de outro mundo, os Deuses Externos.\n<Desespero que Alcança os Céus>, <Tristeza Presa no Pântano>, <Aquele que não Pôde Nascer>, <Caos Tolo>.\nPessoas normais perdiam suas vidas só de olhar para eles. Esses serem estavam destruindo o mundo… Depois de anos de lutas, os sobreviventes finais chegaram a uma conclusão.\n“Um Interno não pode derrotar um Externo.”\nNaquele momento, Cronos, um ser divino capaz de manipular o tempo, se sacrificou e girou os Mecanismos do Relógio.\n“Não temos como vencer. Por enquanto.”\n“Volte para uma linha do tempo antiga. E recomece.”\nA pessoa escolhida por todos os deuses para voltar ao passado. O último humano a escalar a Torre, mas que conseguiu lutar com os deuses até o fim – Kim Yuwon.\n“Um Interno não pode derrotar um Externo. Sendo assim…”\n“Ainda vencerei no final.”\nSerá que ele poderá recuperar os companheiros que lutaram juntos até o final para liderá-los a uma vitória contra os Deuses Externos?"),
      Item(
          key: Xid().toBytes(),
          urlfoto:
              "https://www.asurascans.com/wp-content/uploads/2021/02/cover4.gif",
          title: "2",
          icon:
              "https://cdn.discordapp.com/icons/290931718708527114/a_44cf7cea00070f135e450ed5c3df1003.webp",
          descr:
              "Deuses de outro mundo, os Deuses Externos.\n<Desespero que Alcança os Céus>, <Tristeza Presa no Pântano>, <Aquele que não Pôde Nascer>, <Caos Tolo>.\nPessoas normais perdiam suas vidas só de olhar para eles. Esses serem estavam destruindo o mundo… Depois de anos de lutas, os sobreviventes finais chegaram a uma conclusão.\n“Um Interno não pode derrotar um Externo.”\nNaquele momento, Cronos, um ser divino capaz de manipular o tempo, se sacrificou e girou os Mecanismos do Relógio.\n“Não temos como vencer. Por enquanto.”\n“Volte para uma linha do tempo antiga. E recomece.”\nA pessoa escolhida por todos os deuses para voltar ao passado. O último humano a escalar a Torre, mas que conseguiu lutar com os deuses até o fim – Kim Yuwon.\n“Um Interno não pode derrotar um Externo. Sendo assim…”\n“Ainda vencerei no final.”\nSerá que ele poderá recuperar os companheiros que lutaram juntos até o final para liderá-los a uma vitória contra os Deuses Externos?"),
      Item(
          key: Xid().toBytes(),
          urlfoto:
              "https://www.asurascans.com/wp-content/uploads/2021/02/cover4.gif",
          title: "3",
          icon:
              "https://cdn.discordapp.com/icons/290931718708527114/a_44cf7cea00070f135e450ed5c3df1003.webp",
          descr:
              "Deuses de outro mundo, os Deuses Externos.\n<Desespero que Alcança os Céus>, <Tristeza Presa no Pântano>, <Aquele que não Pôde Nascer>, <Caos Tolo>.\nPessoas normais perdiam suas vidas só de olhar para eles. Esses serem estavam destruindo o mundo… Depois de anos de lutas, os sobreviventes finais chegaram a uma conclusão.\n“Um Interno não pode derrotar um Externo.”\nNaquele momento, Cronos, um ser divino capaz de manipular o tempo, se sacrificou e girou os Mecanismos do Relógio.\n“Não temos como vencer. Por enquanto.”\n“Volte para uma linha do tempo antiga. E recomece.”\nA pessoa escolhida por todos os deuses para voltar ao passado. O último humano a escalar a Torre, mas que conseguiu lutar com os deuses até o fim – Kim Yuwon.\n“Um Interno não pode derrotar um Externo. Sendo assim…”\n“Ainda vencerei no final.”\nSerá que ele poderá recuperar os companheiros que lutaram juntos até o final para liderá-los a uma vitória contra os Deuses Externos?"),
      Item(
          key: Xid().toBytes(),
          urlfoto:
              "https://www.asurascans.com/wp-content/uploads/2021/02/cover4.gif",
          title: "4",
          icon:
              "https://cdn.discordapp.com/icons/290931718708527114/a_44cf7cea00070f135e450ed5c3df1003.webp",
          descr:
              "Deuses de outro mundo, os Deuses Externos.\n<Desespero que Alcança os Céus>, <Tristeza Presa no Pântano>, <Aquele que não Pôde Nascer>, <Caos Tolo>.\nPessoas normais perdiam suas vidas só de olhar para eles. Esses serem estavam destruindo o mundo… Depois de anos de lutas, os sobreviventes finais chegaram a uma conclusão.\n“Um Interno não pode derrotar um Externo.”\nNaquele momento, Cronos, um ser divino capaz de manipular o tempo, se sacrificou e girou os Mecanismos do Relógio.\n“Não temos como vencer. Por enquanto.”\n“Volte para uma linha do tempo antiga. E recomece.”\nA pessoa escolhida por todos os deuses para voltar ao passado. O último humano a escalar a Torre, mas que conseguiu lutar com os deuses até o fim – Kim Yuwon.\n“Um Interno não pode derrotar um Externo. Sendo assim…”\n“Ainda vencerei no final.”\nSerá que ele poderá recuperar os companheiros que lutaram juntos até o final para liderá-los a uma vitória contra os Deuses Externos?"),
      Item(
          key: Xid().toBytes(),
          urlfoto:
              "https://www.asurascans.com/wp-content/uploads/2021/02/cover4.gif",
          title: "5",
          icon:
              "https://cdn.discordapp.com/icons/290931718708527114/a_44cf7cea00070f135e450ed5c3df1003.webp",
          descr:
              "Deuses de outro mundo, os Deuses Externos.\n<Desespero que Alcança os Céus>, <Tristeza Presa no Pântano>, <Aquele que não Pôde Nascer>, <Caos Tolo>.\nPessoas normais perdiam suas vidas só de olhar para eles. Esses serem estavam destruindo o mundo… Depois de anos de lutas, os sobreviventes finais chegaram a uma conclusão.\n“Um Interno não pode derrotar um Externo.”\nNaquele momento, Cronos, um ser divino capaz de manipular o tempo, se sacrificou e girou os Mecanismos do Relógio.\n“Não temos como vencer. Por enquanto.”\n“Volte para uma linha do tempo antiga. E recomece.”\nA pessoa escolhida por todos os deuses para voltar ao passado. O último humano a escalar a Torre, mas que conseguiu lutar com os deuses até o fim – Kim Yuwon.\n“Um Interno não pode derrotar um Externo. Sendo assim…”\n“Ainda vencerei no final.”\nSerá que ele poderá recuperar os companheiros que lutaram juntos até o final para liderá-los a uma vitória contra os Deuses Externos?"),
      Item(
          key: Xid().toBytes(),
          urlfoto:
              "https://www.asurascans.com/wp-content/uploads/2021/02/cover4.gif",
          title: "6",
          icon:
              "https://cdn.discordapp.com/icons/290931718708527114/a_44cf7cea00070f135e450ed5c3df1003.webp",
          descr:
              "Deuses de outro mundo, os Deuses Externos.\n<Desespero que Alcança os Céus>, <Tristeza Presa no Pântano>, <Aquele que não Pôde Nascer>, <Caos Tolo>.\nPessoas normais perdiam suas vidas só de olhar para eles. Esses serem estavam destruindo o mundo… Depois de anos de lutas, os sobreviventes finais chegaram a uma conclusão.\n“Um Interno não pode derrotar um Externo.”\nNaquele momento, Cronos, um ser divino capaz de manipular o tempo, se sacrificou e girou os Mecanismos do Relógio.\n“Não temos como vencer. Por enquanto.”\n“Volte para uma linha do tempo antiga. E recomece.”\nA pessoa escolhida por todos os deuses para voltar ao passado. O último humano a escalar a Torre, mas que conseguiu lutar com os deuses até o fim – Kim Yuwon.\n“Um Interno não pode derrotar um Externo. Sendo assim…”\n“Ainda vencerei no final.”\nSerá que ele poderá recuperar os companheiros que lutaram juntos até o final para liderá-los a uma vitória contra os Deuses Externos?"),
      Item(
          key: Xid().toBytes(),
          urlfoto:
              "https://www.asurascans.com/wp-content/uploads/2021/02/cover4.gif",
          title: "7",
          icon:
              "https://cdn.discordapp.com/icons/290931718708527114/a_44cf7cea00070f135e450ed5c3df1003.webp",
          descr:
              "Deuses de outro mundo, os Deuses Externos.\n<Desespero que Alcança os Céus>, <Tristeza Presa no Pântano>, <Aquele que não Pôde Nascer>, <Caos Tolo>.\nPessoas normais perdiam suas vidas só de olhar para eles. Esses serem estavam destruindo o mundo… Depois de anos de lutas, os sobreviventes finais chegaram a uma conclusão.\n“Um Interno não pode derrotar um Externo.”\nNaquele momento, Cronos, um ser divino capaz de manipular o tempo, se sacrificou e girou os Mecanismos do Relógio.\n“Não temos como vencer. Por enquanto.”\n“Volte para uma linha do tempo antiga. E recomece.”\nA pessoa escolhida por todos os deuses para voltar ao passado. O último humano a escalar a Torre, mas que conseguiu lutar com os deuses até o fim – Kim Yuwon.\n“Um Interno não pode derrotar um Externo. Sendo assim…”\n“Ainda vencerei no final.”\nSerá que ele poderá recuperar os companheiros que lutaram juntos até o final para liderá-los a uma vitória contra os Deuses Externos?"),
      Item(
          key: Xid().toBytes(),
          urlfoto:
              "https://www.asurascans.com/wp-content/uploads/2021/02/cover4.gif",
          title: "8",
          icon:
              "https://cdn.discordapp.com/icons/290931718708527114/a_44cf7cea00070f135e450ed5c3df1003.webp",
          descr:
              "Deuses de outro mundo, os Deuses Externos.\n<Desespero que Alcança os Céus>, <Tristeza Presa no Pântano>, <Aquele que não Pôde Nascer>, <Caos Tolo>.\nPessoas normais perdiam suas vidas só de olhar para eles. Esses serem estavam destruindo o mundo… Depois de anos de lutas, os sobreviventes finais chegaram a uma conclusão.\n“Um Interno não pode derrotar um Externo.”\nNaquele momento, Cronos, um ser divino capaz de manipular o tempo, se sacrificou e girou os Mecanismos do Relógio.\n“Não temos como vencer. Por enquanto.”\n“Volte para uma linha do tempo antiga. E recomece.”\nA pessoa escolhida por todos os deuses para voltar ao passado. O último humano a escalar a Torre, mas que conseguiu lutar com os deuses até o fim – Kim Yuwon.\n“Um Interno não pode derrotar um Externo. Sendo assim…”\n“Ainda vencerei no final.”\nSerá que ele poderá recuperar os companheiros que lutaram juntos até o final para liderá-los a uma vitória contra os Deuses Externos?"),
    ]);

    notifyListeners();
  }

  removeItem(List<int> key) {
    _Item.removeWhere((item) => item.key == key);

    notifyListeners();
  }
}
