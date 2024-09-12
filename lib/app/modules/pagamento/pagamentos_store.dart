import 'dart:async';

import 'package:pollos_digital/app/models/credit_card.model.dart';
import 'package:pollos_digital/app/models/hives/credit_cards.hive.dart';
import 'package:pollos_digital/app/models/payment.model.dart';
import 'package:pollos_digital/app/shared/interfaces/simple_selectable_card.interface.dart';
import 'package:mobx/mobx.dart';
import 'package:pollos_digital/loading_store.dart';

part 'pagamentos_store.g.dart';

class PagamentosStore = PagamentosStoreBase with _$PagamentosStore;

abstract class PagamentosStoreBase with Store {
  final LoadingStore loadingStore = LoadingStore();

  final CreditCardsHive _creditCardsHive = CreditCardsHive();

  //==============================================
  //==== PAGAMENTOS ==============================
  //==============================================

  @observable
  ObservableList<SimpleSelectableCard<PaymentModel>> payments =
      ObservableList.of([]);

  @observable
  ObservableList<PaymentModel> selectedPayments = ObservableList.of([]);

  @observable
  bool onlyOpened = false;

  @action
  Future<void> init() async {
    await getAllPayments();
  }

  @action
  Future<void> getAllPayments() async {
    List<PaymentModel> list = [
      PaymentModel(
        id: 1,
        parcela: "1/10",
        date: DateTime.now(),
        price: 315,
        oldPrice: null,
        statusCode: 0,
      ),
      PaymentModel(
        id: 2,
        parcela: null,
        date: DateTime.now(),
        price: 365,
        oldPrice: 389.30,
        statusCode: 1,
        discount: 24.3,
      ),
      PaymentModel(
        id: 3,
        parcela: null,
        date: DateTime.now(),
        price: 315,
        oldPrice: null,
        statusCode: 2,
      ),
    ];

    for (var payment in list) {
      payments.add(SimpleSelectableCard<PaymentModel>(value: payment));
    }
  }

  @action
  void setOnlyOpened(bool b) => onlyOpened = b;

  @action
  void selectPayment(SimpleSelectableCard<PaymentModel> payment) {
    int index = payments.indexWhere((p) => p.value.id == payment.value.id);

    var model = SimpleSelectableCard<PaymentModel>(
      value: payment.value,
      selected: !payment.selected,
    );

    // isso garante que tenha apenas um pagamento selecionado
    for (var i = 0; i < payments.length; i++) {
      payments[i] = SimpleSelectableCard<PaymentModel>(
        value: payments[i].value,
        selected: false,
      );
    }

    payments[index] = model;

    // isso garante que tenha apenas um pagamento selecionado
    selectedPayments.clear();

    (selectedPayments.contains(model.value))
        ? selectedPayments.remove(model.value)
        : selectedPayments.add(model.value);
  }

  @action
  void reset() {}

  //==== PAGAMENTO ====

  @action
  Future<void> initPagamento() async {}

  @action
  void resetPagamento() {}

  //==============================================
  //==== PIX =====================================
  //==============================================

  final int maxPixDuration = 300;

  late Timer pixTimer;

  @observable
  late int pixDuration = maxPixDuration;

  @observable
  String pixCode = '';

  @action
  Future<void> initPix() async {
    pixTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (pixDuration <= 0) {
        t.cancel();
      } else {
        pixDuration--;
      }
    });

    pixCode = '8sd7784987sde7fsd987sdf7sdf987sdf987sfd';
  }

  @action
  void resetPix() {
    pixTimer.cancel();

    pixDuration = maxPixDuration;
  }

  //==============================================
  //==== MY-CARDS ================================
  //==============================================

  @observable
  ObservableList<CreditCardModel> myCards = ObservableList.of([]);

  @observable
  CreditCardModel? selectedCard;

  @action
  Future<void> initMyCards() async {
    await getCreditCards();
  }

  @action
  Future<void> getCreditCards() async {
    myCards.clear();

    List<CreditCardModel> cards = [];

    cards = await _creditCardsHive.getCards();
    myCards.addAll(cards);

    if (cards.isNotEmpty) selectCard(cards.first);
  }

  @action
  void selectCard(CreditCardModel? c) => selectedCard = c;

  @action
  Future<bool> deleteCard(int? cardId) async {
    bool r = await _creditCardsHive.delete(cardId);

    if (selectedCard != null && selectedCard!.id == cardId) {
      selectedCard = null;
    }

    if (r) {
      getCreditCards();
    }

    return r;
  }

  @action
  Future<bool> payWithCreditCard() async {
    return true;
  }

  @action
  void resetMyCards() {}

  //==============================================
  //==== CREDIT-CARD-FORM ========================
  //==============================================

  @observable
  int? cardId;
  @observable
  String cardNumber = '';
  @observable
  String expiryDate = '';
  @observable
  String cardHolderName = '';
  @observable
  String cvvCode = '';
  @observable
  bool cvvFocused = false;

  @action
  Future<void> initCreditCardForm(int? id) async {
    CreditCardModel? model;

    if (id != null) {
      model = await _creditCardsHive.findCard(id);
    }

    if (model != null) {
      cardNumber = model.numero!;
      expiryDate = model.numero!;
      cardHolderName = model.nome!;
      cvvCode = model.cvv!;
    } else {
      cardNumber = '';
      expiryDate = '';
      cardHolderName = '';
      cvvCode = '';
    }

    cardId = id;
    cvvFocused = false;
  }

  @action
  void setCardNumber(String v) {
    cardNumber = v;
    cvvFocused = false;
  }

  @action
  void setExpiryDate(String v) {
    expiryDate = v;
    cvvFocused = false;
  }

  @action
  void setCardHolderName(String v) {
    cardHolderName = v;
    cvvFocused = false;
  }

  @action
  void setCvvCode(String v) {
    cvvCode = v;
    cvvFocused = true;
  }

  @action
  void setCvvFocused(bool v) => cvvFocused = v;

  @action
  Future<bool> saveCard() async {
    CreditCardModel creditCard = CreditCardModel(
      id: cardId,
      numero: cardNumber,
      nome: cardHolderName,
      dataVencimento: expiryDate,
      cvv: cvvCode,
    );

    bool b = await _creditCardsHive.saveCard(creditCard);

    await getCreditCards();

    return b;
  }

  @action
  void resetCreditCardForm() {
    cardNumber = '';
    expiryDate = '';
    cardHolderName = '';
    cvvCode = '';
    cvvFocused = false;
  }

  //==============================================
  //==== CREDIT-CARD =============================
  //==============================================

  @action
  Future<void> initCreditCard() async {}

  @action
  void resetCreditCard() {}
}
