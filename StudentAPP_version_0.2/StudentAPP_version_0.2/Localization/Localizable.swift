//
//  Localizable.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import Foundation

enum Localizable: String {
    
    // MARK: - General
    
    case hello = "HELLO" //+
    case talentExchange = "TALENT_EXCHANGE" //+
    case login = "LOGIN" // +
    case registration = "REGISTRATION" // +
    case back = "BACK"
    case next = "NEXT"
    case logInWith = "LOG_IN_WITH" //+
    case personalInformation = "PERSONAL_INFORMATION" //+
    case username = "USERNAME"
    case password = "PASSWORD"
    case forgotPassword = "FORGOT_PASSWORD"
    case main = "MAIN"
    case apply = "APPLY"
    case jobVacancy = "JOB_VACANCY"
    case responses = "RESPONSES"
    case invitations = "INVITATIONS"
    case selectLanguage = "SELECT_LANGUAGE"
    case profile = "PROFILE"
    case editProfile = "EDIT_PROFILE"
    case deleteAccount = "DELETE_ACCOUNT"
    case myCV = "MY_CV"
    case technicalSupport = "TECHNICAL_SUPPORT"
    case logOut = "LOG_OUT"
    case logOutConfirmation = "LOG_OUT_CONFIRMATION"
    case cancel = "CANCEL"
    case delete = "DELETE"
    case accountRecoveryNote = "ACCOUNT_RECOVERY_NOTE"
    
    // MARK: - User Details
    
    case dateOfBirth = "DATE_OF_BIRTH"
    case placeOfStudy = "PLACE_OF_STUDY"
    case university = "UNIVERSITY"
    case institute = "INSTITUTE"
    case fieldOfStudy = "FIELD_OF_STUDY"
    case aboutMe = "ABOUT_ME"
    case lastName = "LAST_NAME"
    case firstName = "FIRST_NAME"
    case middleName = "MIDDLE_NAME"
    case requiredExperience = "REQUIRED_EXPERIENCE"
    case employment = "EMPLOYMENT"
    case company = "COMPANY"
    case industry = "INDUSTRY"
    case employmentType = "EMPLOYMENT_TYPE"
    case location = "LOCATION"
    case salary = "SALARY"
    case aboutTheVacancy = "ABOUT_THE_VACANCY"
    case saveChanges = "SAVE_CHANGES"
    
    // MARK: - Support
    
    case support = "SUPPORT"
    case askYourQuestion = "ASK_YOUR_QUESTION"
    
    // MARK: - Resume
    
    case resume = "RESUME"
    case age = "AGE"
    case years = "YEARS"
    case citizenship = "CITIZENSHIP"
    case phone = "PHONE"
    case education = "EDUCATION"
    case additionalEducation = "ADDITIONAL_EDUCATION"
    case certificatesRecommendations = "CERTIFICATES_RECOMMENDATIONS"
    case skills = "SKILLS"
    case desiredSalaryLevel = "DESIRED_SALARY_LEVEL"
    case workExperience = "WORK_EXPERIENCE"
    case createResume = "CREATE_RESUME"
    case resumeCreation = "RESUME_CREATION"
    case desiredPosition = "DESIRED_POSITION"
    
    // MARK: - Placeholder
    
    case requiredWorkExperience = "REQUIRED_WORK_EXPERIENCE"
    case employmentFormat = "EMPLOYMENT_FORMAT"
    case companyPlaceholder = "COMPANY_PLACEHOLDER"
    case industryPlaceholder = "INDUSTRY_PLACEHOLDER"
    case locationPlaceholder = "LOCATION_PLACEHOLDER"
    case salaryPlaceholder = "SALARY_PLACEHOLDER"
    case aboutVacancyPlaceholder = "ABOUT_VACANCY_PLACEHOLDER"
    case questionPlaceholder = "QUESTION_PLACEHOLDER"
    case agePlaceholder = "AGE_PLACEHOLDER"
    case universityPlaceholder = "UNIVERSITY_PLACEHOLDER"
    case deleteResumeConfirmation = "DELETE_RESUME_CONFIRMATION"
    case editResume = "EDIT_RESUME"
    case desiredPositionPlaceholder = "DESIRED_POSITION_PLACEHOLDER"
}
extension Localizable {
    var localized: String {
        return localized(bundle: bundle())
    }
    
    func localized(_ args: CVarArg...) -> String {
        return String(format: localized(bundle: bundle()), arguments: args)
    }
    
    private func bundle() -> Bundle {
        let language = LocalizationService.shared.selectedLanguage
        let path = Bundle.main.path(forResource: language.rawValue, ofType: "lproj")
        let bundle: Bundle
        if let path = path {
            bundle = Bundle(path: path) ?? .main
        } else {
            bundle = .main
        }
        return bundle
    }
    
    private func localized(bundle: Bundle) -> String {
        return NSLocalizedString(self.rawValue, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}

final class LocalizationService: ObservableObject {
    static let language = "language"
    static let shared = LocalizationService()
    var selectedLanguage: Language {
            get {
                guard let languageString = UserDefaults.standard.string(forKey: LocalizationService.language) else {
                    return Language.currentLanguage
                }
                return Language(rawValue: languageString) ?? Language.currentLanguage
            }
            set {
                UserDefaults.standard.set(newValue.rawValue, forKey: LocalizationService.language)
            }
        }
}

enum Language: String, CaseIterable {
    case ru = "ru"
    case en = "en"
    case uz = "uz"
    
    static var currentLanguage: Language {
        let locale = NSLocale.current.languageCode!
        if let language = Language(rawValue: locale) {
            return language
        } else if let language = Language.allCases.first(where: { $0.rawValue.prefix(2) == locale }) {
            return language
        }
        return .en
    }
}
