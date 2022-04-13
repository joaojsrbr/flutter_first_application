import 'package:http/http.dart';
import 'package:void_01/src/env/models/item/item.dart';

class Itemrepository {
  final List<Item> _Item = [];
  final List<Item> _icon = [];

  List<Item> loadItem() {
    _Item.addAll([
      Item(
          urlfoto:
              "https://neoxscans.net/wp-content/uploads/2022/02/TheWorldAfterTheEndCapa-175x238.png",
          title: "Solo Max-Level Newbie",
          icon:
              "https://neoxscans.net/wp-content/uploads/2021/05/cropped-neoxscans-32x32.png",
          descr:
              "Jinhyuk, o personagem principal, um viciado completo, foi o único a ter visto o final da [Torre dos Testes], mas à medida que a popularidade do jogo diminui, fica difícil manter a vida com o jogo.\nJinhyuk quer terminar o jogo assim porque ele viu o final. Naquele mesmo dia, a [Torre dos Testes] se tornou uma realidade.\nJinhyuk, que conhece todos os elementos do jogo, controla tudo mais rápido do que qualquer um!\n“Vou te mostrar o que é um profissional de verdade.”"),
      Item(
          urlfoto:
              "https://neoxscans.net/wp-content/uploads/2021/07/LevelingWTGCapa03.png.webp",
          title: "Leveling With the Gods",
          icon:
              "https://neoxscans.net/wp-content/uploads/2021/05/cropped-neoxscans-32x32.png",
          descr:
              "Deuses de outro mundo, os Deuses Externos.\n<Desespero que Alcança os Céus>, <Tristeza Presa no Pântano>, <Aquele que não Pôde Nascer>, <Caos Tolo>.\nPessoas normais perdiam suas vidas só de olhar para eles. Esses serem estavam destruindo o mundo… Depois de anos de lutas, os sobreviventes finais chegaram a uma conclusão.\n“Um Interno não pode derrotar um Externo.”\nNaquele momento, Cronos, um ser divino capaz de manipular o tempo, se sacrificou e girou os Mecanismos do Relógio.\n“Não temos como vencer. Por enquanto.”\n“Volte para uma linha do tempo antiga. E recomece.”\nA pessoa escolhida por todos os deuses para voltar ao passado. O último humano a escalar a Torre, mas que conseguiu lutar com os deuses até o fim – Kim Yuwon.\n“Um Interno não pode derrotar um Externo. Sendo assim…”\n“Ainda vencerei no final.”\nSerá que ele poderá recuperar os companheiros que lutaram juntos até o final para liderá-los a uma vitória contra os Deuses Externos?"),
      Item(
          urlfoto:
              "https://neoxscans.net/wp-content/uploads/2021/05/OmniscientCapa.png.webp",
          title: "The Regressed Demon Lord is Kind [Novel]",
          icon:
              "https://neoxscans.net/wp-content/uploads/2021/05/cropped-neoxscans-32x32.png",
          descr:
              "Deuses de outro mundo, os Deuses Externos.\n<Desespero que Alcança os Céus>, <Tristeza Presa no Pântano>, <Aquele que não Pôde Nascer>, <Caos Tolo>.\nPessoas normais perdiam suas vidas só de olhar para eles. Esses serem estavam destruindo o mundo… Depois de anos de lutas, os sobreviventes finais chegaram a uma conclusão.\n“Um Interno não pode derrotar um Externo.”\nNaquele momento, Cronos, um ser divino capaz de manipular o tempo, se sacrificou e girou os Mecanismos do Relógio.\n“Não temos como vencer. Por enquanto.”\n“Volte para uma linha do tempo antiga. E recomece.”\nA pessoa escolhida por todos os deuses para voltar ao passado. O último humano a escalar a Torre, mas que conseguiu lutar com os deuses até o fim – Kim Yuwon.\n“Um Interno não pode derrotar um Externo. Sendo assim…”\n“Ainda vencerei no final.”\nSerá que ele poderá recuperar os companheiros que lutaram juntos até o final para liderá-los a uma vitória contra os Deuses Externos?"),
      Item(
          urlfoto:
              "https://neoxscans.net/wp-content/uploads/2021/05/OmniscientCapa.png.webp",
          title: "The Regressed Demon Lord is Kind [Novel]",
          icon:
              "https://neoxscans.net/wp-content/uploads/2021/05/cropped-neoxscans-32x32.png",
          descr:
              "Deuses de outro mundo, os Deuses Externos.\n<Desespero que Alcança os Céus>, <Tristeza Presa no Pântano>, <Aquele que não Pôde Nascer>, <Caos Tolo>.\nPessoas normais perdiam suas vidas só de olhar para eles. Esses serem estavam destruindo o mundo… Depois de anos de lutas, os sobreviventes finais chegaram a uma conclusão.\n“Um Interno não pode derrotar um Externo.”\nNaquele momento, Cronos, um ser divino capaz de manipular o tempo, se sacrificou e girou os Mecanismos do Relógio.\n“Não temos como vencer. Por enquanto.”\n“Volte para uma linha do tempo antiga. E recomece.”\nA pessoa escolhida por todos os deuses para voltar ao passado. O último humano a escalar a Torre, mas que conseguiu lutar com os deuses até o fim – Kim Yuwon.\n“Um Interno não pode derrotar um Externo. Sendo assim…”\n“Ainda vencerei no final.”\nSerá que ele poderá recuperar os companheiros que lutaram juntos até o final para liderá-los a uma vitória contra os Deuses Externos?"),
      Item(
          urlfoto:
              "https://neoxscans.net/wp-content/uploads/2021/05/OmniscientCapa.png.webp",
          title: "The Regressed Demon Lord is Kind [Novel]",
          icon:
              "https://neoxscans.net/wp-content/uploads/2021/05/cropped-neoxscans-32x32.png",
          descr:
              "Deuses de outro mundo, os Deuses Externos.\n<Desespero que Alcança os Céus>, <Tristeza Presa no Pântano>, <Aquele que não Pôde Nascer>, <Caos Tolo>.\nPessoas normais perdiam suas vidas só de olhar para eles. Esses serem estavam destruindo o mundo… Depois de anos de lutas, os sobreviventes finais chegaram a uma conclusão.\n“Um Interno não pode derrotar um Externo.”\nNaquele momento, Cronos, um ser divino capaz de manipular o tempo, se sacrificou e girou os Mecanismos do Relógio.\n“Não temos como vencer. Por enquanto.”\n“Volte para uma linha do tempo antiga. E recomece.”\nA pessoa escolhida por todos os deuses para voltar ao passado. O último humano a escalar a Torre, mas que conseguiu lutar com os deuses até o fim – Kim Yuwon.\n“Um Interno não pode derrotar um Externo. Sendo assim…”\n“Ainda vencerei no final.”\nSerá que ele poderá recuperar os companheiros que lutaram juntos até o final para liderá-los a uma vitória contra os Deuses Externos?"),
      Item(
          urlfoto:
              "https://neoxscans.net/wp-content/uploads/2021/05/OmniscientCapa.png.webp",
          title: "The Regressed Demon Lord is Kind [Novel]",
          icon:
              "https://neoxscans.net/wp-content/uploads/2021/05/cropped-neoxscans-32x32.png",
          descr:
              "Deuses de outro mundo, os Deuses Externos.\n<Desespero que Alcança os Céus>, <Tristeza Presa no Pântano>, <Aquele que não Pôde Nascer>, <Caos Tolo>.\nPessoas normais perdiam suas vidas só de olhar para eles. Esses serem estavam destruindo o mundo… Depois de anos de lutas, os sobreviventes finais chegaram a uma conclusão.\n“Um Interno não pode derrotar um Externo.”\nNaquele momento, Cronos, um ser divino capaz de manipular o tempo, se sacrificou e girou os Mecanismos do Relógio.\n“Não temos como vencer. Por enquanto.”\n“Volte para uma linha do tempo antiga. E recomece.”\nA pessoa escolhida por todos os deuses para voltar ao passado. O último humano a escalar a Torre, mas que conseguiu lutar com os deuses até o fim – Kim Yuwon.\n“Um Interno não pode derrotar um Externo. Sendo assim…”\n“Ainda vencerei no final.”\nSerá que ele poderá recuperar os companheiros que lutaram juntos até o final para liderá-los a uma vitória contra os Deuses Externos?"),
      Item(
          urlfoto:
              "https://neoxscans.net/wp-content/uploads/2021/05/OmniscientCapa.png.webp",
          title: "The Regressed Demon Lord is Kind [Novel]",
          icon:
              "https://neoxscans.net/wp-content/uploads/2021/05/cropped-neoxscans-32x32.png",
          descr:
              "Deuses de outro mundo, os Deuses Externos.\n<Desespero que Alcança os Céus>, <Tristeza Presa no Pântano>, <Aquele que não Pôde Nascer>, <Caos Tolo>.\nPessoas normais perdiam suas vidas só de olhar para eles. Esses serem estavam destruindo o mundo… Depois de anos de lutas, os sobreviventes finais chegaram a uma conclusão.\n“Um Interno não pode derrotar um Externo.”\nNaquele momento, Cronos, um ser divino capaz de manipular o tempo, se sacrificou e girou os Mecanismos do Relógio.\n“Não temos como vencer. Por enquanto.”\n“Volte para uma linha do tempo antiga. E recomece.”\nA pessoa escolhida por todos os deuses para voltar ao passado. O último humano a escalar a Torre, mas que conseguiu lutar com os deuses até o fim – Kim Yuwon.\n“Um Interno não pode derrotar um Externo. Sendo assim…”\n“Ainda vencerei no final.”\nSerá que ele poderá recuperar os companheiros que lutaram juntos até o final para liderá-los a uma vitória contra os Deuses Externos?"),
      Item(
          urlfoto:
              "https://neoxscans.net/wp-content/uploads/2021/05/OmniscientCapa.png.webp",
          title: "The Regressed Demon Lord is Kind [Novel]",
          icon:
              "https://neoxscans.net/wp-content/uploads/2021/05/cropped-neoxscans-32x32.png",
          descr:
              "Deuses de outro mundo, os Deuses Externos.\n<Desespero que Alcança os Céus>, <Tristeza Presa no Pântano>, <Aquele que não Pôde Nascer>, <Caos Tolo>.\nPessoas normais perdiam suas vidas só de olhar para eles. Esses serem estavam destruindo o mundo… Depois de anos de lutas, os sobreviventes finais chegaram a uma conclusão.\n“Um Interno não pode derrotar um Externo.”\nNaquele momento, Cronos, um ser divino capaz de manipular o tempo, se sacrificou e girou os Mecanismos do Relógio.\n“Não temos como vencer. Por enquanto.”\n“Volte para uma linha do tempo antiga. E recomece.”\nA pessoa escolhida por todos os deuses para voltar ao passado. O último humano a escalar a Torre, mas que conseguiu lutar com os deuses até o fim – Kim Yuwon.\n“Um Interno não pode derrotar um Externo. Sendo assim…”\n“Ainda vencerei no final.”\nSerá que ele poderá recuperar os companheiros que lutaram juntos até o final para liderá-los a uma vitória contra os Deuses Externos?"),
    ]);

    return _Item;
  }

  List<Item> loadicon() {
    _icon.addAll([
      Item(
          icon:
              "https://neoxscans.net/wp-content/uploads/2021/05/cropped-neoxscans-32x32.png")
    ]);
    return _icon;
  }

  List<Item> addItem(Item title) {
    _Item.add(title);
    return _Item;
  }

  List<Item> removeItem(Item title, Item urlfoto, Item icon, Item desc) {
    _Item.remove(title);
    _Item.remove(urlfoto);
    _Item.remove(icon);
    _Item.remove(desc);
    return _Item;
  }
}
