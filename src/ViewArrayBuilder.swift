import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
@_functionBuilder public struct ViewArrayBuilder {
  
  /// Builds an empty view from an block containing no statements, `{ }`.
  public static func buildBlock() -> [AnyView] {
    [AnyView(EmptyView())]
  }
  
  /// Passes a single view written as a child view (e..g, `{ Text("Hello") }`) through
  /// unmodified.
  public static func buildBlock<Content>(_ content: Content) -> [AnyView] where Content : View {
    [AnyView(content)]
  }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewArrayBuilder {
  
  /// Provides support for "if" statements in multi-statement closures, producing an `Optional` view
  /// that is visible only when the `if` condition evaluates `true`.
  public static func buildIf<Content>(_ content: Content?) -> [AnyView] where Content : View {
    guard let content = content else {
      return []
    }
    return [AnyView(content)]
  }
  
  /// Provides support for "if" statements in multi-statement closures, producing
  /// ConditionalContent for the "then" branch.
  //public static func buildEither<TrueContent, FalseContent>(first: TrueContent) -> _ConditionalContent<TrueContent, FalseContent> where TrueContent : View, FalseContent : View

  /// Provides support for "if-else" statements in multi-statement closures, producing
  /// ConditionalContent for the "else" branch.
  // public static func buildEither<TrueContent, FalseContent>(second: FalseContent) -> _ConditionalContent<TrueContent, FalseContent> where TrueContent : View, FalseContent : View
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewArrayBuilder {
  
  public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> [AnyView] where C0 : View, C1 : View {
    [
      AnyView(c0),
      AnyView(c1),
    ]
  }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewArrayBuilder {
  
  public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> [AnyView] where C0 : View, C1 : View, C2 : View {
    [
      AnyView(c0),
      AnyView(c1),
      AnyView(c2),
    ]
  }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewArrayBuilder {
  
  public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> [AnyView] where C0 : View, C1 : View, C2 : View, C3 : View {
    [
      AnyView(c0),
      AnyView(c1),
      AnyView(c2),
      AnyView(c3),
    ]
  }
}


@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewArrayBuilder {
  
  public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> [AnyView] where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View {
    [
      AnyView(c0),
      AnyView(c1),
      AnyView(c2),
      AnyView(c3),
      AnyView(c4),
    ]
  }
}


@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewArrayBuilder {
  
  public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> [AnyView] where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View {
    [
      AnyView(c0),
      AnyView(c1),
      AnyView(c2),
      AnyView(c3),
      AnyView(c4),
      AnyView(c5),
    ]
  }
}


@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewArrayBuilder {
  
  public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> [AnyView] where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View {
    [
      AnyView(c0),
      AnyView(c1),
      AnyView(c2),
      AnyView(c3),
      AnyView(c4),
      AnyView(c5),
      AnyView(c6),
    ]
  }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewArrayBuilder {
  
  public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> [AnyView] where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View {
    [
      AnyView(c0),
      AnyView(c1),
      AnyView(c2),
      AnyView(c3),
      AnyView(c4),
      AnyView(c5),
      AnyView(c6),
      AnyView(c7),
    ]
  }
}


@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewArrayBuilder {
  
  public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> [AnyView] where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View {
    [
      AnyView(c0),
      AnyView(c1),
      AnyView(c2),
      AnyView(c3),
      AnyView(c4),
      AnyView(c5),
      AnyView(c6),
      AnyView(c7),
      AnyView(c8),
    ]
  }
}


@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewArrayBuilder {
  
  public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> [AnyView] where C0 : View, C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View, C9 : View {
    [
      AnyView(c0),
      AnyView(c1),
      AnyView(c2),
      AnyView(c3),
      AnyView(c4),
      AnyView(c5),
      AnyView(c6),
      AnyView(c7),
      AnyView(c8),
      AnyView(c9),
    ]
  }
}
