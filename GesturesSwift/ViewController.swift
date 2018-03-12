//
//  ViewController.swift
//  GesturesSwift
//
//  Created by Ildar Zalyalov on 12.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return true
    }

    @IBAction func handleTapGesture(_ recognizer: UITapGestureRecognizer) {
        
        if let attachedView = recognizer.view {
            
            attachedView.backgroundColor = UIColor.red
        }
        
    }
    
    @IBAction func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        
        guard let attachedView = recognizer.view else { return }
        
        let translation = recognizer.translation(in: view)
        
        attachedView.center = CGPoint(x: attachedView.center.x + translation.x, y: attachedView.center.y + translation.y)
        
        
        recognizer.setTranslation(.zero, in: view)
        
        if recognizer.state == .ended {
            
            UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 5.0, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: { [weak self] in
                
                guard let strongSelf = self else { return }
                
                attachedView.center.y = strongSelf.view.frame.maxY - attachedView.frame.height / 2
            }, completion: nil)
        }
    }
    
    @IBAction func handlePinchGesture(_ recognizer: UIPinchGestureRecognizer) {
        
        if let attachedView = recognizer.view {
            
            attachedView.transform = attachedView.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
        }
        
        recognizer.scale = 1
    }
    
    @IBAction func handleRotationGesture(_ recognizer: UIRotationGestureRecognizer) {
        
        if let attachedView = recognizer.view {
            
            attachedView.transform = attachedView.transform.rotated(by: recognizer.rotation)
        }
        
        recognizer.rotation = 0
    }
}



///SOLID

//S

class NetManager {
    
    var dateManager: DateManager
    var dataBaseManager: DataBaseManager
    
    init(dateManager: DateManager, dataManager: DataBaseManager) {
       
        self.dateManager = dateManager
        self.dataBaseManager = dataManager
    }
    
    func getData(with url: URL) {
        //getting data
    }
    
   
}

class DateManager {
    
    fileprivate func calculateIfYearLessThanCurrent(with date: Date) -> Bool {
        
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        
        let currentYear = calendar.component(.year, from: Date())
        
        return year < currentYear
    }
}

class DataBaseManager {
    
    fileprivate func save(_ string: String) {
        //save string
    }
}

//O

protocol Printable {
    func printDetails()
}
struct Car: Printable {
    var name: String
    var costInDollars: String
    
    func printDetails() {
        
        print("Name: \(name), cost: \(costInDollars)")
    }
}

struct User: Printable {
    var name: String
    var age: Int
    
    func printDetails() {
        
        print("Name: \(name), age: \(age)")
    }
}

class Logger {
    
    func printData() {
        
        let models: [Printable] = [
            Car(name: "name", costInDollars: "123123"),
            Car(name: "name", costInDollars: "123123"),
            Car(name: "name", costInDollars: "123123"),
            User(name: "name", age: 13),
            User(name: "name", age: 13),
            User(name: "name", age: 13)
        ]
        
        models.forEach{ $0.printDetails() }
    }
}

// L

class Manager {
    
    func read(_ someString: String, lessThan: Int = 0) {
        
    }
}

class SubclassManager: Manager {
    
    override func read(_ someString: String, lessThan: Int = 0) {
        
        guard someString.count < lessThan else { return }
        
        //read
    }
}

// D

class SomeNetManagerImplementation: RequestManager {
    
    func getRequest() {
        
    }
}

protocol RequestManager {
    func getRequest()
}

class FileReaderManager {
    
    var netManager: RequestManager
    
    init(netManager: RequestManager) {
        
        self.netManager = netManager
    }
    
    func readFile() {
        
        netManager.getRequest()
    }
}


class AutocompleteManagerImplementation:AutocompleteManager, Delegate {
    var resultsViewController: UIViewController = UIViewController()
    
    func configure(with searchBarController: inout UISearchController) {
        
    }
}

protocol AutocompleteManager {
    func configure(with searchBarController: UISearchController)
}
