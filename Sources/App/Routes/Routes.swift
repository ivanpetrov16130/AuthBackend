import Vapor
import Foundation

extension Droplet {
  
  func setupRoutes() throws {
    
    post("register") { req in
      let newUser: User = try req.decodeJSONBody()
      try InMemoryCash.shared.save(user: newUser)
      return Response(status: .created)
    }
    
    post("login") { req in
      let credentials: Credentials = try req.decodeJSONBody()
      return Response(status: .ok, body:  try JSONEncoder().encode(try InMemoryCash.shared.user(for: credentials)))
    }
    
    // response to requests to /info domain
    // with a description of the request
    get("info") { req in
      return req.description
    }
    
    get("description") { req in return req.description }
    
  }
  
}
