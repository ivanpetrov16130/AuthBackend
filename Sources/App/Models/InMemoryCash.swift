import Foundation


class InMemoryCash {
  static let shared = InMemoryCash()
  
  private init(){}
  
  private var users: Set<User> = []
  
  func save(user: User) throws {
    let (userHasBeenInserted, _) = users.insert(user)
    if !userHasBeenInserted {
      throw Abort.unauthorized
    }
  }
  
  func user(for credentials: Credentials) throws -> User  {
    if let user = users.first(where: { $0.nickname == credentials.nickname && $0.password == credentials.password }) {
      return user
    } else {
      throw Abort.notFound
    }
  }
  
}
