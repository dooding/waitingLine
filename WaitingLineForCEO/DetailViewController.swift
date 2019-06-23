//
//  DetailViewController.swift
//  WaitingLineForCEO
//
//  Created by SWUCOMPUTER on 23/06/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    @IBOutlet var textName: UITextField!
    @IBOutlet var textNumber: UITextField!
    @IBOutlet var textParty: UITextField!
    @IBOutlet var saveDate: UITextField!
    
    var detailWait: NSManagedObject?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let wait = detailWait {
            textName.text = wait.value(forKey: "name") as? String
            textNumber.text = wait.value(forKey: "number") as? String
            textParty.text = wait.value(forKey: "party") as? String
            let dbDate: Date? = wait.value(forKey: "saveData") as? Date
            
            let formatter: DateFormatter = DateFormatter()
            formatter.dateFormat = "h:mm a"
            if let unwrapDate = dbDate {
                saveDate.text = formatter.string(from: unwrapDate as Date) }
        }
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
