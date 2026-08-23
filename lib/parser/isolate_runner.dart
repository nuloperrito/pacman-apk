// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:async';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:synchronized/synchronized.dart';
import 'package:meta/meta.dart';

class _IsolateMessage<E extends Enum> {
  final E flag;
  final bool value;
  _IsolateMessage(this.flag, this.value);
}

class _IsolateInitData<O> {
  final O data;
  final SendPort isolateToUiPort;
  _IsolateInitData(this.data, this.isolateToUiPort);
}

class _IsolateData<O, FLAGS extends Enum> {
  O? data;
  Completer<SendPort>? _uiToIsolatePortCompleter;
  SendPort? _uiToIsolatePort;
  late final SendPort _isolateToUiPort;
  
  _IsolateData._withCompleter(this.data, final Completer<SendPort> portCompleter) 
      : _uiToIsolatePortCompleter = portCompleter, 
        _isolateToUiPort = (ReceivePort()..listen((message) {
          if (message is VoidCallback) {message();}
          else if (message is SendPort) {portCompleter.complete(message);}
        })).sendPort;

  _IsolateData(O data) : this._withCompleter(data, Completer());
  
  _IsolateData.forIsolate(this._isolateToUiPort); 

  void _executeInUi(VoidCallback callback) {
    _isolateToUiPort.send(callback);
  }
  void _sendToIsolate(_IsolateMessage<FLAGS> a) async {
    (_uiToIsolatePort ?? (_uiToIsolatePort = await _uiToIsolatePortCompleter!.future)).send(a);
  }
}

class IsolateRef<O, FLAGS extends Enum> {
  final _IsolateData<O, FLAGS> _data;
  IsolateRef._(this._data);

  void sendFlag(FLAGS flag, bool value) => _data._sendToIsolate(_IsolateMessage(flag, value));
}

abstract class IsolateRunner<O, FLAGS extends Enum> {
  static late final _flags = <Enum, Completer<bool>>{};
  static late final _flagsLock = Lock();
  static late final dynamic _data;
  static late final _IsolateData _pData;

  @nonVirtual O get data => _data;
  @visibleForOverriding FutureOr<void> run();
  FutureOr<void> postStartCallback(IsolateRef<O, FLAGS> isolate) {}
  @nonVirtual Future<bool> waitFlag(FLAGS flag) async => await (await _flagsLock.synchronized(()=>_flags.putIfAbsent(flag, ()=>Completer()))).future;
  @nonVirtual void executeInUi(VoidCallback callback) => _pData._executeInUi(callback);

  void _runInitIsolate(_IsolateInitData<O> initData) async {
    _pData = _IsolateData<O, FLAGS>.forIsolate(initData.isolateToUiPort);
    _pData._isolateToUiPort.send((ReceivePort()..listen((message) {
      if (message is _IsolateMessage<FLAGS>) _flagsLock.synchronized(() {
        _flags.putIfAbsent(message.flag, ()=>Completer()).complete(message.value);
      });
    })).sendPort);
    _data = initData.data;
    await run();
  }

  @nonVirtual
  IsolateRef<O, FLAGS> start(O data) => IsolateRunner._start(this, data);

  static IsolateRef<O, FLAGS> _start<O, FLAGS extends Enum>(IsolateRunner<O, FLAGS> runner, O data) {
    final isolateRef = IsolateRef._(_IsolateData<O, FLAGS>(data));
    compute(runner._runInitIsolate, _IsolateInitData<O>(data, isolateRef._data._isolateToUiPort));
    runner.postStartCallback(isolateRef);
    return isolateRef;
  }
}