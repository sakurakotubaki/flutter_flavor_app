import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // このウィジェットはアプリケーションのルートです。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // これはアプリケーションのテーマです。
        //
        // これを試してみてください： flutter run "でアプリケーションを実行してみてください。すると
        // アプリケーションには青いツールバーがあります。次に、アプリを終了せずに
        // 下のcolorSchemeのseedColorをColors.greenに変更してみてください。
        // アプリを終了せずに、 // 以下のcolorSchemeのseedColorをColors.greenに変更してみてください。
        // を押すか、コマンドラインを使った場合は "r "を押してください。
        // を押す)。
        //
        // カウンタがゼロにリセットされなかったことに注目してください。
        // アプリケーションの状態はリロード中に失われません。状態をリセットするには、代わりにhot
        // 再起動を使用してください。
        //
        // これは値だけでなく、コードにも有効です： ほとんどのコード変更は
        // ほとんどのコード変更はホットリロードだけでテストできる。
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // このウィジェットはアプリケーションのホームページです。ステートフルです。
  // つまり、ステートフルです。
  // どのように見えるかに影響するフィールドを含みます。

  // このクラスは、ステートの設定です。このクラスは状態の設定です。
  // 親ウィジェット（この場合は App ウィジェット）から提供された値（この場合はタイトル）を保持し、 // App ウィジェットのビルドメソッドで使用されます。
  // ステートのビルドメソッドで使用されます。Widget サブクラスのフィールドは
  // 常に "final" とマークされます。

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // このsetStateの呼び出しは、Flutterフレームワークに、このStateで何かが変更されたことを // 伝える。
      // これにより、以下のビルドメソッドを再実行する。
      // これにより、以下のビルドメソッドが再実行され、更新された値がディスプレイに反映されます。もし
      // setState()を呼び出さずに__counterを変更した場合、ビルドメソッドは // 再度呼び出されない。
      // そのため、何も起こらないように見える。
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // このメソッドは、setStateが呼ばれるたびに再実行される。
    // 上記の_incrementCounterメソッドによって実行される。
    //
    // Flutterフレームワークはビルドメソッドの再実行を高速化するように最適化されている。
    // 更新が必要なものは、個別にインスタンスを変更するのではなく // 再構築すればよい。
    // ウィジェットのインスタンスを個別に変更する必要はなく、更新が必要なものを再構築するだけでよい。
    return Scaffold(
      appBar: AppBar(
        // これを試してください： ここの色を特定の色に変更してみてください。
        // を特定の色に変更してみてください。
        // の色を変更してみてください。
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // ここでは、App.buildメソッドで作成されたMyHomePageオブジェクトから // 値を取り出し、それを使ってappbarのタイトルを設定する。
        // App.buildメソッドによって作成されたMyHomePageオブジェクトから値を取得し、それを使用してappbarのタイ トルを設定します。
        title: Text(widget.title),
      ),
      body: Center(
        // センターはレイアウトウィジェットです。子ウィジェットを1つ取り
        // 配置します。
        child: Column(
          // カラムもレイアウト・ウィジェットです。子ウィジェットのリストを受け取り
          // 縦に並べます。デフォルトでは
          // 親と同じ高さになるようにします。
          //
          // カラムは、それ自身のサイズと // 子の位置を制御するためのさまざまなプロパティを持っています。
          // どのようにその子を配置するかを制御するための様々なプロパティがあります。ここでは、mainAxisAlignment を使用して、 // 子を垂直に中央に配置します。
          // 主軸は垂直軸です。
          // 主軸は垂直軸です。
          // 主軸は垂直軸です。）
          //
          // これを試してください： デバッグペイント」を起動します（IDEで "Toggle Debug Paint "アクションを選択するか、 // "p "キーを押します）。
          // IDE で "Toggle Debug Paint" アクションを選択するか、コンソールで "p" を押します）。
          // 各ウィジェットのワイヤーフレームを見ることができます。
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
      ), // この末尾のカンマによって、ビルド・メソッドの自動書式設定がよりスムーズになる。
    );
  }
}