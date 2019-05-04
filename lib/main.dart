import 'package:flutter/material.dart';

void main() => runApp(MyStatefulWidget(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          body: Column(children: [
            WidgetA(),
            WidgetB(),
            WidgetC(),
          ]),
        ),
      ),
    ));

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  State createState() => _MyState();
}

// _MyInheritedWidget の定義
class _MyInheritedWidget extends InheritedWidget {
  const _MyInheritedWidget({
    Key key,
    @required Widget child,
    @required this.value,
  }) : super(key: key, child: child);
  final int value; // xの値を受け取って、InheritedWidget 内で保持するための枠
  static _MyInheritedWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(_MyInheritedWidget)
        as _MyInheritedWidget;
  }

  // value値が変更された場合に、傘下のWidgetに更新を通知する。これがfalseの時は更新されない。
  @override
  bool updateShouldNotify(_MyInheritedWidget old) => old.value != value;
}

class _MyState extends State<MyStatefulWidget> {
  int _x = 0;

  int get x => _x;

  void increment() {
    setState(() {
      _x++;
    });
  }

  static _MyState of(BuildContext context) {
    return context.ancestorStateOfType(TypeMatcher<_MyState>());
  }

  @override
  Widget build(BuildContext context) {
    print("_MyAppState.build() is called!! x:$x");
    // _MyInheritedWidget のインスタンスを作り直して return する
    return _MyInheritedWidget(
      value: x, // _MyStateが保持しているxの値を、新しく作るInheritedWidgetインスタンスに渡す
      child: widget.child, // MyStatefulWidgetが保持しているWidgetツリーを使いまわす
    );
  }
}

class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("AAA WidgetA.build() is called!!!!");
    return RaisedButton(
      child: Text("WidgetA is the incrementer"),
      onPressed: () {
        _MyState.of(context).increment();
      },
    );
  }
}

class WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("BBB WidgetB.build() is called!!!!");
    return Text("This is the constant WidgetB");
  }
}

class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 値の参照先を _MyState ではなく _MyInheritedWidget にする
    final int x = _MyInheritedWidget.of(context).value;
    print("CCC WidgetC.build() is called!!!!");
    return Text("Widget C x: $x");
  }
}
