import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // これはあなたのアプリケーションのテーマです。
        //  flutter run」であなたのアプリケーションを実行してみてください。を見ることができるはずです。
        //  のアプリケーションは、ツールバーが青くなっています。次に、アプリを終了せずに、以下を試してみてください。
        // 下のprimarySwatchをColors.greenに変更し、起動します。
        //  "hot reload"（"flutter run "を実行したコンソールで "r "を押してください、
        // または単に変更を保存してFlutter IDEで「ホットリロード」する）。
        // カウンタがゼロにリセットされなかったことに注目してください；アプリケーションは再起動されていません。
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // このウィジェットは，アプリケーションのホームページとなります．このウィジェットはステートフルで、つまり
  // Stateオブジェクト（以下に定義）を持ち、そのオブジェクトに影響を与えるフィールドがあること。
  // どのように見えるか
  // このクラスは、状態の設定です。値を保持します（この場合親（この場合、Appウィジェット）が提供する // タイトル）と
  // Stateのbuildメソッドで使用されます。Widgetサブクラス内のフィールドは
  // 常に "final "と表示される。

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // このsetStateの呼び出しは、Flutterフレームワークに何かが起こったことを伝えます。
      // このStateで変更があったため、以下のビルドメソッドを再実行する。
      // 更新された値をディスプレイに反映させることができるようにします。もし私たちが
      // setState() を呼び出さずに_counter を呼び出すと、ビルドメソッドに失敗します。
      // 再び呼び出されたので、何も起こらないように見えるだろう。
      _counter++;
    });
    // _counter++;
  }

  @override
  Widget build(BuildContext context) {
    // このメソッドは、setStateが呼ばれるたびに再実行されます。
    // 上記の_incrementCounterメソッドによって、Flutterフレームワークは、ビルドメソッドを再実行するように最適化されています。
    // 更新が必要なものはすぐにリビルドできるように、 高速に処理します。
    // ウィジェットのインスタンスを個別に変更する必要がない。
    return Scaffold(
      appBar: AppBar(
        //  ここでは、App.buildメソッドで作成されたMyHomePageオブジェクトから値を取得し、それを使ってappbarのタイトルを設定しています。
        title: Text(widget.title),
      ),
      body: Center(
        // Centerは、レイアウトウィジェットです。子を1つ取り、親の真ん中に配置します。
        child: Column(
          // Columnはレイアウトウィジェットで、子ウィジェットを垂直に配置します。
          // デフォルトでは、子ウィジェットに合わせて自身の横幅を決定し、
          // 親ウィジェットの高さに合わせようとします。

          // ウィジェットのワイヤーフレームを見るには、コンソールで "p" を押して、
          //Android StudioのFlutter Inspectorで "Toggle Debug Paint" アクションを選択するか、
          //Visual Studio Codeで "Toggle Debug Paint" コマンドを実行してください。

          // Columnには、自身 のサイズや子ウィジェットの配置方法を制御するためのさまざまなプロパティがあります。
          // ここでは、mainAxisAlignmentを使用して子ウィジェットを垂直方向に中央に配置しています。
          // 主軸はここでは垂直方向であり、Columnは垂直方向に並べるものです（交差軸は水平方向になります）。
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
