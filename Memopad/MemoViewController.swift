//
//  MemoViewController.swift
//  Memopad
//
//  Created by Mac on 2021/02/01.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    var saveData: UserDefaults = UserDefaults.standard //倉庫(UserDefaults)をつくる
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.text = saveData.object(forKey: "title") as? String
        contentTextView.text = saveData.object(forKey: "content") as? String
        titleTextField.delegate = self
    }
    
    //Saveボタン
    @IBAction func saveMemo(){
        //UserDefaultsに書き込み
        saveData.set(titleTextField.text, forKey: "title")
        saveData.set(contentTextView.text, forKey: "content")
        
        //alertを出す(タイトルと本文)
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました。", preferredStyle: .alert)
        
        //alertをつくる
        alert.addAction(
                    UIAlertAction(
                        title: "OK", //ボタン名
                        style: .default,
                        handler: { action in
                           //print("OKボタンが押されました！")
                            self.navigationController?.popViewController(animated: true) //一つ前に戻る
                        }
                    )
        )
        
        //alertを表示
        present(alert, animated: true, completion: nil)
    }
    
    //Returnが押されたとき
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
