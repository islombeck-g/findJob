//
//  CVViewModel.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 29/04/24.
//

import Foundation
import Combine

final class CVViewModel: CVViewModelProtocol {
    
    @Published var resumes: [CvData] = []
    private var cancellables = Set<AnyCancellable>()
    init() {
        ResumeServiceFromFirebase.shared.$cvs
                    .assign(to: \.resumes, on: self)
                    .store(in: &cancellables)
    }
    
    func getResumes() {
        let userID = UserStateManager.shared.currentUser!.id
        ResumeServiceFromFirebase.shared.get(forUserID: userID)
    }
    
    func createResume(_ newCV: CvData) {
        let userID = UserStateManager.shared.currentUser!.id
        var cvForCreate = newCV
        cvForCreate.parentID = userID
        ResumeServiceFromFirebase.shared.create(resumeData: cvForCreate) { result in
            switch result {
            case .success(let success):
                print("success create \(success)")
            case .failure(let failure):
                print("fail: \(failure.localizedDescription)")
            }
        }
    }
    func updateResume(_ newCV: CvData) {
        ResumeServiceFromFirebase.shared.update(resumeData: newCV)
    }
    func deleteResume(_ cvToDelete: CvData) {
        print(cvToDelete.id)
        print("cvToDelete.id")
        ResumeServiceFromFirebase.shared.delete(resumeData: cvToDelete)
    }
}

protocol CVViewModelProtocol: ObservableObject {
    func createResume(_ newCV: CvData)
    var resumes: [CvData] { get }
    func getResumes()
    func updateResume(_ newCV: CvData)
    func deleteResume(_ newCV: CvData)
}
