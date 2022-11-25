void StackStart() {
  print('Started main');
  functionOne();
  print('Finished main');
}

void functionOne() {
  print('Started FO1');
  try {
    functionTwo();
  } on FormatException catch (e) {
    print('foi capturada dentro da FO1');
    print(e.message);
    print(e.source);
  }

  // on IOException catch(e){
  //   print('foi capturada uma IOException');
  //   e.toString();
  // }

  // on HttpException catch (e) {
  //   e.toString();
  // }
  catch (exception, stackTrace) {
    print(exception);
    print(stackTrace);
  } finally {
    print('finally');
  }
  print('Finished F01');
}

void functionTwo() {
  print('Started F02');
  for (int i = 1; i <= 5; i++) {
    print(i);
    double amount = double.parse('not a nmumber');
  }
  print('Finished F02');
}
