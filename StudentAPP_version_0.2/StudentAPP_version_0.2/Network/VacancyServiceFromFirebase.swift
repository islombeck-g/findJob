//
//  VacancyServiceFromFirebase.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 30/04/24.
//

import Foundation
import FirebaseFirestore

final class VacancyServiceFromFirebase: ObservableObject {
    static let shared = VacancyServiceFromFirebase()
    
    @Published var jobs: [Job] = []
    private let db = Firestore.firestore()
    
    init() {
        self.get()
    }
    
    func get() {
        print(1)
        fetchJobs { result in
            DispatchQueue.main.async {
                self.jobs = result
                print(self.jobs)
                print(10)
            }
        }
    }
    
   private func fetchJobs(completion: @escaping ([Job]) -> Void) {
       print(2)
        db.collection("jobs").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                print(3)
                completion([])
                return
            }
            print(4)
            var jobs = [Job]()
            
            for document in querySnapshot!.documents {
                print(5)
                let data = document.data()
                
                if let activity = data["activity"] as? String, // +
                   let nameOfCompany = data["nameOfCompany"] as? String,
                   let position = data["position"] as? String,
                   let jobType = data["jobType"] as? String,
                   let location = data["location"] as? String,
                   let money = data["money"] as? String,
                   let description = data["description"] as? String, //
                   let minExperience = data["minExperience"] as? Int {
                    
                    if let experienceDict = data["experience"] as? [String: Any] {
                        var experience = [String]()
                        for (_, value) in experienceDict {
                            if let experienceItem = value as? String {
                                experience.append(experienceItem)
                            }
                        }
                        
                        print(6)
                        let job = Job(id: document.documentID, activity: activity, nameOfCompany: nameOfCompany, position: position, jobType: jobType, experience: experience, location: location, money: money, description: description, minExperience: minExperience)
                        jobs.append(job)
                    }
                }
            }
            print(7)
            completion(jobs)
        }
    }
}
