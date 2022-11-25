import 'dart:io';

import 'Exceptions/bank_controller_exceptions.dart';
import 'controllers/bank_controller.dart';
import 'models/account.dart';

void main() {
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
    if(result){
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
    print('O usuário de ID ${e.idSender} tentou enviar ${e.amount}, porém em sua conta possui apenas ${e.senderBalance}');
  }
}
