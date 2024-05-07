//
//  UserStateManager.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 27/04/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class UserStateManager: ObservableObject {
    static var shared = UserStateManager()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: UserAuthData?
    @Published var isLoading = false
    @Published var userState: IntroductionViewState = .notAuthorized
    private let notificationManager = NotificationManager()

    init(){
        self.userSession = Auth.auth().currentUser
        Task { await fetchUser() }
    }
    
    private func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        
        DispatchQueue.main.async {
            self.currentUser = try? snapshot.data(as:UserAuthData.self)
            print("current user is: \(String(describing: self.currentUser))")
            if self.currentUser != nil {
                self.userState = .authorized
            }
            
            
        }
    }
    @MainActor
    func createUser(_ email: String, _ password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            DispatchQueue.main.async {
                self.userSession = result.user
            }
            
            let user = UserAuthData(id: result.user.uid, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            print(encodedUser)
            self.currentUser = user
        } catch {
            print("Error in createUser: \(error.localizedDescription)")
            throw error
        }
    }
    
    func signIn(_ email:String, _ password:String) async throws {
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
          
            if let error = error {

              let err = error as NSError
              if let authErrorCode = AuthErrorCode.Code(rawValue: err.code) {

                switch authErrorCode {

                case .invalidEmail, .invalidSender, .invalidRecipientEmail:
                    self?.notificationManager.present(title: "Please enter a valid email")
                  print("\(AuthErrorCode.invalidEmail)")

                case .wrongPassword:
                    self?.notificationManager.present(title: "Your password is incorrect")
                  print("\(AuthErrorCode.wrongPassword)")

                case .userNotFound:
                    self?.notificationManager.present(title: "Account doesn't exist")
                  print("\(AuthErrorCode.userNotFound)")

                case .userDisabled:
                    self?.notificationManager.present(title: "Your account has been disabled")
                  print("\(AuthErrorCode.userDisabled)")

                case .networkError:
                    self?.notificationManager.present(title: "Network error, please try again")
                  print("Network Error, \(AuthErrorCode.wrongPassword)")

                case .operationNotAllowed:
                    self?.notificationManager.present(title: "Email/Password not enabled for this App")
                  print("\(AuthErrorCode.operationNotAllowed)")

                default:
                  print("x\(error.localizedDescription)")
                }
              }

              return
            }
            print("User signs in successfully")
            
            self?.userSession = authResult?.user
            self?.currentUser = UserAuthData(id: authResult?.user.uid ?? "" , email: authResult?.user.email ?? "errorEmail")
            self?.userState = .authorized
        }
        
//        do {
//            let result = try await Auth.auth().signIn(withEmail: email, password: password)
//            
//            self.userSession = result.user
//            self.userState = .authorized
//            print("-------")
//            print(userSession)
//            print("-------")
//        } catch {
//            print("error in auth in signIn: \(error.localizedDescription)")
//            throw error
//        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
            self.userState = .notAuthorized
        }
        catch {
            print("error in AuthViewModel in signOut: \(error.localizedDescription)")
        }
    }
}

extension UserStateManager {
    func getUserAuthData() -> UserAuthData {
        return self.currentUser ?? UserAuthData(id: "", email: "error")
    }
}

struct UserAuthData: Codable {
    var id: String
    var email: String
}

enum IntroductionViewState {
    case authorized
    case enterData
    case notAuthorized
}


