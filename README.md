# Mac環境

- [x] Intel系 Mac
- [x] Arm系 Mac

# 前提とする環境

- Homebrew
- Unity Hub
- Unity（各CPUアーキテクチャに対応したもの）
  - 2021.3.17f1 以降
- Python3.10（pyenvでインストールされたもの）

# インストール方法

本リポジトリを以下のようにクローンします。

```
git clone --recursive https://github.com/toppers/hakoniwa-unity-picomodel.git
```

クローンが終わったら、以下のようにディレクトリ移動します。

```
cd hakoniwa-unity-picomodel/
```

そして、必要な Unity モジュール類をインストールします。

```
 bash install.bash 
```


# Unity起動

この状態で Unity Hub で当該プロジェクトを開きましょう。

注意：Unityエディタは、当該CPUアーキテクチャに対応したものをインストールしてご利用ください。

対象フォルダ：hakoniwa-unity-picomodel\plugin\plugin-srcs

以下のダイアログが出ますが、`Continue` してください。

<img width="526" alt="スクリーンショット 2023-08-05 17 02 16" src="https://github.com/toppers/hakoniwa-unity-ev3model/assets/164193/ade85aee-b08e-4920-b148-ce3ef09f5545">


次に、以下のダイアログが出ますので、`Ignore` してください。

<img width="257" alt="スクリーンショット 2023-08-05 17 03 38" src="https://github.com/toppers/hakoniwa-unity-ev3model/assets/164193/6448e882-b0a3-42c1-8a01-398dbcd450dd">


成功するとこうなります。

<img width="1382" alt="スクリーンショット 2023-08-05 17 05 32" src="https://github.com/toppers/hakoniwa-unity-ev3model/assets/164193/de7c9fec-1bb2-411b-90b1-71e2577b6cf1">

起動直後の状態ですと、コンソール上にたくさんエラーが出ています。原因は以下の２点です。

* gRPC のライブラリ利用箇所がエラー出力している
* Newtonsoft.Json が不足している

順番に対応しましょう。

## gRPC のライブラリ利用箇所がエラー出力している問題の対応

Unityエディタの `Editor/ProjectSettings/Player/ScriptCompilation` を開きます。

![スクリーンショット 2023-08-05 17 11 12](https://github.com/toppers/hakoniwa-unity-ev3model/assets/164193/f3bc26de-2daf-482c-abc3-f891d7f5984e)

上図のように、`NO_USE_GRPC` を追加して `Apply` します。

## Newtonsoft.Json が不足している問題の対応

gRPC の対応をしても、Unityエディタのバージョンによっては、下図のようなエラーが出ている場合があります。

<img width="1046" alt="スクリーンショット 2023-08-05 17 12 38" src="https://github.com/toppers/hakoniwa-unity-ev3model/assets/164193/63e7e31b-80d0-447e-9c77-5555293fa685">

原因は、Newtonsoft.Json が不足しているためです。 

Unityのパッケージマネージャから Newtonsoft.Jsonをインストールすることで解消できます。

`Window/PackageManger`を開き、下図のように、`+` をクリックし、`Add pacakge from git` をクリックします。
`com.unity.nuget.newtonsoft-json` を入力して、`Add` をクリックすると、インストールが始まり、エラーが解消されます。

<img width="794" alt="スクリーンショット 2023-08-05 17 15 16" src="https://github.com/toppers/hakoniwa-unity-ev3model/assets/164193/828e3256-7e8b-4677-92b4-55cbb980db0f">


# シミュレーション環境の準備

下図のように、Unity のシーンをダブルクリックします。

![スクリーンショット 2023-08-28 7 58 37](https://github.com/toppers/hakoniwa-unity-picomodel/assets/164193/d60d2bb2-ee77-441c-aed8-a07a0ada17f4)


そして、`Window/Hakoniwa/Generate` をクリックします。

![スクリーンショット 2023-08-28 7 59 45](https://github.com/toppers/hakoniwa-unity-picomodel/assets/164193/85ab96b7-fd8b-4547-a4a3-c386d0a35813)


成功すると、コンソール上にエラーログ出力がなく、下図のように json のログが出力されています。

![スクリーンショット 2023-08-28 8 00 16](https://github.com/toppers/hakoniwa-unity-picomodel/assets/164193/6fa55a56-1693-4728-b0ef-091e10fb4b22)


# IPアドレスの設定

AR連携するには、`Hakoniwa`と`ARDevice`シーンのIPアドレスを設定する必要があります。

## Hakoniwa

ヒエラルキービューの`AR`をクリックします。

![スクリーンショット 2024-01-23 6 46 50](https://github.com/toppers/hakoniwa-unity-picomodel/assets/164193/33161c8c-ced0-41fb-9c7d-a6cbd2dd3603)

インスペクタービューの`Server_ipaddr`と`Client_ipaddr`を設定します。

![スクリーンショット 2024-01-23 6 47 26](https://github.com/toppers/hakoniwa-unity-picomodel/assets/164193/85b78909-48fa-4815-887b-6ad02eedf805)


* Server_ipaddr: パソコンのIPアドレス
* Client_ipaddr: AR端末のIPアドレス

## ARDevice

ヒエラルキービューの`AR`をクリックします。

![スクリーンショット 2024-01-23 6 48 56](https://github.com/toppers/hakoniwa-unity-picomodel/assets/164193/8b23dc3e-36b5-40f5-b36b-6abfcb40923a)

インスペクタービューの`Server_ipaddr`と`Client_ipaddr`を設定します。

![スクリーンショット 2024-01-23 6 49 28](https://github.com/toppers/hakoniwa-unity-picomodel/assets/164193/4c9951eb-17f0-45b6-b8ca-01a71e1ef39e)


* Server_ipaddr: AR端末のIPアドレス
* Client_ipaddr: パソコンのIPアドレス

AR端末向けのアプリのビルドについは、以下を参照してインストールしてください。

https://github.com/toppers/hakoniwa-unity-simasset-plugin/blob/main/README-ar.md

# 本リポジトリの内容とライセンスについて

本リポジトリで公開している箱庭向けUnityアセットは、[hakoniwa-mros2sim](https://github.com/toppers/hakoniwa-mros2sim)と同時に用いることを想定しています。
利用手順の詳細はそちらのリポジトリもご参照ください。

箱庭向けUnityアセットとしての仮想化対象は、株式会社アールティより販売されている[Pi:Co Classic3 マイクロマウス学習キット](https://rt-net.jp/products/pico-classic3/)です。
[rt-net/pico_ros](https://github.com/rt-net/pico_ros)で公開されている[URDFモデル](https://github.com/rt-net/pico_ros/tree/main/pico_description/urdf)のデータを基にして、箱庭環境で動作可能なUnityアセットに変換しています。

(C) 2023 RT Corporation & TOPPERS Project

各ファイルはライセンスがファイル中に明記されている場合、そのライセンスに従います。特に明記されていない場合は、Apache License, Version 2.0に基づき公開されています。  
ライセンスの全文は[LICENSE.md](./LICENSE.md)または[https://www.apache.org/licenses/LICENSE-2.0](https://www.apache.org/licenses/LICENSE-2.0)から確認できます。  
ライセンスの所有者は[株式会社アールティ](https://rt-net.jp/)および[TOPPERSプロジェクト](https://toppers.jp/)です。
