import Foundation

struct User: Codable, Hashable {
  
  let nickname: String
  let fullName: String
  let avatarData: Data?
  let password: String
  
  var hashValue: Int {
    return nickname.hashValue
  }
  
}

struct Credentials: Codable {
  let nickname: String
  let password: String
}
