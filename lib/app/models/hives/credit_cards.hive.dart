import 'package:hive/hive.dart';
import 'package:pollos_digital/app/models/credit_card.model.dart';

class CreditCardsHive {
  Future<bool> boxExists() async {
    return await Hive.boxExists('credit_cards');
  }

  //guests
  Future<List<CreditCardModel>> getCards() async {
    // List<dynamic> dynamicList = [];
    // List<CreditCardModel> typedList = [];

    // dynamicList = await Hive.box('credit_cards').get('cards', defaultValue: []);

    // for (var item in dynamicList) {
    //   typedList.add(item as CreditCardModel);
    // }

    // return typedList;

    // PRECISA DESSA MERDA PQ O HIVE É BURRO
    return (await Hive.box('credit_cards').get('cards', defaultValue: []))
        .cast<CreditCardModel>();
  }

  Future<CreditCardModel?> findCard(int id) async {
    return (await getCards()).where((c) => c.id == id).firstOrNull;
  }

  Future<bool> saveCard(CreditCardModel card) async {
    var cards = await getCards();

    int index = cards.indexWhere((c) => c.id == card.id);

    if (index == -1) {
      card.id = cards.length + 1;
      cards.add(card);
    } else {
      cards[index] = card;
    }

    return _putCards(cards);
  }

  bool hasCards() {
    return Hive.box('credit_cards').containsKey('cards');
  }

  Future<void> clear() async {
    return await Hive.box('credit_cards').delete('cards');
  }

  Future<bool> delete(int? id) async {
    var cards = await getCards();

    int index = cards.indexWhere((c) => c.id == id);

    if (index == -1) return true;

    cards.removeAt(index);

    return _putCards(cards);
  }

  Future<bool> _putCards(List<CreditCardModel> cards) async {
    try {
      await Hive.box('credit_cards').put('cards', cards);
      return true;
    } catch (_) {
      return false;
    }
  }
}
