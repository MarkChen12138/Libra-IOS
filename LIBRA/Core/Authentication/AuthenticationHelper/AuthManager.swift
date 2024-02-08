//import Firebase
//import FirebaseAuth
//
//class AuthManager {
//    static let shared = AuthManager()
//
//    private init() {}
//
//    // MARK: - Authentication Methods
//
//    func signUp(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
//        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
//            if let error = error {
//                completion(.failure(error))
//            } else {
//                completion(.success(()))
//            }
//        }
//    }
//
//    func signIn(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
//        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
//            if let error = error {
//                completion(.failure(error))
//            } else {
//                completion(.success(()))
//            }
//        }
//    }
//
//    func signOut(completion: @escaping (Result<Void, Error>) -> Void) {
//        do {
//            try Auth.auth().signOut()
//            completion(.success(()))
//        } catch {
//            completion(.failure(error))
//        }
//    }
//
//    func getAuthenticatedUser(completion: @escaping (Result<User?, Error>) -> Void) {
//        // 使用 Auth.auth().currentUser 获取当前已登录的用户
//        if let user = Auth.auth().currentUser {
//            // 如果已登录，返回用户对象
//            completion(.success(user))
//        } else {
//            // 如果未登录，返回错误
//            let error = NSError(domain: "YourAppDomain", code: 401, userInfo: [NSLocalizedDescriptionKey: "用户未登录"])
//            completion(.failure(error))
//        }
//    }
//    
//    
//}
