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
    
    init(){
        self.userSession = Auth.auth().currentUser
        Task {await fetchUser()}
    }
    
    private func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else{ return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        
        DispatchQueue.main.async {
            self.currentUser = try? snapshot.data(as:UserAuthData.self)
            print("current user is: \(String(describing: self.currentUser))")
        }
    }
    func createUser(_ email:String, _ password:String, _ name:String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = UserAuthData(id: result.user.uid, name: name, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("error in createUser: \(error.localizedDescription)")
        }
    }
    
    func signIn(_ email:String, _ password:String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            
            self.userSession = result.user
            
        } catch {
            print("error in auth in signIn: \(error.localizedDescription)")
            throw error
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        }
        catch {
            print("error in AuthViewModel in signOut: \(error.localizedDescription)")
        }
    }
}

struct UserAuthData: Codable {
    let id: String
    let name: String
    let email: String
}
