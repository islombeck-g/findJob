//
//  ResumeServiceFromFirebase.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 29/04/24.
//

import Foundation
import FirebaseFirestore

final class ResumeServiceFromFirebase {
    static var shared = ResumeServiceFromFirebase()
    private let db = Firestore.firestore()
    
    @Published var cvs: [CvData] = []
    
    func create(resumeData: CvData, completion: @escaping(Result<Bool, Error>) -> Void) {
        self.createResume(resumeData: resumeData) { result in
            switch result {
            case .success:
                self.fetchResumes(forUserID: resumeData.parentID) { result in
                    switch result {
                    case .success(let resumes):
                        DispatchQueue.main.async {
                            self.cvs = resumes
                        }
                        completion(.success(true))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                print("?????error in createResume: \(error.localizedDescription)")
                completion(.failure(error.localizedDescription as! Error))
            }
        }
    }
    func get(forUserID: String) {
        self.fetchResumes(forUserID: forUserID) { result in
            switch result {
            case .success(let resumes):
                print("resumes\n\(resumes)")
                DispatchQueue.main.async {
                    self.cvs = resumes
                }
            case .failure(let error):
                print("???error in getResumes: \(error.localizedDescription)")
            }
        }
    }
    func update(resumeData: CvData) {
        updateResume(resumeData: resumeData) { result in
            switch result {
            case .success(_):
                self.fetchResumes(forUserID: resumeData.parentID) { result in
                    switch result {
                    case .success(let resumes):
                        DispatchQueue.main.async {
                            self.cvs = resumes
                        }
                    case .failure(let error):
                        print("???error in updateResume: \(error.localizedDescription)")
                    }
                }
            case .failure(let failure):
                print("???error in updateResume: \(failure.localizedDescription)")
            }
        }
    }
    func delete(resumeData: CvData) {
        deleteResume(resumeData: resumeData) { result in
            print(result)
            print(10)
        }
    }
    private func createResume(resumeData: CvData, completion: @escaping (Result<String, Error>) -> Void) {
        
        let resumeDict: [String: Any] = [
            "id": resumeData.id,
            "parentID": resumeData.parentID,
            "age": resumeData.age,
            "position": resumeData.position,
            "firstName": resumeData.firstName,
            "secondName": resumeData.secondName,
            "patronymicName": resumeData.patronymicName,
            "birthDate": resumeData.birthDate,
            "birthCountry": resumeData.birthCountry,
            "phoneNumber": resumeData.phoneNumber,
            "university": resumeData.university,
            "institute": resumeData.institute,
            "direction": resumeData.direction,
            "anotherEducation": resumeData.anotherEducation,
            "certificates": resumeData.certificates,
            "skills": resumeData.skills,
            "money": resumeData.money,
            "workExperience": resumeData.workExperience,
            "employmentType": resumeData.employmentType,
            "aboutMe": resumeData.aboutMe
        ]
        
        let documentRef = db.collection("resume").addDocument(data: resumeDict)
        
        documentRef.setData(resumeDict) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(documentRef.documentID))
            }
        }
    }

    private func fetchResumes(forUserID userID: String, completion: @escaping (Result<[CvData], Error>) -> Void) {
        let query = db.collection("resume").whereField("parentID", isEqualTo: userID)
        
        query.getDocuments { (snapshot, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let documents = snapshot?.documents else {
                completion(.success([]))
                return
            }
            
            let resumes = documents.compactMap { document -> CvData? in
                let data = document.data()
                return CvData(
                    id: document.documentID,
                    parentID: data["parentID"] as? String ?? "",
                    age: data["age"] as? Int ?? 0,
                    position: data["position"] as? String ?? "",
                    firstName: data["firstName"] as? String ?? "",
                    secondName: data["secondName"] as? String ?? "",
                    patronymicName: data["patronymicName"] as? String ?? "",
                    birthDate: data["birthDate"] as? String ?? "",
                    birthCountry: data["birthCountry"] as? String ?? "",
                    phoneNumber: data["phoneNumber"] as? String ?? "",
                    university: data["university"] as? String ?? "",
                    institute: data["institute"] as? String ?? "",
                    direction: data["direction"] as? String ?? "",
                    anotherEducation: data["anotherEducation"] as? String ?? "",
                    certificates: data["certificates"] as? String ?? "",
                    skills: data["skills"] as? String ?? "",
                    money: data["money"] as? String ?? "",
                    workExperience: data["workExperience"] as? String ?? "",
                    employmentType: data["employmentType"] as? String ?? "",
                    aboutMe: data["aboutMe"] as? String ?? ""
                )
            }
            completion(.success(resumes))
        }
    }

    private func updateResume(resumeData: CvData, completion: @escaping(Result<Bool, Error>) -> Void) {
        let query = db.collection("resume").document(resumeData.id)
        
        query.getDocument { (snapshot, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let document = snapshot else {
                completion(.failure(NSError(domain: "ResumeServiceFromFirebase", code: -1, userInfo: [NSLocalizedDescriptionKey: "Resume not found"])))
                return
            }
            
            let resumeDict: [String: Any] = [
                "age": resumeData.age,
                "position": resumeData.position,
                "firstName": resumeData.firstName,
                "secondName": resumeData.secondName,
                "patronymicName": resumeData.patronymicName,
                "birthDate": resumeData.birthDate,
                "birthCountry": resumeData.birthCountry,
                "phoneNumber": resumeData.phoneNumber,
                "university": resumeData.university,
                "institute": resumeData.institute,
                "direction": resumeData.direction,
                "anotherEducation": resumeData.anotherEducation,
                "certificates": resumeData.certificates,
                "skills": resumeData.skills,
                "money": resumeData.money,
                "workExperience": resumeData.workExperience,
                "employmentType": resumeData.employmentType,
                "aboutMe": resumeData.aboutMe
            ]
            
            document.reference.updateData(resumeDict) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    self.fetchResumes(forUserID: resumeData.parentID) { result in
                        switch result {
                        case .success(let resumes):
                            DispatchQueue.main.async {
                                self.cvs = resumes
                            }
                            completion(.success(true))
                        case .failure(let error):
                            completion(.failure(error))
                        }
                    }
                }
            }
        }
    }
    
    private func deleteResume(resumeData: CvData, completion: @escaping(Result<Bool, Error>) -> Void) {
        let documentRef = db.collection("resume").document(resumeData.id)
        print(resumeData.id)
        documentRef.delete { error in
            if let error = error {
                completion(.failure(error))
                print(1)
            } else {
                print(2)
                self.fetchResumes(forUserID: resumeData.parentID) { result in
                    switch result {
                    case .success(let resumes):
                        print(3)
                        DispatchQueue.main.async {
                            self.cvs = resumes
                        }
                        print(4)
                        completion(.success(true))
                    case .failure(let error):
                        print(5)
                        completion(.failure(error))
                    }
                }
            }
        }
    }
    
}
