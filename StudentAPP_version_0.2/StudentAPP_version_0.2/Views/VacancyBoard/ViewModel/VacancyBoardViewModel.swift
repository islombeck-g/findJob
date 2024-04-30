//
//  VacancyBoardViewModel.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 30/04/24.
//

import Foundation
import Combine

final class VacancyBoardViewModel: VacancyBoardViewModelProtocol {
    
    @Published var listOfVacancy: [Job] = []
    @Published var isFavouriteList = false
    @Published var favouriteListOfVacancy: [Job] = []
//    @Published var favouriteListOfJob: Set<Job>
    private var cancellables = Set<AnyCancellable>()
    
    @Published var searchText:String = ""
    
    init() {
        VacancyServiceFromFirebase.shared.$jobs
                    .assign(to: \.listOfVacancy, on: self)
                    .store(in: &cancellables)
    }
    
    var filteredJobs: Array<Job> {
        guard !searchText.isEmpty else { return listOfVacancy}

        return listOfVacancy.filter { job in
            job.nameOfCompany.lowercased().contains(searchText.lowercased()) ||
            job.description.lowercased().contains(searchText.lowercased())
        }
    }
    
    func applyResume(_ job: Job) {
        let userID = UserStateManager.shared.currentUser!.id
        print("tap to button")
        MessangerServiceFromFirebase.shared.startChat(userId: userID, companyId: job.companyId, vacancyId: job.id, vacancyName: job.position, firstMessageText: "я бы хотел откликнуться на вакансию") { result, error in     
        }
    }
}

protocol VacancyBoardViewModelProtocol: ObservableObject {
    var listOfVacancy: [Job] { get }
    var favouriteListOfVacancy: [Job] { get }
    var isFavouriteList: Bool { get set }
    var searchText: String { get set }
    var filteredJobs: [Job] { get }
    func applyResume(_ job: Job)
}
