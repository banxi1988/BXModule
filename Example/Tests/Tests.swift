import UIKit
import XCTest
import BXModule

class DemoModule: NSObject, BXModule{
  
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
    
    func testEmptyModule() {
      let module = DemoModule()
      BXModuleManager.shared.add(module: module)
      BXModuleManager.shared.applicationWillTerminate(UIApplication.shared)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
