import XCTest
import MobilliumUserDefaults

struct Person: Codable {
    let name: String
    let age: Int
    let weight: Double
    let height: Int
    let job: Job
}

struct Job: Codable {
    let name: String
    let address: String
    let position: String
    let yearsOfExprience: Int
}

extension DefaultsKey {
    static let stringKey = Key<String>(key: "stringKey")
    static let intKey = Key<Int>(key: "intKey")
    static let boolKey = Key<Bool>(key: "boolKey")
    static let doubleKey = Key<Double>(key: "doubleKey")
    static let dateKey = Key<Date>(key: "dateKey")
    static let arrayKey = Key<[String]>(key: "arrayKey")
    static let codableKey = Key<Person>(key: "codableKey")
}

class Tests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testString() {
        // Value
        let value = "string"
        // Save
        DefaultsKey.stringKey.value = value
        // Check
        let hasKey = DefaultsKey.stringKey.has
        XCTAssertTrue(hasKey)
        // Equal
        let savedValue = DefaultsKey.stringKey.value
        XCTAssertEqual(savedValue, value)
    }
    func testInt() {
        // Value
        let value = 1903
        // Save
        DefaultsKey.intKey.value = value
        // Check
        let hasKey = DefaultsKey.intKey.has
        XCTAssertTrue(hasKey)
        // Equal
        let savedValue = DefaultsKey.intKey.value
        XCTAssertEqual(savedValue, value)
    }
    func testDouble() {
        // Value
        let value = 999.9
        Defaults = UserDefaults.standard
        // Save
        DefaultsKey.doubleKey.value = value
        // Check
        let hasKey = DefaultsKey.doubleKey.has
        XCTAssertTrue(hasKey)
        // Equal
        let savedValue = DefaultsKey.doubleKey.value
        XCTAssertEqual(savedValue, value)
    }
    func testBool() {
        // Value
        let value = true
        // Save
        DefaultsKey.boolKey.value = value
        // Check
        let hasKey = DefaultsKey.boolKey.has
        XCTAssertTrue(hasKey)
        // Equal
        let savedValue = DefaultsKey.boolKey.value
        XCTAssertEqual(savedValue, value)
    }
    func testDate() {
        // Value
        let value = Date()
        // Save
        DefaultsKey.dateKey.value = value
        // Check
        let hasKey = DefaultsKey.dateKey.has
        XCTAssertTrue(hasKey)
        // Equal
        let savedValue = DefaultsKey.dateKey.value
        XCTAssertEqual(savedValue, value)
    }
    func testArray() {
        // Value
        let value = ["row 0", "row 1", "row 2", "row 3", "row 4", "row 5"]
        // Save
        DefaultsKey.arrayKey.value = value
        // Check
        let hasKey = DefaultsKey.arrayKey.has
        XCTAssertTrue(hasKey)
        // Equal
        let savedValue = DefaultsKey.arrayKey.value
        XCTAssertEqual(savedValue, value)
    }
    func testCodableObject() {
        // Value
        let job = Job(name: "Mobillium",
                      address: "Beyoğlu",
                      position: "IOS Developer",
                      yearsOfExprience: 1)
        
        let person = Person(name: "Emir",
                           age: 27,
                           weight: 100.5,
                           height: 193,
                           job: job)
        // Save
        DefaultsKey.codableKey.value = person
        // Check
        let hasKey = DefaultsKey.codableKey.has
        XCTAssertTrue(hasKey)
        let savedJob = DefaultsKey.codableKey.value?.job
        XCTAssertEqual(savedJob!.name, job.name)
        // Equal
        let savedValue = DefaultsKey.codableKey.value
        XCTAssertEqual(savedValue!.name, person.name)
        // Nil
        DefaultsKey.codableKey.value = nil
        XCTAssertFalse(DefaultsKey.codableKey.has)
        // Remove
        DefaultsKey.codableKey.remove()
        XCTAssertFalse(DefaultsKey.codableKey.has)
    }
}
