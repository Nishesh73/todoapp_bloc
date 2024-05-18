import 'package:bloc_basic/bloc/counter_bloc.dart';
import 'package:bloc_basic/bloc/counter_event.dart';
import 'package:bloc_basic/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Counterclass extends StatefulWidget {
  const Counterclass({super.key});

  @override
  State<Counterclass> createState() => _CounterclassState();
}

class _CounterclassState extends State<Counterclass> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) {
       return CounterBloc();
      },

      child: Scaffold(
        body: BlocBuilder<CounterBloc,CounterState>(
          builder: (context, state) {
            
          
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                
            Text("${state.countNum.toString()}", style: TextStyle(fontSize: 55),),
            //state emit data
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(Incrementer());
                //adding event


              }, child: Text("+", style: TextStyle(fontSize: 55),)),
              SizedBox(width: 10,),
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(Decrementer());
                //adding event
              }, child: Text("-", style: TextStyle(fontSize: 55),),
                
            )  ],),
                
                
          ],
          
          );
  }

        ),

      
      ),
    );
  }
}