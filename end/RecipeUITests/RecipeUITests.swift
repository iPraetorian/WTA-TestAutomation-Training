import XCTest



class RecipeUITests: XCTestCase {


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func VerifyRecipesAppear() throws {
        
        let app = XCUIApplication()
        app.launch()

        XCTAssert(app.staticTexts["Avocado Tomato Pizza"].exists)
        XCTAssert(app.staticTexts["Cappuccino"].exists)
        XCTAssert(app.staticTexts["Cupcakes"].exists)
        XCTAssert(app.staticTexts["Seafood Paella"].exists)
        XCTAssert(app.staticTexts["Zucchini Chips"].exists)

    }
}
