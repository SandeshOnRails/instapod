//
//  NoParse.swift
//  InstaPod
//
//  Created by Sandesh Basnet on 9/28/18.
//

import Foundation

class NoParse {
    
    init() {
        
        
    }
    
    func registerUser (_ username: String, _ password: String, _ email: String!) -> (didRegister: Bool, message: String) {
        
        var isRegistered = false;
        var serverResponse = "";
        
        let url = URL(string: "https://parkistan.herokuapp.com/register")!
        
        var request = URLRequest(url:url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10)
        
        request.httpMethod = "POST"
        request.httpBody = "username=\(username)&password=\(password)&email=\(email)".data(using: .utf8)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) {
            
            (data, response, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
            }
                
            else if let data = data {
                
                let responseMessage = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
                
                if  responseMessage[0]["didRegister"] != nil  {
                    
                          isRegistered = responseMessage[0]["didRegister"] as! Bool
                          serverResponse = responseMessage[1]["message"]! as! String
                }
                
            }
        }
        
        task.resume()
        
        return (isRegistered, serverResponse)

        
    }
    
    
    
    
}
