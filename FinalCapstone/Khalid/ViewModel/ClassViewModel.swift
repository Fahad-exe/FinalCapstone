import Foundation
import CoreData

class ViewModel: ObservableObject {
    
    @Published var consumer: [Consumer] = []
    @Published var provider: [Provider] = []
    @Published var reviews: [Reviews] = []
    @Published var service: [Service] = []
    @Published var task: [Task] = []
    
    @Published var input: String = ""
     
    
    func updateService(status:String){
        let parameters = "{ \"status\": \"\(status)\" }"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://yjoyvwtoxfafnrqqeyrd.supabase.co/rest/v1/Service?id=eq.14b71b8b-b5f1-41aa-bb50-15dc7f8f92ea")!,timeoutInterval: Double.infinity)
        request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlqb3l2d3RveGZhZm5ycXFleXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4OTkzODksImV4cCI6MjAxODQ3NTM4OX0.oY_fnzSLa240yQxerUpt-qONHjo2PDotx9LjN2XMkcA", forHTTPHeaderField: "apikey")
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlqb3l2d3RveGZhZm5ycXFleXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4OTkzODksImV4cCI6MjAxODQ3NTM4OX0.oY_fnzSLa240yQxerUpt-qONHjo2PDotx9LjN2XMkcA", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("return=minimal", forHTTPHeaderField: "Prefer")

        request.httpMethod = "PATCH"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
    }
    
