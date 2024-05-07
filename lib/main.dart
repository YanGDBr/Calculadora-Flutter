import 'package:function_tree/function_tree.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      home: Calc(),
    );
  }
}

class Calc extends StatefulWidget {
  const Calc({super.key});

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  String conta = '';
  bool paren = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromARGB(255, 22, 22, 22),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 0.3 * MediaQuery.of(context).size.height,
                  color: const Color.fromARGB(255, 22, 22, 22),
                  padding: EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      conta,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  )),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 0.1 * MediaQuery.of(context).size.height,
                color: const Color.fromARGB(255, 22, 22, 22),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      if(conta.substring(conta.length - 1, conta.length) == '('){
                        paren = true;
                      }
                      else if(conta.substring(conta.length - 1, conta.length) == ')'){
                        paren = false;
                      }
                      setState(() {
                        conta = conta.substring(0, conta.length - 1);
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 22, 22, 22),
                        ),
                        surfaceTintColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 22, 22, 22)),
                        elevation: MaterialStateProperty.all(0)),
                    child: const Icon(
                      Icons.backspace,
                      color: Color.fromARGB(255, 113, 219, 52),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 0.6 * MediaQuery.of(context).size.height,
                color: const Color.fromARGB(255, 22, 22, 22),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 0.23 * MediaQuery.of(context).size.width,
                            height: 0.09 * MediaQuery.of(context).size.height,
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    conta = '';
                                  });
                                },
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all(CircleBorder()),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 56, 55, 55)),
                                  surfaceTintColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                child: Text(
                                  'C',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 28),
                                )),
                          ),
                          SizedBox(
                            width: 0.23 * MediaQuery.of(context).size.width,
                            height: 0.09 * MediaQuery.of(context).size.height,
                            child: ElevatedButton(
                                onPressed: () {
                                  var allowed = {',', '0', '1', '2', '3', '4','5', '6', '7', '8', '9', ')'};
                                  if (conta == '') {
                                    if (paren) {
                                      paren = false;
                                      setState(() {
                                        conta += '(';
                                      });
                                    } else {
                                      paren = true;
                                      setState(() {
                                        conta += ')';
                                      });
                                      conta = conta.replaceAll('()', '');
                                    }
                                  }
                                  else if (allowed.contains(conta.substring(conta.length - 1, conta.length))) {
                                    if(!paren){
                                      paren = true;
                                      setState(() {
                                        conta += ')';
                                      });
                                      conta = conta.replaceAll('()', '');
                                    }
                                  }
                                  else {
                                    if (paren) {
                                      paren = false;
                                      setState(() {
                                        conta += '(';
                                      });
                                      
                                    } else {
                                      paren = true;
                                      setState(() {
                                        conta += ')';
                                      });
                                      conta = conta.replaceAll('()', '');

                                    }
                                  }
                                },
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all(CircleBorder()),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 56, 55, 55)),
                                  surfaceTintColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                child: Text(
                                  '()',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 28),
                                )),
                          ),
                          SizedBox(
                            width: 0.23 * MediaQuery.of(context).size.width,
                            height: 0.09 * MediaQuery.of(context).size.height,
                            child: ElevatedButton(
                                onPressed: () {
                                  var allowed = {'%', 'x', '+', '-', ',', '÷', '('};
                                  if (allowed.contains(conta.substring(
                                      conta.length - 1, conta.length))) {
                                  } else {
                                    setState(() {
                                      conta += '%';
                                    });
                                  }
                                },
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all(CircleBorder()),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 56, 55, 55)),
                                  surfaceTintColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                child: Text(
                                  '%',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 28),
                                )),
                          ),
                          SizedBox(
                            width: 0.23 * MediaQuery.of(context).size.width,
                            height: 0.09 * MediaQuery.of(context).size.height,
                            child: ElevatedButton(
                                onPressed: () {
                                  var allowed = {'%', 'x', '+', '-', ',', '÷', '('};
                                  if (allowed.contains(conta.substring(
                                      conta.length - 1, conta.length))) {
                                  } else {
                                    setState(() {
                                      conta += '÷';
                                    });
                                  }
                                },
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all(CircleBorder()),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 56, 55, 55)),
                                  surfaceTintColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                child: Text(
                                  '÷',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 33),
                                )),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 0.23 * MediaQuery.of(context).size.width,
                            height: 0.09 * MediaQuery.of(context).size.height,
                            child: ElevatedButton(
                                onPressed: () {
                                  var allowed = {')'};
                                  try{
                                    if (allowed.contains(conta.substring(
                                      conta.length - 1, conta.length))) {
                                  } else {
                                    setState(() {
                                      conta += '1';
                                    });
                                  }
                                  } catch(e) {
                                    setState(() {
                                      conta += '1';
                                    });
                                  }
                                  
                                  
                                },
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all(CircleBorder()),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 56, 55, 55)),
                                  surfaceTintColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 28),
                                )),
                          ),
                          SizedBox(
                            width: 0.23 * MediaQuery.of(context).size.width,
                            height: 0.09 * MediaQuery.of(context).size.height,
                            child: ElevatedButton(
                                onPressed: () {
                                  var allowed = {')'};
                                  try{
                                    if (allowed.contains(conta.substring(
                                      conta.length - 1, conta.length))) {
                                  } else {
                                    setState(() {
                                      conta += '2';
                                    });
                                  }
                                  } catch(e) {
                                    setState(() {
                                      conta += '2';
                                    });
                                  }
                                  
                                },
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all(CircleBorder()),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 56, 55, 55)),
                                  surfaceTintColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 28),
                                )),
                          ),
                          SizedBox(
                            width: 0.23 * MediaQuery.of(context).size.width,
                            height: 0.09 * MediaQuery.of(context).size.height,
                            child: ElevatedButton(
                                onPressed: () {
                                  var allowed = {')'};
                                  try{
                                    if (allowed.contains(conta.substring(
                                      conta.length - 1, conta.length))) {
                                  } else {
                                    setState(() {
                                      conta += '3';
                                    });
                                  }
                                  } catch(e) {
                                    setState(() {
                                      conta += '3';
                                    });
                                  }
                                  
                                },
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all(CircleBorder()),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 56, 55, 55)),
                                  surfaceTintColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 28),
                                )),
                          ),
                          SizedBox(
                            width: 0.23 * MediaQuery.of(context).size.width,
                            height: 0.09 * MediaQuery.of(context).size.height,
                            child: ElevatedButton(
                                onPressed: () {
                                  var allowed = {'%', 'x', '+', '-', ',', '÷', '('};
                                  if (allowed.contains(conta.substring(
                                      conta.length - 1, conta.length))) {
                                  } else {
                                    setState(() {
                                      conta += 'x';
                                    });
                                  }
                                },
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all(CircleBorder()),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 56, 55, 55)),
                                  surfaceTintColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                child: Text(
                                  'X',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 33),
                                )),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 0.23 * MediaQuery.of(context).size.width,
                            height: 0.09 * MediaQuery.of(context).size.height,
                            child: ElevatedButton(
                                onPressed: () {
                                  var allowed = {')'};
                                  try{
                                    if (allowed.contains(conta.substring(
                                      conta.length - 1, conta.length))) {
                                  } else {
                                    setState(() {
                                      conta += '4';
                                    });
                                  }
                                  } catch(e) {
                                    setState(() {
                                      conta += '4';
                                    });
                                  }
                                  
                                },
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all(CircleBorder()),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 56, 55, 55)),
                                  surfaceTintColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                child: Text(
                                  '4',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 28),
                                )),
                          ),
                          SizedBox(
                            width: 0.23 * MediaQuery.of(context).size.width,
                            height: 0.09 * MediaQuery.of(context).size.height,
                            child: ElevatedButton(
                                onPressed: () {
                                  var allowed = {')'};
                                  try{
                                    if (allowed.contains(conta.substring(
                                      conta.length - 1, conta.length))) {
                                  } else {
                                    setState(() {
                                      conta += '5';
                                    });
                                  }
                                  } catch(e) {
                                    setState(() {
                                      conta += '5';
                                    });
                                  }
                                  
                                },
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all(CircleBorder()),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 56, 55, 55)),
                                  surfaceTintColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                child: Text(
                                  '5',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 28),
                                )),
                          ),
                          SizedBox(
                            width: 0.23 * MediaQuery.of(context).size.width,
                            height: 0.09 * MediaQuery.of(context).size.height,
                            child: ElevatedButton(
                                onPressed: () {
                                  var allowed = {')'};
                                  try{
                                    if (allowed.contains(conta.substring(
                                      conta.length - 1, conta.length))) {
                                  } else {
                                    setState(() {
                                      conta += '6';
                                    });
                                  }
                                  } catch(e) {
                                    setState(() {
                                      conta += '6';
                                    });
                                  }
                                  
                                },
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all(CircleBorder()),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 56, 55, 55)),
                                  surfaceTintColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                child: Text(
                                  '6',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 28),
                                )),
                          ),
                          SizedBox(
                            width: 0.23 * MediaQuery.of(context).size.width,
                            height: 0.09 * MediaQuery.of(context).size.height,
                            child: ElevatedButton(
                                onPressed: () {
                                  var allowed = {'%', 'x', '+', '-', ',', '÷'};
                                  if (allowed.contains(conta.substring(
                                      conta.length - 1, conta.length))) {
                                  } else {
                                    setState(() {
                                      conta += '-';
                                    });
                                  }
                                },
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all(CircleBorder()),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 56, 55, 55)),
                                  surfaceTintColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 50),
                                )),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 0.23 * MediaQuery.of(context).size.width,
                            height: 0.09 * MediaQuery.of(context).size.height,
                            child: ElevatedButton(
                                onPressed: () {
                                  var allowed = {')'};
                                  try{
                                    if (allowed.contains(conta.substring(
                                      conta.length - 1, conta.length))) {
                                  } else {
                                    setState(() {
                                      conta += '7';
                                    });
                                  }
                                  } catch(e) {
                                    setState(() {
                                      conta += '7';
                                    });
                                  }
                                  
                                },
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all(CircleBorder()),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 56, 55, 55)),
                                  surfaceTintColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                child: Text(
                                  '7',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 28),
                                )),
                          ),
                          SizedBox(
                            width: 0.23 * MediaQuery.of(context).size.width,
                            height: 0.09 * MediaQuery.of(context).size.height,
                            child: ElevatedButton(
                                onPressed: () {
                                  var allowed = {')'};
                                  try{
                                    if (allowed.contains(conta.substring(
                                      conta.length - 1, conta.length))) {
                                  } else {
                                    setState(() {
                                      conta += '8';
                                    });
                                  }
                                  } catch(e) {
                                    setState(() {
                                      conta += '8';
                                    });
                                  }
                                },
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all(CircleBorder()),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 56, 55, 55)),
                                  surfaceTintColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                child: Text(
                                  '8',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 28),
                                )),
                          ),
                          SizedBox(
                            width: 0.23 * MediaQuery.of(context).size.width,
                            height: 0.09 * MediaQuery.of(context).size.height,
                            child: ElevatedButton(
                                onPressed: () {
                                  var allowed = {')'};
                                  try{
                                    if (allowed.contains(conta.substring(
                                      conta.length - 1, conta.length))) {
                                  } else {
                                    setState(() {
                                      conta += '9';
                                    });
                                  }
                                  } catch(e) {
                                    setState(() {
                                      conta += '9';
                                    });
                                  }
                                },
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all(CircleBorder()),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 56, 55, 55)),
                                  surfaceTintColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                child: Text(
                                  '9',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 28),
                                )),
                          ),
                          SizedBox(
                            width: 0.23 * MediaQuery.of(context).size.width,
                            height: 0.09 * MediaQuery.of(context).size.height,
                            child: ElevatedButton(
                                onPressed: () {
                                  var allowed = {'%', 'x', '+', '-', ',', '÷', '('};
                                  if (allowed.contains(conta.substring(
                                      conta.length - 1, conta.length))) {
                                  } else {
                                    setState(() {
                                      conta += '+';
                                    });
                                  }
                                },
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all(CircleBorder()),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 56, 55, 55)),
                                  surfaceTintColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 33),
                                )),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 0.23 * MediaQuery.of(context).size.width,
                            height: 0.09 * MediaQuery.of(context).size.height,
                            child: ElevatedButton(
                                onPressed: () {
                                  var last = -1;
                                  var allowed = {'%', 'x', '+', '-', '÷', '('};
                                  for (var i = conta.length - 1; i >= 0; i--) {
                                    if (allowed.contains(conta[i])) {
                                      last = i + 1;
                                      break;
                                    }
                                  }
                                  if (last == -1 || last == 1) {
                                    if (conta.substring(0,1) == '-') {
                                      setState(() {
                                      conta = conta.substring(1,conta.length);
                                    });
                                    } else {
                                      setState(() {
                                      conta = '-' + conta;
                                    });
                                    }
                                    
                                  } else {
                                    
                                    var resto = conta.substring(last, conta.length);
                                    
                                    if (resto != '') {
                                      var lastindex = conta.lastIndexOf(resto);
                                      if(conta.substring(lastindex-1, lastindex) == '-'){
                                        var temp = conta.substring(lastindex, conta.length - 1);
                                        if(conta.substring(conta.length - 1, conta.length) != ')'){
                                          temp = conta.substring(lastindex, conta.length);
                                          paren = true;
                                        }
                                        setState(() {
                                          conta = conta.substring(0, lastindex-2) + temp;
                                        });

                                      } else {
                                        setState(() {
                                          conta = conta.substring(0, lastindex) + '(-' + conta.substring(lastindex, conta.length)+')';
                                            
                                      });
                                      }
                                     
                                    }
                                  }
                                },
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all(CircleBorder()),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 56, 55, 55)),
                                  surfaceTintColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                child: Text(
                                  '+/-',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 28),
                                )),
                          ),
                          SizedBox(
                            width: 0.23 * MediaQuery.of(context).size.width,
                            height: 0.09 * MediaQuery.of(context).size.height,
                            child: ElevatedButton(
                                onPressed: () {
                                  var allowed = {')'};
                                  try{
                                    if (allowed.contains(conta.substring(
                                      conta.length - 1, conta.length))) {
                                  } else {
                                    setState(() {
                                      conta += '0';
                                    });
                                  }
                                  } catch(e) {
                                    setState(() {
                                      conta += '0';
                                    });
                                  }
                                  
                                  
                                },
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all(CircleBorder()),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 56, 55, 55)),
                                  surfaceTintColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                child: Text(
                                  '0',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 28),
                                )),
                          ),
                          SizedBox(
                            width: 0.23 * MediaQuery.of(context).size.width,
                            height: 0.09 * MediaQuery.of(context).size.height,
                            child: ElevatedButton(
                                onPressed: () {
                                  var last = -1;
                                  var allowed = {','};
                                  for (var i = conta.length - 1; i >= 0; i--) {
                                    if (allowed.contains(conta[i])) {
                                      last = i + 1;
                                      break;
                                    }
                                  }

                                  var allowedtwo = {
                                    '%',
                                    'x',
                                    '+',
                                    '-',
                                    ',',
                                    '÷',
                                    '('
                                  };
                                  if (last == -1) {
                                    if (allowedtwo.contains(conta.substring(
                                        conta.length - 1, conta.length))) {
                                    } else {
                                      setState(() {
                                        conta += ',';
                                      });
                                    }
                                  } else {
                                    var temp = conta.substring(last, conta.length);
                                    if(temp.contains('%') || temp.contains('-') || temp.contains('+') || temp.contains('x') || temp.contains('÷')) {
                                      if (allowedtwo.contains(conta.substring(
                                        conta.length - 1, conta.length))) {
                                    } else {
                                      setState(() {
                                        conta += ',';
                                      });
                                    }
                                    }
                                   
                                    
                                  }
                                },
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all(CircleBorder()),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 56, 55, 55)),
                                  surfaceTintColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                child: Text(
                                  ',',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 33),
                                )),
                          ),
                          SizedBox(
                            width: 0.23 * MediaQuery.of(context).size.width,
                            height: 0.09 * MediaQuery.of(context).size.height,
                            child: ElevatedButton(
                                onPressed: () {
                                  conta = conta.replaceAll('x', '*').replaceAll('÷', '/').replaceAll(',', '.');
                                  setState(() {
                                    conta = '${conta.interpret()}'.replaceAll('.0', '').replaceAll('.', ',');
                                  });
                                  
                                },
                                style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all(CircleBorder()),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.green),
                                  surfaceTintColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                child: Text(
                                  '=',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 50),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
