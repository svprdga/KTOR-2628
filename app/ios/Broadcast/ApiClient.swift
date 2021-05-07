import Alamofire

class ApiClient {
    
    func test(completion: @escaping (_ result: Result<String, Error>) -> Void) {
        
        let endpoint = "http://192.168.1.158:9090/api/random"
        
        AF.request(endpoint,
                   method: .post)
            .validate()
            .responseJSON{ response in
                
                
            }
    }
    
}
