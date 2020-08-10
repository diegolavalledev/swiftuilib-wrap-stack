import SwiftUI

struct SizePref: PreferenceKey {
  static var defaultValue: CGSize = .init(width: 0, height: 0)
  static func reduce(value: inout CGSize , nextValue: () -> CGSize) {
    value = nextValue()
  }
}
