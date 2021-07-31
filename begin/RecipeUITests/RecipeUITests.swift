/// Copyright (c) 2021 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

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

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        //List of requirements
        let mainTitle: String = "Recipes for the Day"
        let recipeList: [String] = ["Avocado Tomato Pizza", "Cappuccino", "Cupcakes", "Seafood Paella", "Zucchini Chips"]
//        let commonItemList: [String, UIElementType] = [["←", button], ["😍", button], ["Ingredients", selected tab], ["Instructions", tab]]
        let recipeTitle: String = "Avocado Tomato Pizza"
        let ingredientList: [String] = ["2 green avocados", "a tablespoon of chopped cilantro", "tablespoon of lime juice", "tablespoon of salt", "1 peeled garlic", "8 inch pre-baked pizza crust", "1 tablespoon of organic olive oil", "1 cup of sliced tomatoes", "1 cup of shredded pepper jack cheese", "1 red pepper chopped up"]
        let instructionsList: [String] = ["Preheat oven 450 degrees.", "Mix the avocados and cilantros together.", "Puree while adding the table spoon of salt and juice, once done cover it and set it aside.", "Next slice the garlic clove and rub it on the pizza crust. This gives the pizza some flavor. Next use a brush to brush the crust with the organic olive oil.", "Now spread the advocado you mixed over the top of the crush, and arrange the cilantro and tomoatos on top. Lastly sprinkle the cheese and season with any kind of pepper you want.", "Place the pizza on a baking sheet.", "Broil for about 5 minutes in the preheated oven, or when you see that the crust loooks toasted. Take it out and EAT!!!"]
        
        
        //Verify the string in the Page Header matches requirements
        func verifyPageHeader(requiredTitle: String) {
            XCTAssert(app.staticTexts["\(requiredTitle)"].exists, "Correct Header")
        }
        
        
        //Common method for verifying elements in a given List View match requirements
        func verifyItemsArePresent(itemList: [String]) {
            var n = 1
            for item in itemList {
                XCTAssert(app.staticTexts["\(item)"].exists, "Item \(n) Exists")
                n+=1
            }
        }
        
        //Loop through all of the recipes on the main page
        for recipe in recipeList {
            //Tap on the next recipe in the list
            app.staticTexts[recipe].tap()

            //Tap on the back-arrow to return to the Main View
            app.buttons["←"].tap()
        }
        //TO-DO: Page-object Model class that lists out ingredients and instructions
        
        
        
        
        //TO-DO: Verify tap functionality works for check-box and strikethrough
        
        
        
        
        
        //Main view UI tests
        //Verify correct Page Title
        verifyPageHeader(requiredTitle: mainTitle)
        
        //Verify correct Recipe List
        verifyItemsArePresent(itemList: recipeList)
        
        
        
//        for index in recipeList {
//            XCTAssert(app.staticTexts["\(index)"].exists, "Recipe Exists")
//        }
        
        //TEMPORARY: Test the Zucchini Chips ingredients only
        //TO-DO: Move this into a Page-object Model Class later
        
        app.staticTexts["Zucchini Chips"].tap()
        
        let compareString = ["Cooking spray so the chips don't get sticky on the tray", "Get 3 zucchini's, green or yellow", "1 tablespoon of organic olive oil", "1/4 Any type of cheese", "1/4 cup of flour", "1 teaspoon of salt", "Garlic powder", "grounded black pepper", "paprika"]
        
        verifyItemsArePresent(itemList: compareString)
        
//        for index in compareString {
//            print("Test \(index)")
//            XCTAssert(app.staticTexts["\(index)"].exists, "\(index) test passed")
//
//        }
        
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
