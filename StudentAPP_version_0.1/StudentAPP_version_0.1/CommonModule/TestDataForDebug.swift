//MARK: for debag, in realese remove

var listOfJob:Set<Job> = [
    Job(id: "4", activity: "Программировани",
        nameOfCompany: "ГУГЛ",
        position: "Программист 1С",
        jobType: "Полный день",
        experience: ["Диплом о высшем образовании","Коммерческий опыт от 2-ух лет","Знание английского языка"],
        location: "Центр Казани",
        money: "от 40 000 до 120 000",
        description: "Ищем трудолюбивых и энергичных юристов в крутой коллектив",
        minExperience: 2),
    Job(id: "5",
        activity: "Юр испрюденция",
        nameOfCompany: "Газпром нефть",
        position: "Юрист стажер",
        jobType: "Полный день",
        experience: ["Диплом о высшем образовании","Коммерческий опыт от 2-ух лет","Знание английского языка"],
        location: "Центр Казани",
        money: "от 40 000 до 120 000",
        description: "Ищем трудолюбивых и энергичных юристов в крутой коллектив",
        minExperience: 2),
    Job(id: "6",
        activity: "Юриспрюденция",
        nameOfCompany: "Яндекс",
        position: "Юрист тимлид",
        jobType: "Полный день",
        experience: ["Диплом о высшем образовании","Коммерческий опыт от 2-ух лет","Знание английского языка"],
        location: "Центр Казани",
        money: "от 40 000 до 120 000",
        description: "Ищем трудолюбивых и энергичных юристов в крутой коллектив",
        minExperience: 2),
    Job(id: "24", activity: "Программировани",
        nameOfCompany: "ГУГЛ",
        position: "Программист 1С",
        jobType: "Полный день",
        experience: ["Диплом о высшем образовании","Коммерческий опыт от 2-ух лет","Знание английского языка"],
        location: "Центр Казани",
        money: "от 40 000 до 120 000",
        description: "Ищем трудолюбивых и энергичных юристов в крутой коллектив",
        minExperience: 2),
    Job(id: "14", activity: "Программировани",
        nameOfCompany: "ГУГЛ",
        position: "Программист 1С",
        jobType: "Полный день",
        experience: ["Диплом о высшем образовании","Коммерческий опыт от 2-ух лет","Знание английского языка"],
        location: "Центр Казани",
        money: "от 40 000 до 120 000",
        description: "Ищем трудолюбивых и энергичных юристов в крутой коллектив",
        minExperience: 2),
    Job(id: "7",
        activity: "Программировани",
        nameOfCompany: "Яндекс",
        position: "Java developer",
        jobType: "Полный день",
        experience: ["Диплом о высшем образовании","Коммерческий опыт от 2-ух лет","Знание английского языка"],
        location: "Центр Казани",
        money: "от 40 000 до 120 000",
        description: "Ищем трудолюбивых и энергичных юристов в крутой коллектив",
        minExperience: 2)
]

var testUserFullData: UserFullData = UserFullData(
    firstName: "Руслан",
    secondName: "Чебоксаров",
    patronymicName: "",
    gender: .male,
    city: "Москва",
    university: "Московский Государственный Университет",
    phoneNumber: "+7 (888) 888-88-88",
    image: "userImage",
    birthDate: "10.02.2000",
    aboutMe: "я очень интреесный человек, учусь, не работаю",
    institute: "Институт вычислительной математики и информационных техноолгий",
    direction: "Фундаментальная информатики и информационные технологии", 
    user: userTestData)

var userTestData = User(email: "testUserData@gmail.com", id: "sdaf", role: "student", password: "sdflakbdsfuads", isActivated: true)

var cvTestData = CvData(
    age: 20,
    position: "IOS - developer",
    firstName: "Руслан",
    secondName: "Хамдамов",
    patronymicName: "Арсланович",
    birthDate: "25.12.2000",
    birthCountry: "Чехия",
    phoneNumber: "+998(97)231-43-21",
    university: "Казанский (Приволжский) Федеральный университет",
    institute: "Институт вычислительной математики и информационных технологий",
    direction: "Фундаментальная математика и информационные технологии",
    anotherEducation: "-",
    certificates: "IELTS 10",
    skills: "Swift, SwiftUI, algorithms, LaTex, cooking",
    money: "от 100 000 до 300 000 руб",
    workExperience: "Лаборатория КФУ",
    employmentType: "Полная занятость",
    aboutMe: "Очень хороший человек")

let customCvData: CvData = CvData(
    age: 20, position: "IOS - developer", firstName: "Руслан", secondName: "Хамдамов", patronymicName: "Арсланович", birthDate: "25.12.2000", birthCountry: "Чехия", phoneNumber: "+998(97)231-43-21", university: "Казанский (Приволжский) Федеральный университет", institute: "Институт вычислительной математики и информационных технологий", direction: "Фундаментальная математика и информационные технологии", anotherEducation: "-", certificates: "IELTS 10", skills: "Swift, SwiftUI, algorithms, LaTex, cooking", money: "от 100 000 до 300 000 руб", workExperience: "Лаборатория КФУ", employmentType: "Полная занятость", aboutMe: "Очень хороший человек")
