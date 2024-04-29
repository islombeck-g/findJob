//
//  ProfileServiceFromFirebase.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import Foundation
import FirebaseFirestore

final class ProfileServiceFromFirebase {
    
    static var shared = ProfileServiceFromFirebase()
    private let db = Firestore.firestore()
    
    func createUserData(_ userData: UserDataForNetwork, completion: @escaping (Result<Void, Error>) -> Void) {
        let documentRef = db.collection("users").document(userData.userAuthData.id)
        let userAuthData = [
            "id": userData.userAuthData.id,
            "email": userData.userAuthData.email
        ]
        do {
            documentRef.setData([
                "id": userData.userAuthData.id,
                "userAuthData": userAuthData,
                "firstName": userData.firstName,
                "secondName": userData.secondName,
                "patronymicName": userData.patronymicName,
                "birthDate": userData.birthDate,
                "gender": userData.gender,
                "city": userData.city,
                "university": userData.university,
                "institute": userData.institute,
                "direction": userData.direction,
                "phoneNumber": userData.phoneNumber,
                "aboutMe": userData.aboutMe]) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
            }
        }
    }
    
    func readUserData(userId: String, completion: @escaping (Result<UserDataForNetwork?, Error>) -> Void) {
        print("userID: \(userId)")
        db.collection("users").document(userId).getDocument { document, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let document = document else {
                completion(.success(nil))
                return
            }

            if let userDataDict = document.data(),
               let userAuthDataDict = userDataDict["userAuthData"] as? [String: Any] {
                do {
                    let userData = UserDataForNetwork( 
                        userAuthData: UserAuthData(
                            id: userAuthDataDict["id"] as! String,
                            email: userAuthDataDict["email"] as! String),
                        firstName: userDataDict["firstName"] as! String,
                        secondName: userDataDict["secondName"] as! String,
                        patronymicName: userDataDict["patronymicName"] as! String,
                        birthDate: userDataDict["birthDate"] as! String,
                        university: userDataDict["university"] as! String,
                        institute: userDataDict["institute"] as! String,
                        phoneNumber: userDataDict["phoneNumber"] as! String,
                        aboutMe: userDataDict["aboutMe"] as! String,
                        gender: userDataDict["gender"] as! String,
                        city: userDataDict["city"] as! String,
                        direction: userDataDict["direction"] as! String
                    )
                    completion(.success(userData))
                }
            } else {
                completion(.success(nil))
            }
        }
    }
    
    func updateUserData(userId: String, updatedUserData: UserDataForNetwork, completion: @escaping (Result<Void, Error>) -> Void) {
        let documentRef = db.collection("users").document(userId)
        
        let userAuthData = [
            "userAuthData.id": updatedUserData.userAuthData.id,
            "userAuthData.email": updatedUserData.userAuthData.email
        ]
        
        let updateData: [String: Any] = [
            "firstName": updatedUserData.firstName,
            "secondName": updatedUserData.secondName,
            "patronymicName": updatedUserData.patronymicName,
            "birthDate": updatedUserData.birthDate,
            "gender": updatedUserData.gender,
            "city": updatedUserData.city,
            "university": updatedUserData.university,
            "institute": updatedUserData.institute,
            "direction": updatedUserData.direction,
            "phoneNumber": updatedUserData.phoneNumber,
            "aboutMe": updatedUserData.aboutMe
        ]
        
        documentRef.updateData(updateData) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                documentRef.updateData(userAuthData) { error in
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.success(()))
                    }
                }
            }
        }
    }
}
