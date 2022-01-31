//
//  ViewController.swift
//  TodoList
//
//  Created by Susumu Goto on 2021/11/08.
//

/*
 テスト項目
 
 1.todoListのページから+ボタンでaddNewページへ移動
 2.addnewページでのtextfieldに文字が入りsaveボタンを押すとtodolistのページに戻り、打たれた文字がリストの中に入る
 3.cancelボタンが押されたら、todolistのページに戻り、何も記録されない
 4.listをスライドすると、削除できる
 5.アプリを再起動しても、今までのデータがそのまま残っている
 
 フローチャート
 
 <1>navigation controllerを作成
    1.必要な部品を配置する
        ->+ボタン
        ->tableViewCell
    2.userdefultにアクセスする
        ->配列を取得
        ->取得した配列を元にcellを作成
        ->cellの中身をtableViewCellに表示
    3.tableViewCellの処理
        左にスワイプした時にdeleteを表示
        deleteが押されると、該当のcellを抽出し、削除
        tableViewCellを更新
    4.+ボタンの処理
        +をアウトレットで二つ目のnavigation controllerに接続
 
 <2>navigation controllerの二つ目を作成
    1.必要な部品を配置
        ->textField
        ->cancelボタン
        ->saveボタン
    2.cancelボタンの処理
        cancelボタンが押された時、textFieldに文字列があったとしても、nilを返し、navigation controller<1>に移動
    3.saveボタンの処理
        saveボタンが押された時、textFieldの文字列が存在するとき
            ->その文字列をcellとして保存
            ->tableViewCellに表示
        saveボタンが押された時、textFieldの文字列が存在しないとき
            ->nilを返し、navigation controller<1>に移動
 
 **/
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

