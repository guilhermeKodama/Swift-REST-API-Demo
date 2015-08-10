//
//  ViewController.swift
//  RestAPIDemo
//
//  Created by Guilherme Kenji Kodama on 09/08/15.
//  Copyright © 2015 Guilherme Kenji Kodama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        postData()
        putData()
        deleteData()
        getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData(){
        HttpRequest.getJSON("http://192.168.0.10/rest-api-demo/api/app.php/product") {
            (data: Dictionary<String, AnyObject>, error: String?) -> Void in
            if error != nil {
                /*TIMED OUT*/
                print(error)
            } else {
                if let entries = data["products"] as? NSArray{
                    
                    for elem: AnyObject in entries{
                        if let dict = elem as? NSDictionary ,
                            let name = dict["name"] as? String{
                                
                                print(name)
                                
                        } else {
                            print("to batendo no else")
                        }
                    }
                    //dispatch_async(dispatch_get_main_queue(),{ self.tableView.reloadData() })
                }
            }
        }
    }
    
    func postData(){
        let jsonObject: AnyObject = ["name":"teste-post"]
        
        HttpRequest.postJSON("http://192.168.0.10/rest-api-demo/api/app.php/product", jsonObj: jsonObject){
            (data: Dictionary<String, AnyObject>, error: String?) -> Void in
            if error != nil {
                /*TIMED OUT*/
                print(error)
                print("Erro de conexão")
            } else {
                print(data)
            }
        }
    
    }
    
    func putData(){
        let jsonObject: AnyObject = ["id":"1","name":"teste-updated"]
        
        HttpRequest.putJSON("http://192.168.0.10/rest-api-demo/api/app.php/product", jsonObj: jsonObject){
            (data: Dictionary<String, AnyObject>, error: String?) -> Void in
            if error != nil {
                /*TIMED OUT*/
                print(error)
                print("Erro de conexão")
            } else {
                print(data)
            }
        }
        
    }
    
    func deleteData(){
        let jsonObject: AnyObject = ["id":"2"]
        
        HttpRequest.deleteJSON("http://192.168.0.10/rest-api-demo/api/app.php/product", jsonObj: jsonObject){
            (data: Dictionary<String, AnyObject>, error: String?) -> Void in
            if error != nil {
                /*TIMED OUT*/
                print(error)
                print("Erro de conexão")
            } else {
                print(data)
            }
        }
        
    }


}

