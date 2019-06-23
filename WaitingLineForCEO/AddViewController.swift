//
//  AddViewController.swift
//  WaitingLineForCEO
//
//  Created by SWUCOMPUTER on 23/06/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var textName: UITextField!
    @IBOutlet var textnumber: UITextField!
    @IBOutlet var textParty: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func getContext () -> NSManagedObjectContext {
        return appDelegate.persistentContainer.viewContext
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        let context = getContext()
       
        let entity = NSEntityDescription.entity(forEntityName: appDelegate.storeName!, in: context)
        
        let object = NSManagedObject(entity: entity!, insertInto: context)
        
        object.setValue(textName.text, forKey: "name")
        object.setValue(textnumber.text, forKey: "number")
        object.setValue(textParty.text, forKey: "party")
        object.setValue(Date(), forKey: "saveData")
        
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        // 현재의 View를 없애고 이전 화면으로 복귀
        self.navigationController?.popViewController(animated: true)
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
