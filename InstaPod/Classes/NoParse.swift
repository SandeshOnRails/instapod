import Foundation

class NoParse {
    
    init() {
        
        
    }
    
    func registerUser (_ username: String, _ password: String, _ email: String!) -> (didRegister: Bool, message: String) {
        
        var isRegistered = false;
        var serverResponse = "";
        
        // URL for making POST request to the heroku server
        
        let url = URL(string: "https://parkistan.herokuapp.com/register")!
        
        var request = URLRequest(url:url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10)
        
        // define HTTP POST method
        request.httpMethod = "POST"
        
        // send data as httpBody encoded in utf format
        
        
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
        
        //return tuple of response
        
        return (isRegistered, serverResponse)
        
        
    }
    
    
    func loginUser (_ username: String, _ password: String, _ email: String!) -> (didRegister: Bool, message: String) {
        
        var isLoggedIn = false;
        var serverResponse = "";
        
        // URL for making GET request to the heroku server
        
        let url = URL(string: "https://parkistan.herokuapp.com/users")!
        
        var request = URLRequest(url:url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) {
            
            (data, response, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
            }
                
            else if let data = data {
                
                let responseMessage = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
                
                if  responseMessage[0]["didLogin"] != nil  {
                    
                    isLoggedIn = responseMessage[0]["didLogin"] as! Bool
                    serverResponse = responseMessage[1]["message"]! as! String
                }
                
            }
        }
        
        task.resume()
        
        //return tuple of response
        
        return (isLoggedIn, serverResponse)
        
        
    }
    
    
    
    
    
    
    
    
    
}

