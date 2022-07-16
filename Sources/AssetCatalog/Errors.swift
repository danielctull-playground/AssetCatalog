
struct IncorrectFileExtension: Error {
    let expected: String
    let received: String
}
