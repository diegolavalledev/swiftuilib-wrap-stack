import SwiftUI
import XCTest
import SwiftUILib_WrapStack

final class WrapStackTests: XCTestCase {

  func testWHStack() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    _ = WHStack { () -> [AnyView] in }
    _ = WHStack { Color.red }
    _ = WHStack {
      Color.red
      Color.green
      Color.blue
    }
    _ = WHStack {
      Color.red
      Text("green")
      Color.blue
    }
    _ = WHStack {[
      Color.red,
      Color.green,
      Color.blue,
    ]}
    //XCTAssertEqual(WrapStack().text, "Hello World 👋")
  }

  func testWVStack() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    _ = WVStack { () -> [AnyView] in }
    _ = WVStack { Color.red }
    _ = WVStack {
      Color.red
      Color.green
      Color.blue
    }
    _ = WVStack {
      Color.red
      Text("green")
      Color.blue
    }
    _ = WVStack {[
      Color.red,
      Color.green,
      Color.blue,
    ]}
    //XCTAssertEqual(WrapStack().text, "Hello World 👋")
  }
}
