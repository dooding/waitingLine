//
//  SignUpViewController.swift
//  WaitingLineForCEO
//
//  Created by SWUCOMPUTER on 23/06/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet var textID: UITextField!
    @IBOutlet var textPasswd: UITextField!
    @IBOutlet var textLicense: UITextField!
    @IBOutlet var textStore: UITextField!
    @IBOutlet var labelStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn (_ textField: UITextField) -> Bool {
        if textField == self.textID {
            textField.resignFirstResponder()
            self.textPasswd.becomeFirstResponder()
        }
        else if textField == self.textPasswd {
            textField.resignFirstResponder()
            self.textLicense.becomeFirstResponder()
        }
        else if textField == self.textLicense {
            textField.resignFirstResponder()
            self.textStore.becomeFirstResponder()
        }
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func buttonSave() {
        if textID.text == "" {
            labelStatus.text = "ID를 입력하세요"; return; }
        if textPasswd.text == "" {
            labelStatus.text = "Password를 입력하세요"; return; }
        if textLicense.text == "" {
            labelStatus.text = "사업자 등록번호를 입력하세요"; return;
        }
        if textStore.text == "" {
            labelStatus.text = "음식점 이름을 입력하세요"; return;
        }
        
        let urlString: String = "http://condi.swu.ac.kr/student/T01/login/insertUser.php"
        guard let requestURL = URL(string: urlString) else { return }
        var request = URLRequest(url: requestURL)
        request.httpMethod = "POST"
        
        let restString: String = "id=" + textID.text! + "&password=" + textPasswd.text!
            + "&license=" + textLicense.text! + "&store=" + textStore.text!
        
        request.httpBody = restString.data(using: .utf8)
        self.executeRequest(request: request)
    }
    
    func executeRequest (request: URLRequest) -> Void {
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            guard responseError == nil else {
                print("Error: calling POST")
                return
                
            }
            guard let receivedData = responseData else {
                print("Error: not receiving Data")
                return }
            
            if let utf8Data = String(data: receivedData, encoding: .utf8) {
                DispatchQueue.main.async {
                // for Main Thread Checker
                self.labelStatus.text = utf8Data
                print(utf8Data) // php에서 출력한 echo data가 debug 창에 표시됨
                
                }
            } }
        task.resume()
        
    }
    
    @IBAction func buttonBack() {
        self.dismiss(animated: true, completion: nil)
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
