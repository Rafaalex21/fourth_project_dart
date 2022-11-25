import 'dart:io';
import 'dart:math';

import 'Exceptions/bank_controller_exceptions.dart';
import 'controllers/bank_controller.dart';
import 'models/account.dart';

void testingNullSafety() {
  Account? myAccount ;

  //simulando comunicação externa

  Random rng = Random();
  int randomNumber = rng.nextInt(10);
  if (randomNumber <= 5){
    myAccount = Account(name: 'Rafael3', balance: 100, isAuthenticated: true);

  }

  print(myAccount.runtimeType);

  if(myAccount != null){
    print(myAccount.balance);
  }
}

void main() {
  testingNullSafety();

  // assert(2<1, 'levantei o assert');
  // criando banco
  BankController bankController = BankController();
  //adicionando conta

  bankController.addAccount(
      id: 'Rafael',
      account: Account(name: 'Rafael', balance: 800, isAuthenticated: true));

  bankController.addAccount(
      id: 'Rafael2',
      account: Account(name: 'Primo', balance: 42069, isAuthenticated: true));

  //fazendo transferencia
  try {
    bool result = bankController.makeTransfer(
        idSender: 'Rafael2', idReceiver: 'Rafael111', amount: 69);
    //result
    if (result) {
      print('transação concluida com sucesso');
    }
  } on SenderIdInvalidException catch (e) {
    print('O ID ${e.idSender} do remetente não é um id valido');
    print(e);
  } on ReceiverIdInvalidException catch (e) {
    print('O ID ${e.idReceiver} do destinatário não é um id valido');
  } on SenderNotAuthenticatedException catch (e) {
    print('O ID de remetente ${e.idSender} não foi autenticado');
  } on SenderBalanceLowerThanAmountException catch (e) {
    print(
        'O usuário de ID ${e.idSender} tentou enviar ${e.amount}, porém em sua conta possui apenas ${e.senderBalance}');
  }
}
