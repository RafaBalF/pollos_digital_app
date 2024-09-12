// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagamentos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PagamentosStore on PagamentosStoreBase, Store {
  late final _$paymentsAtom =
      Atom(name: 'PagamentosStoreBase.payments', context: context);

  @override
  ObservableList<SimpleSelectableCard<PaymentModel>> get payments {
    _$paymentsAtom.reportRead();
    return super.payments;
  }

  @override
  set payments(ObservableList<SimpleSelectableCard<PaymentModel>> value) {
    _$paymentsAtom.reportWrite(value, super.payments, () {
      super.payments = value;
    });
  }

  late final _$selectedPaymentsAtom =
      Atom(name: 'PagamentosStoreBase.selectedPayments', context: context);

  @override
  ObservableList<PaymentModel> get selectedPayments {
    _$selectedPaymentsAtom.reportRead();
    return super.selectedPayments;
  }

  @override
  set selectedPayments(ObservableList<PaymentModel> value) {
    _$selectedPaymentsAtom.reportWrite(value, super.selectedPayments, () {
      super.selectedPayments = value;
    });
  }

  late final _$onlyOpenedAtom =
      Atom(name: 'PagamentosStoreBase.onlyOpened', context: context);

  @override
  bool get onlyOpened {
    _$onlyOpenedAtom.reportRead();
    return super.onlyOpened;
  }

  @override
  set onlyOpened(bool value) {
    _$onlyOpenedAtom.reportWrite(value, super.onlyOpened, () {
      super.onlyOpened = value;
    });
  }

  late final _$pixDurationAtom =
      Atom(name: 'PagamentosStoreBase.pixDuration', context: context);

  @override
  int get pixDuration {
    _$pixDurationAtom.reportRead();
    return super.pixDuration;
  }

  bool _pixDurationIsInitialized = false;

  @override
  set pixDuration(int value) {
    _$pixDurationAtom.reportWrite(
        value, _pixDurationIsInitialized ? super.pixDuration : null, () {
      super.pixDuration = value;
      _pixDurationIsInitialized = true;
    });
  }

  late final _$pixCodeAtom =
      Atom(name: 'PagamentosStoreBase.pixCode', context: context);

  @override
  String get pixCode {
    _$pixCodeAtom.reportRead();
    return super.pixCode;
  }

  @override
  set pixCode(String value) {
    _$pixCodeAtom.reportWrite(value, super.pixCode, () {
      super.pixCode = value;
    });
  }

  late final _$myCardsAtom =
      Atom(name: 'PagamentosStoreBase.myCards', context: context);

  @override
  ObservableList<CreditCardModel> get myCards {
    _$myCardsAtom.reportRead();
    return super.myCards;
  }

  @override
  set myCards(ObservableList<CreditCardModel> value) {
    _$myCardsAtom.reportWrite(value, super.myCards, () {
      super.myCards = value;
    });
  }

  late final _$selectedCardAtom =
      Atom(name: 'PagamentosStoreBase.selectedCard', context: context);

  @override
  CreditCardModel? get selectedCard {
    _$selectedCardAtom.reportRead();
    return super.selectedCard;
  }

  @override
  set selectedCard(CreditCardModel? value) {
    _$selectedCardAtom.reportWrite(value, super.selectedCard, () {
      super.selectedCard = value;
    });
  }

  late final _$cardIdAtom =
      Atom(name: 'PagamentosStoreBase.cardId', context: context);

  @override
  int? get cardId {
    _$cardIdAtom.reportRead();
    return super.cardId;
  }

  @override
  set cardId(int? value) {
    _$cardIdAtom.reportWrite(value, super.cardId, () {
      super.cardId = value;
    });
  }

  late final _$cardNumberAtom =
      Atom(name: 'PagamentosStoreBase.cardNumber', context: context);

  @override
  String get cardNumber {
    _$cardNumberAtom.reportRead();
    return super.cardNumber;
  }

  @override
  set cardNumber(String value) {
    _$cardNumberAtom.reportWrite(value, super.cardNumber, () {
      super.cardNumber = value;
    });
  }

  late final _$expiryDateAtom =
      Atom(name: 'PagamentosStoreBase.expiryDate', context: context);

  @override
  String get expiryDate {
    _$expiryDateAtom.reportRead();
    return super.expiryDate;
  }

  @override
  set expiryDate(String value) {
    _$expiryDateAtom.reportWrite(value, super.expiryDate, () {
      super.expiryDate = value;
    });
  }

  late final _$cardHolderNameAtom =
      Atom(name: 'PagamentosStoreBase.cardHolderName', context: context);

  @override
  String get cardHolderName {
    _$cardHolderNameAtom.reportRead();
    return super.cardHolderName;
  }

  @override
  set cardHolderName(String value) {
    _$cardHolderNameAtom.reportWrite(value, super.cardHolderName, () {
      super.cardHolderName = value;
    });
  }

  late final _$cvvCodeAtom =
      Atom(name: 'PagamentosStoreBase.cvvCode', context: context);

  @override
  String get cvvCode {
    _$cvvCodeAtom.reportRead();
    return super.cvvCode;
  }

  @override
  set cvvCode(String value) {
    _$cvvCodeAtom.reportWrite(value, super.cvvCode, () {
      super.cvvCode = value;
    });
  }

  late final _$cvvFocusedAtom =
      Atom(name: 'PagamentosStoreBase.cvvFocused', context: context);

  @override
  bool get cvvFocused {
    _$cvvFocusedAtom.reportRead();
    return super.cvvFocused;
  }

  @override
  set cvvFocused(bool value) {
    _$cvvFocusedAtom.reportWrite(value, super.cvvFocused, () {
      super.cvvFocused = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('PagamentosStoreBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$getAllPaymentsAsyncAction =
      AsyncAction('PagamentosStoreBase.getAllPayments', context: context);

  @override
  Future<void> getAllPayments() {
    return _$getAllPaymentsAsyncAction.run(() => super.getAllPayments());
  }

  late final _$initPagamentoAsyncAction =
      AsyncAction('PagamentosStoreBase.initPagamento', context: context);

  @override
  Future<void> initPagamento() {
    return _$initPagamentoAsyncAction.run(() => super.initPagamento());
  }

  late final _$initPixAsyncAction =
      AsyncAction('PagamentosStoreBase.initPix', context: context);

  @override
  Future<void> initPix() {
    return _$initPixAsyncAction.run(() => super.initPix());
  }

  late final _$initMyCardsAsyncAction =
      AsyncAction('PagamentosStoreBase.initMyCards', context: context);

  @override
  Future<void> initMyCards() {
    return _$initMyCardsAsyncAction.run(() => super.initMyCards());
  }

  late final _$getCreditCardsAsyncAction =
      AsyncAction('PagamentosStoreBase.getCreditCards', context: context);

  @override
  Future<void> getCreditCards() {
    return _$getCreditCardsAsyncAction.run(() => super.getCreditCards());
  }

  late final _$deleteCardAsyncAction =
      AsyncAction('PagamentosStoreBase.deleteCard', context: context);

  @override
  Future<bool> deleteCard(int? cardId) {
    return _$deleteCardAsyncAction.run(() => super.deleteCard(cardId));
  }

  late final _$payWithCreditCardAsyncAction =
      AsyncAction('PagamentosStoreBase.payWithCreditCard', context: context);

  @override
  Future<bool> payWithCreditCard() {
    return _$payWithCreditCardAsyncAction.run(() => super.payWithCreditCard());
  }

  late final _$initCreditCardFormAsyncAction =
      AsyncAction('PagamentosStoreBase.initCreditCardForm', context: context);

  @override
  Future<void> initCreditCardForm(int? id) {
    return _$initCreditCardFormAsyncAction
        .run(() => super.initCreditCardForm(id));
  }

  late final _$saveCardAsyncAction =
      AsyncAction('PagamentosStoreBase.saveCard', context: context);

  @override
  Future<bool> saveCard() {
    return _$saveCardAsyncAction.run(() => super.saveCard());
  }

  late final _$initCreditCardAsyncAction =
      AsyncAction('PagamentosStoreBase.initCreditCard', context: context);

  @override
  Future<void> initCreditCard() {
    return _$initCreditCardAsyncAction.run(() => super.initCreditCard());
  }

  late final _$PagamentosStoreBaseActionController =
      ActionController(name: 'PagamentosStoreBase', context: context);

  @override
  void setOnlyOpened(bool b) {
    final _$actionInfo = _$PagamentosStoreBaseActionController.startAction(
        name: 'PagamentosStoreBase.setOnlyOpened');
    try {
      return super.setOnlyOpened(b);
    } finally {
      _$PagamentosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectPayment(SimpleSelectableCard<PaymentModel> payment) {
    final _$actionInfo = _$PagamentosStoreBaseActionController.startAction(
        name: 'PagamentosStoreBase.selectPayment');
    try {
      return super.selectPayment(payment);
    } finally {
      _$PagamentosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$PagamentosStoreBaseActionController.startAction(
        name: 'PagamentosStoreBase.reset');
    try {
      return super.reset();
    } finally {
      _$PagamentosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetPagamento() {
    final _$actionInfo = _$PagamentosStoreBaseActionController.startAction(
        name: 'PagamentosStoreBase.resetPagamento');
    try {
      return super.resetPagamento();
    } finally {
      _$PagamentosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetPix() {
    final _$actionInfo = _$PagamentosStoreBaseActionController.startAction(
        name: 'PagamentosStoreBase.resetPix');
    try {
      return super.resetPix();
    } finally {
      _$PagamentosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectCard(CreditCardModel? c) {
    final _$actionInfo = _$PagamentosStoreBaseActionController.startAction(
        name: 'PagamentosStoreBase.selectCard');
    try {
      return super.selectCard(c);
    } finally {
      _$PagamentosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetMyCards() {
    final _$actionInfo = _$PagamentosStoreBaseActionController.startAction(
        name: 'PagamentosStoreBase.resetMyCards');
    try {
      return super.resetMyCards();
    } finally {
      _$PagamentosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCardNumber(String v) {
    final _$actionInfo = _$PagamentosStoreBaseActionController.startAction(
        name: 'PagamentosStoreBase.setCardNumber');
    try {
      return super.setCardNumber(v);
    } finally {
      _$PagamentosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExpiryDate(String v) {
    final _$actionInfo = _$PagamentosStoreBaseActionController.startAction(
        name: 'PagamentosStoreBase.setExpiryDate');
    try {
      return super.setExpiryDate(v);
    } finally {
      _$PagamentosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCardHolderName(String v) {
    final _$actionInfo = _$PagamentosStoreBaseActionController.startAction(
        name: 'PagamentosStoreBase.setCardHolderName');
    try {
      return super.setCardHolderName(v);
    } finally {
      _$PagamentosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCvvCode(String v) {
    final _$actionInfo = _$PagamentosStoreBaseActionController.startAction(
        name: 'PagamentosStoreBase.setCvvCode');
    try {
      return super.setCvvCode(v);
    } finally {
      _$PagamentosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCvvFocused(bool v) {
    final _$actionInfo = _$PagamentosStoreBaseActionController.startAction(
        name: 'PagamentosStoreBase.setCvvFocused');
    try {
      return super.setCvvFocused(v);
    } finally {
      _$PagamentosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetCreditCardForm() {
    final _$actionInfo = _$PagamentosStoreBaseActionController.startAction(
        name: 'PagamentosStoreBase.resetCreditCardForm');
    try {
      return super.resetCreditCardForm();
    } finally {
      _$PagamentosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetCreditCard() {
    final _$actionInfo = _$PagamentosStoreBaseActionController.startAction(
        name: 'PagamentosStoreBase.resetCreditCard');
    try {
      return super.resetCreditCard();
    } finally {
      _$PagamentosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
payments: ${payments},
selectedPayments: ${selectedPayments},
onlyOpened: ${onlyOpened},
pixDuration: ${pixDuration},
pixCode: ${pixCode},
myCards: ${myCards},
selectedCard: ${selectedCard},
cardId: ${cardId},
cardNumber: ${cardNumber},
expiryDate: ${expiryDate},
cardHolderName: ${cardHolderName},
cvvCode: ${cvvCode},
cvvFocused: ${cvvFocused}
    ''';
  }
}
