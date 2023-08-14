import SwiftUI

public struct WVStack: View {

  @usableFromInline var alignment: HorizontalAlignment = .center
  @usableFromInline var spacing: CGFloat = 0
  @usableFromInline let content: [AnyView]
  @State private var width: CGFloat = 0

  
  @usableFromInline init(_ alignment: HorizontalAlignment?, _ spacing: CGFloat?, _ content: [AnyView]) {
    if let alignment = alignment {
      self.alignment = alignment
    }
    if let spacing = spacing {
      self.spacing = spacing
    }
    self.content = content
  }
  
  // Work-around for https://bugs.swift.org/browse/SR-11628
  @inlinable public init<Content: View>(alignment: HorizontalAlignment? = nil, spacing: CGFloat? = nil, content: () -> Content) {
    self.init(alignment, spacing, [AnyView(content())])
  }
  
  @inlinable public init<Content: View>(alignment: HorizontalAlignment? = nil, spacing: CGFloat? = nil, content: () -> [Content]) {
    self.init(alignment, spacing, content().map { AnyView($0) })
  }
  
  // Known issue: https://bugs.swift.org/browse/SR-11628
  @inlinable public init(alignment: HorizontalAlignment? = nil, spacing: CGFloat? = nil, @ViewArrayBuilder content: () -> [AnyView]) {
    self.init(alignment, spacing, content())
  }

  public var body: some View {
    GeometryReader { p in
      WrapStack(
        height: p.frame(in: .global).height,
        horizontalAlignment: self.alignment,
        spacing: self.spacing,
        content: self.content
      )
      .anchorPreference(
        key: SizePref.self,
        value: .bounds,
        transform: {
          p[$0].size
        }
      )
    }
    .frame(width: width)
    .onPreferenceChange(SizePref.self, perform: {
      self.width = $0.width
    })
  }
}

#if DEBUG

struct WVStack_Previews: PreviewProvider {
  
  @ViewArrayBuilder static func single() -> [AnyView] {
    Color.purple.frame(width: 50, height: 50)
  }
  
  static var previews: some View {
    Group {

        let first: [any View] = [
            Color.red.frame(width: 150, height: 100),
            Color.green.frame(width: 50, height: 150),
            Color.yellow.frame(width: 100, height: 150),
            Color.orange.frame(width: 50, height: 50),
            Color.purple.frame(width: 30, height: 50),
            Color.blue.frame(width: 50, height: 50),
            Color.gray.frame(width: 50, height: 50),
            Color.green.frame(width: 50, height: 50),
            Color.yellow.frame(width: 100, height: 150),
            Color.orange.frame(width: 50, height: 50),
            Color.purple.frame(width: 30, height: 50),
            Color.red.frame(width: 150, height: 100),
            Color.green.frame(width: 50, height: 150),
            Color.yellow.frame(width: 100, height: 150),
            Color.orange.frame(width: 50, height: 50),
            Color.purple.frame(width: 30, height: 50),
            Color.blue.frame(width: 50, height: 50),
            Color.gray.frame(width: 50, height: 50),
            Color.green.frame(width: 50, height: 50),
            Color.blue.frame(width: 50, height: 50),
            Color.gray.frame(width: 50, height: 50),
            Color.green.frame(width: 50, height: 50),
        ]
        WVStack(alignment: .center, spacing: 10, content: { first.map { AnyView($0) } })
      .border(Color.black, width: 1)

      ScrollView {
        VStack {

          Group {
            Text("Header")
            Spacer()
          }
          Group {
            WVStack { () -> [AnyView] in }

            // FIXME: https://bugs.swift.org/browse/SR-11628
            WVStack {
              Color.red
            }
          }
          Group {
            
            // FIXME: https://bugs.swift.org/browse/SR-11628
            WVStack(content: single)
            
            WVStack {
              Color.red
              Color.gray.frame(width: 80, height: 50)
            }
            
            WVStack {
              Color.red
              Color.gray.frame(width: 80, height: 50)
              Color.green.frame(width: 150, height: 30)
            }
            
            WVStack {
              Color.red
              Color.gray.frame(width: 80, height: 50)
              Color.green.frame(width: 150, height: 30)
              Color.yellow.frame(width: 150, height: 70)
            }
            
            WVStack {
              Color.red
              Color.gray.frame(width: 80, height: 50)
              Color.green.frame(width: 150, height: 30)
              Color.yellow.frame(width: 150, height: 70)
              Color.orange.frame(width: 50, height: 50)
            }
            
            WVStack {
              Color.red
              Color.gray.frame(width: 80, height: 50)
              Color.green.frame(width: 150, height: 30)
              Color.yellow.frame(width: 150, height: 70)
              Color.orange.frame(width: 50, height: 50)
              Color.purple.frame(width: 50, height: 50)
            }
            
            WVStack {
              Color.red
              Color.gray.frame(width: 80, height: 50)
              Color.green.frame(width: 150, height: 30)
              Color.yellow.frame(width: 150, height: 70)
              Color.orange.frame(width: 50, height: 50)
              Color.purple.frame(width: 50, height: 50)
              Color.blue.frame(width: 50, height: 50)
            }
            
            WVStack {
              Color.red
              Color.gray.frame(width: 80, height: 50)
              Color.green.frame(width: 150, height: 30)
              Color.yellow.frame(width: 150, height: 70)
              Color.orange.frame(width: 50, height: 50)
              Color.purple.frame(width: 50, height: 50)
              Color.blue.frame(width: 50, height: 50)
              Color.black.frame(width: 50, height: 50)
            }
            
            WVStack {
              Color.red
              Color.gray.frame(width: 80, height: 50)
              Color.green.frame(width: 150, height: 30)
              Color.yellow.frame(width: 150, height: 70)
              Color.orange.frame(width: 50, height: 50)
              Color.purple.frame(width: 50, height: 50)
              Color.blue.frame(width: 50, height: 50)
              Color.black.frame(width: 50, height: 50)
              Color.pink.frame(width: 50, height: 50)
            }
            
            WVStack {
              Color.red
              Color.gray.frame(width: 80, height: 50)
              Color.green.frame(width: 150, height: 30)
              Color.yellow.frame(width: 150, height: 70)
              Color.orange.frame(width: 50, height: 50)
              Color.purple.frame(width: 50, height: 50)
              Color.blue.frame(width: 50, height: 50)
              Color.black.frame(width: 50, height: 50)
              Color.pink.frame(width: 50, height: 50)
              Color.white.frame(width: 50, height: 50)
            }
          }
          
          
          Group {
            WVStack(alignment: .trailing, spacing: 10) {[
              Color.red.frame(width: 100, height: 50),
              Color.gray.frame(width: 80, height: 50),
              Color.green.frame(width: 150, height: 30),
              Color.yellow.frame(width: 150, height: 70),
              Color.orange.frame(width: 50, height: 50),
              Color.purple.frame(width: 50, height: 50),
              Color.blue.frame(width: 50, height: 50),
              Color.black.frame(width: 50, height: 50),
              Color.pink.frame(width: 50, height: 50),
              Color.white.frame(width: 50, height: 50),
              ]}
              .frame(width: 350)
              .border(Color.black, width: 1)
          }
          Group {
            Spacer()
            Text("Footer")
          }
        }
      }

    }
  }
}

#endif
