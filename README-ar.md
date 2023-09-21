# Unityの各種追加設定

## Build Settings

Build Settings を開きます。

![スクリーンショット 2023-09-21 12 24 36](https://github.com/toppers/hakoniwa-unity-picomodel/assets/164193/2a8527bf-89e0-48f6-8152-e537120d0353)

Platformを iOS にして、`switch platform` を選択します。

![スクリーンショット 2023-09-21 12 25 15](https://github.com/toppers/hakoniwa-unity-picomodel/assets/164193/d97d21c3-1eac-4e12-9625-7993228525bb)

既存のシーンを削除します。

!
[スクリーンショット 2023-09-21 12 25 59](https://github.com/toppers/hakoniwa-unity-picomodel/assets/164193/9a0aa95e-7ba0-4dd1-85aa-c7e9106b2301)


## Package Manager

Package Managerで、Unityのレジストリを選択します。

![スクリーンショット 2023-09-21 12 29 20](https://github.com/toppers/hakoniwa-unity-picomodel/assets/164193/cdb48954-c61c-4adc-a825-74d7549633e7)

`AR foundation` と `Apple ARKit XR Plugin` をインストールします。

![スクリーンショット 2023-09-21 12 30 01](https://github.com/toppers/hakoniwa-unity-picomodel/assets/164193/e9435d15-047f-4c87-ac65-b56360f9c339)

## Project Settings

`XR Plugin-in Management` の `Apple ARKit` を選択します。

![スクリーンショット 2023-09-21 12 33 39](https://github.com/toppers/hakoniwa-unity-picomodel/assets/164193/773c9956-9db9-42bb-8fc5-10dd12d7f528)

`Project vValidation` のエラーを解消するために、`Fix` をクリックします。

## ARDevice Scene の設定

ARDevice Scene を選択します。

![スクリーンショット 2023-09-21 12 36 38](https://github.com/toppers/hakoniwa-unity-picomodel/assets/164193/661f2998-41b6-4369-8f9b-ba171a0f98e2)

Hierarchyビューの `AR` を選択し、インスペクタービューの `Server_ipaddr` に iphone のIPアドレスを設定します。
Client_ipaddr には、Mac の IPアドレスを設定します。

![スクリーンショット 2023-09-21 12 37 11](https://github.com/toppers/hakoniwa-unity-picomodel/assets/164193/cb3ef341-8251-4bf1-bcfc-82fdf8f5c40e)


## Hakoniwa Scene の設定

Hakoniwa Scene を選択します。

Hierarchyビューの `AR` を選択し、インスペクタービューの `Server_ipaddr` に Mac のIPアドレスを設定します。
Client_ipaddr には、iphone の IPアドレスを設定します。

![スクリーンショット 2023-09-21 12 39 35](https://github.com/toppers/hakoniwa-unity-picomodel/assets/164193/c71d57d9-7952-48e3-afa9-5a43f2e5535a)

# Unityビルド手順

`Build Settings` のシーンに、`ARDevice`を追加し、`Build` をクリックします。

![スクリーンショット 2023-09-21 12 42 04](https://github.com/toppers/hakoniwa-unity-picomodel/assets/164193/a9e0b02d-071e-46d5-8a4b-a33bde1db715)

`Build`ディレクトリとして、適当な空の場所を作り、選択します。

![スクリーンショット 2023-09-21 12 43 50](https://github.com/toppers/hakoniwa-unity-picomodel/assets/164193/6dd1a45a-16e2-4095-b022-3de088d15627)

ビルド成功すると、Xcodeでビルド可能なプロジェクトが作成されます。

![スクリーンショット 2023-09-21 12 45 42](https://github.com/toppers/hakoniwa-unity-picomodel/assets/164193/7f593f6a-1e65-482f-bb18-3d15f7977c9c)


# Xcode ビルド手順

デベロッパモードのiphoneとMacをUSB接続します。

次に、Buildディレクトリを Xcode でオープンします。

`Signing & Capabilities` で、以下のように Teamには AppleID と Bundle Identifier には、`com.hakoniwa-lab.picomodel` と入力して、ビルドボタンをクリックします。


![スクリーンショット 2023-09-21 12 49 25](https://github.com/toppers/hakoniwa-unity-picomodel/assets/164193/3c3b15a3-da45-4457-8d3a-27e3287ce925)

# iphone 側の設定

`設定` => `一般` => `VPNとデバイス管理`を開き、当該ARアプリ(model)を信頼するようにしてください。


