import 'package:bloc/bloc.dart';
import 'package:bloc_basic/bloc/counter_event.dart';
import 'package:bloc_basic/bloc/counter_state.dart';

class CounterBloc extends Bloc<Counterevent,CounterState>{
   //: is initializer here the constructor of Bloc i.e. super() will initialize
 //to the Constructor of it's subclass
 //in dart super class structure is like
 // class Bloc<Event,State>{//meaning the constructor of parent class requird one
 //argument that we pass above simple
 // State state;
  //Bloc(this.state);
  //important concept  suppose we have one saving account
  // class SavingAccount{
  //   int _balance;
  //   SavingAccount(int balance){
  //     _balance = balance;
  //   }

  //   or remove {} by using :
  //   SavingAccount(int balance):_balance = balance;
    


  // }

 CounterBloc():super(CounterState(0)){
  //like Bloc(CounterState())
  on<Incrementer>((event, emit) {
    emit(CounterState(state.countNum+1));
    //here *state is the current state of bloc
    //emit will emit the new state


  });
  on<Decrementer>((event, emit) {
    emit(CounterState(state.countNum-1));

  });



 }

 

  
  

  
}
  