    func postReview(ReviewFeedBack: String, Review: Int){
        let parameters = "{\"ReviewFeedBack\": \"\(ReviewFeedBack)\", \"Review\": \"\(Review)\"}"
        
        if let postData = parameters.data(using: .utf8) {
            var request = URLRequest(url: URL(string: "https://yjoyvwtoxfafnrqqeyrd.supabase.co/rest/v1/Reviews")!,timeoutInterval: Double.infinity)
            request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlqb3l2d3RveGZhZm5ycXFleXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4OTkzODksImV4cCI6MjAxODQ3NTM4OX0.oY_fnzSLa240yQxerUpt-qONHjo2PDotx9LjN2XMkcA", forHTTPHeaderField: "apikey")
            request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlqb3l2d3RveGZhZm5ycXFleXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4OTkzODksImV4cCI6MjAxODQ3NTM4OX0.oY_fnzSLa240yQxerUpt-qONHjo2PDotx9LjN2XMkcA", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("return=minimal", forHTTPHeaderField: "Prefer")
            
            request.httpMethod = "POST"
            request.httpBody = postData
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    guard let data = data else {
                        if let error = error {
                            print("Error: \(error)")
                            self.input = "Error: \(error.localizedDescription)"
                        }
                        return
                    }
                    if let responseString = String(data: data, encoding: .utf8) {
                        print("Response: \(responseString)")
                        self.input = "Response: \(responseString)"
                    }
                }
            }
            task.resume()
        }
    }
    
    func postData(serviceName: String , description: String, status: String, address: String, price: Int) {
        let parameters = "{ \"serviceName\": \"\(serviceName)\", \"description\": \"\(description)\", \"status\": \"\(status)\", \"address\": \"\(address)\", \"price\": \"\(price)\" }"
        
        if let postData = parameters.data(using: .utf8) {
            var request = URLRequest(url: URL(string: "https://yjoyvwtoxfafnrqqeyrd.supabase.co/rest/v1/Service")!,timeoutInterval: Double.infinity)
            request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlqb3l2d3RveGZhZm5ycXFleXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4OTkzODksImV4cCI6MjAxODQ3NTM4OX0.oY_fnzSLa240yQxerUpt-qONHjo2PDotx9LjN2XMkcA", forHTTPHeaderField: "apikey")
            request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlqb3l2d3RveGZhZm5ycXFleXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4OTkzODksImV4cCI6MjAxODQ3NTM4OX0.oY_fnzSLa240yQxerUpt-qONHjo2PDotx9LjN2XMkcA", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("return=minimal", forHTTPHeaderField: "Prefer")
            
            request.httpMethod = "POST"
            request.httpBody = postData
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    guard let data = data else {
                        if let error = error {
                            print("Error: \(error)")
                            self.input = "Error: \(error.localizedDescription)"
                        }
                        return
                    }
                    if let responseString = String(data: data, encoding: .utf8) {
                        print("Response: \(responseString)")
                        self.input = "Response: \(responseString)"
                    }
                }
            }
            task.resume()
        }
    }
    
    
    func fetchConsumerData() {
        var request = URLRequest(url: URL(string: "https://yjoyvwtoxfafnrqqeyrd.supabase.co/rest/v1/Consumer?select=*")!,timeoutInterval: Double.infinity)
        request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlqb3l2d3RveGZhZm5ycXFleXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4OTkzODksImV4cCI6MjAxODQ3NTM4OX0.oY_fnzSLa240yQxerUpt-qONHjo2PDotx9LjN2XMkcA", forHTTPHeaderField: "apikey")
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlqb3l2d3RveGZhZm5ycXFleXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4OTkzODksImV4cCI6MjAxODQ3NTM4OX0.oY_fnzSLa240yQxerUpt-qONHjo2PDotx9LjN2XMkcA", forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([Consumer].self, from: data)
                DispatchQueue.main.async {
                    self.consumer = decodedData
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }
        task.resume()
    }
    
    func fetchProviderData() {
        var request = URLRequest(url: URL(string: "https://yjoyvwtoxfafnrqqeyrd.supabase.co/rest/v1/Provider?select=*")!,timeoutInterval: Double.infinity)
        request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlqb3l2d3RveGZhZm5ycXFleXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4OTkzODksImV4cCI6MjAxODQ3NTM4OX0.oY_fnzSLa240yQxerUpt-qONHjo2PDotx9LjN2XMkcA", forHTTPHeaderField: "apikey")
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlqb3l2d3RveGZhZm5ycXFleXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4OTkzODksImV4cCI6MjAxODQ3NTM4OX0.oY_fnzSLa240yQxerUpt-qONHjo2PDotx9LjN2XMkcA", forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([Provider].self, from: data)
                DispatchQueue.main.async {
                    self.provider = decodedData
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }
        task.resume()
    }
    
    func fetchReviewsData() {
        var request = URLRequest(url: URL(string: "https://yjoyvwtoxfafnrqqeyrd.supabase.co/rest/v1/Reviews?select=*")!,timeoutInterval: Double.infinity)
        request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlqb3l2d3RveGZhZm5ycXFleXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4OTkzODksImV4cCI6MjAxODQ3NTM4OX0.oY_fnzSLa240yQxerUpt-qONHjo2PDotx9LjN2XMkcA", forHTTPHeaderField: "apikey")
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlqb3l2d3RveGZhZm5ycXFleXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4OTkzODksImV4cCI6MjAxODQ3NTM4OX0.oY_fnzSLa240yQxerUpt-qONHjo2PDotx9LjN2XMkcA", forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([Reviews].self, from: data)
                DispatchQueue.main.async {
                    self.reviews = decodedData
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }
        task.resume()
    }
    
    func fetchServiceData(){
        var request = URLRequest(url: URL(string: "https://yjoyvwtoxfafnrqqeyrd.supabase.co/rest/v1/Service?select=*")!,timeoutInterval: Double.infinity)
        request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlqb3l2d3RveGZhZm5ycXFleXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4OTkzODksImV4cCI6MjAxODQ3NTM4OX0.oY_fnzSLa240yQxerUpt-qONHjo2PDotx9LjN2XMkcA", forHTTPHeaderField: "apikey")
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlqb3l2d3RveGZhZm5ycXFleXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4OTkzODksImV4cCI6MjAxODQ3NTM4OX0.oY_fnzSLa240yQxerUpt-qONHjo2PDotx9LjN2XMkcA", forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([Service].self, from: data)
                DispatchQueue.main.async {
                    self.service = decodedData
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }
        task.resume()
    }
    
    func fetchTaskData(){
        var request = URLRequest(url: URL(string: "https://yjoyvwtoxfafnrqqeyrd.supabase.co/rest/v1/Task?select=*")!,timeoutInterval: Double.infinity)
        request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlqb3l2d3RveGZhZm5ycXFleXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4OTkzODksImV4cCI6MjAxODQ3NTM4OX0.oY_fnzSLa240yQxerUpt-qONHjo2PDotx9LjN2XMkcA", forHTTPHeaderField: "apikey")
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlqb3l2d3RveGZhZm5ycXFleXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4OTkzODksImV4cCI6MjAxODQ3NTM4OX0.oY_fnzSLa240yQxerUpt-qONHjo2PDotx9LjN2XMkcA", forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([Task].self, from: data)
                DispatchQueue.main.async {
                    self.task = decodedData
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }
        task.resume()
    }
    
    func performPatchRequest() {
        let parameters = "{ \"other_column\": \"otherValue\" }"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://yjoyvwtoxfafnrqqeyrd.supabase.co/rest/v1/Service?some_column=eq.someValue")!,timeoutInterval: Double.infinity)
        request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlqb3l2d3RveGZhZm5ycXFleXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4OTkzODksImV4cCI6MjAxODQ3NTM4OX0.oY_fnzSLa240yQxerUpt-qONHjo2PDotx9LjN2XMkcA", forHTTPHeaderField: "apikey")
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlqb3l2d3RveGZhZm5ycXFleXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4OTkzODksImV4cCI6MjAxODQ3NTM4OX0.oY_fnzSLa240yQxerUpt-qONHjo2PDotx9LjN2XMkcA", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("return=minimal", forHTTPHeaderField: "Prefer")

        request.httpMethod = "PATCH"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
    }
    
