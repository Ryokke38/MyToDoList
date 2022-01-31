//
//  AddViewController.swift
//  TodoList
//
//  Created by Susumu Goto on 2021/12/18.
//

import UIKit

protocol AddViewControllerDelegate: AnyObject {
    func addViewControllerSaveContent(_ :AddViewController)
}

class AddViewController: UIViewController, UIAdaptivePresentationControllerDelegate{
    
    @IBOutlet weak var todoTextField: UITextField!
    weak var delegate: AddViewControllerDelegate?
    
    init(delegate: AddViewControllerDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        print("キャンセルボタンが押されました。")
        self.dismiss(animated: true, completion: nil)
    }
    
    func close() {
        //textFieldから削除
        todoTextField.text = nil
        //閉じる
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        
        //入力された文字が空でないなら、処理を続ける
        guard let text = todoTextField.text else { return }
        let userDefalts = UserDefaults.standard
        //userDefaultsから取得した値が存在するなら（userArray）、
        if let userArray = userDefalts.stringArray(forKey: "todo") {
            //userArray + 入力された文字を配列に追加し、userDefaultsに保存
            userDefalts.set(userArray + [text], forKey: "todo")
        } else {
            //入力された文字で配列を作り、userDefaultsに保存
            userDefalts.set([text], forKey: "todo")
        }
        userDefalts.synchronize()
        delegate?.addViewControllerSaveContent(self)
        close()
        
//        var strArray = [String]()
//
//        strArray.append(text)
//
//        //userDefaultsの値を取得し、userArrayに格納
//    //    let userDefalts = UserDefaults.standard
//        let userArray = userDefalts.stringArray(forKey: "todo")
//        print("userDefaultsの値を取得し、userArrayに格納")
//
//        func close() {
//
//            //userDefaultsに保存
//            userDefalts.set(strArray, forKey: "todo")
//
//            //すぐ反映
//            userDefalts.synchronize()
//
//            //textFieldから削除
//            todoTextField.text = ""
//
//            //閉じる
//            self.dismiss(animated: true, completion: nil)
//
//        }
//
//
//
//        //userArrayが空なら、そのまま入力された文字をstrArrayに格納
//        if userArray == nil {
//
//            //入力された文字が空でないなら、入力された文字をstrArrayに入れる
//            guard let txtField = todoTextField.text else {
//                return }
//            strArray.append(txtField)
//
//            close()
//
//
//        } else {
//
//            //userArrayが空でないなら、strArrayに格納
//            guard let user = userArray else { return }
//            strArray = user
//
//            //入力された文字が空でないなら、入力された文字をstrArrayに入れる
//            guard let txtField = todoTextField.text else {
//                return }
//            strArray.append(txtField)
//
//           close()
//
//        }
        
    }
    
}


/*
 
 今の状況
 『僕はやはり元から配列は用意しておいた方がいいと考えたので、strArrayというオプショナル型の配列を作成しました。そして、userDefaultsから値を引っ張った配列名をuserArrayに設定し、オプショナルバインディングでuserArrayが空でないなら、その値をstrArryに保存し、その後入力された文字を、strArrayに追加するという方法でできるかなと考えていましたが、なかなか上手くいかなかったです。』
 
 國吉さんのコメント
 『userArrayがnilイコール初めてセーブしたことになります。
 何かしら値が入ってたらまたは入った形跡があるなら2回目以降なので、追加するだけです。』
 
 やりたいこと（useradefaultsに入力された値を保存）
 
 1) 格納するための配列を作成
 2) userDefaultsの値を取得
 3) userDefaultsで取得した値を配列に格納
 4) todoTextField.textをオプショナルバインディング
 5) 入力された文字列を配列に追加
 6) 配列をuserDefaultsに保存
 
 userDefaultsに値が入っていない場合
 userDefaultsに値が入っている場合を考える。
 
 **/


