//    let parameters = "{ \"other_column\": \"otherValue\" }"
//    let postData = parameters.data(using: .utf8)
//
//    var request = URLRequest(url: URL(string: "https://yjoyvwtoxfafnrqqeyrd.supabase.co/rest/v1/Service?some_column=eq.someValue")!,timeoutInterval: Double.infinity)
//    request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlqb3l2d3RveGZhZm5ycXFleXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4OTkzODksImV4cCI6MjAxODQ3NTM4OX0.oY_fnzSLa240yQxerUpt-qONHjo2PDotx9LjN2XMkcA", forHTTPHeaderField: "apikey")
//    request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlqb3l2d3RveGZhZm5ycXFleXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4OTkzODksImV4cCI6MjAxODQ3NTM4OX0.oY_fnzSLa240yQxerUpt-qONHjo2PDotx9LjN2XMkcA", forHTTPHeaderField: "Authorization")
//    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//    request.addValue("return=minimal", forHTTPHeaderField: "Prefer")
//
//    request.httpMethod = "PATCH"
//    request.httpBody = postData
//
//    let task = URLSession.shared.dataTask(with: request) { data, response, error in
//      guard let data = data else {
//        print(String(describing: error))
//        return
//      }
//      print(String(data: data, encoding: .utf8)!)
//    }
//
//    task.resume()
//
    
//    func postData(serviceName: String , description: String, status: String, address: String, price: Int) {
//        let parameters = "{ \"serviceName\": \"\(serviceName)\", \"description\": \"\(description)\", \"status\": \"\(status)\", \"address\": \"\(address)\", \"price\": \"\(price)\" }"
//
//        if let postData = parameters.data(using: .utf8) {
//            var request = URLRequest(url: URL(string: "https://yjoyvwtoxfafnrqqeyrd.supabase.co/rest/v1/Service")!,timeoutInterval: Double.infinity)
//            request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlqb3l2d3RveGZhZm5ycXFleXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4OTkzODksImV4cCI6MjAxODQ3NTM4OX0.oY_fnzSLa240yQxerUpt-qONHjo2PDotx9LjN2XMkcA", forHTTPHeaderField: "apikey")
//            request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlqb3l2d3RveGZhZm5ycXFleXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI4OTkzODksImV4cCI6MjAxODQ3NTM4OX0.oY_fnzSLa240yQxerUpt-qONHjo2PDotx9LjN2XMkcA", forHTTPHeaderField: "Authorization")
//            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//            request.addValue("return=minimal", forHTTPHeaderField: "Prefer")
//
//            let task = URLSession.shared.dataTask(with: request) { data, response, error in
//                DispatchQueue.main.async {
//                    guard let data = data else {
//                        if let error = error {
//                            print("Error: \(error)")
//                            self.input = "Error: \(error.localizedDescription)"
//                        }
//                        return
//                    }
//                    if let responseString = String(data: data, encoding: .utf8) {
//                        print("Response: \(responseString)")
//                        self.input = "Response: \(responseString)"
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
}


/*
 let parameters = "{ \"some_column\": \"someValue\", \"other_column\": \"otherValue\" }"
 let postData = parameters.data(using: .utf8)
 
 var request = URLRequest(url: URL(string: "https://yjoyvwtoxfafnrqqeyrd.supabase.co/rest/v1/Reviews")!,timeoutInterval: Double.infinity)
 request.addValue("SUPABASE_CLIENT_ANON_KEY", forHTTPHeaderField: "apikey")
 request.addValue("Bearer SUPABASE_CLIENT_ANON_KEY", forHTTPHeaderField: "Authorization")
 request.addValue("application/json", forHTTPHeaderField: "Content-Type")
 request.addValue("return=minimal", forHTTPHeaderField: "Prefer")
 
 request.httpMethod = "POST"
 request.httpBody = postData
 
 let task = URLSession.shared.dataTask(with: request) { data, response, error in
 guard let data = data else {
 print(String(describing: error))
 return
 }
 print(String(data: data, encoding: .utf8)!)
 }
 
 task.resume()
 */

