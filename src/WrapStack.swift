import SwiftUI

struct WrapStack<Content: View>: View {

  var width: CGFloat!
  var height: CGFloat!
  var verticalAlignment: VerticalAlignment!
  var horizontalAlignment: HorizontalAlignment!
  var spacing: CGFloat
  
  var content: [Content]
  
  var directionHorizontal: Bool {
    width != nil
  }
  var length: CGFloat {
    directionHorizontal ? width : height
  }

  var metrics: (Int, [Int]) {
    let (lanes, limits, _, _) =
      content.reduce((0, [], 0, length)) {
        (accum, item) -> (Int, [Int], Int, CGFloat) in
        var (lanesSoFar, limits, index, laneLength) = accum
        let itemSize = UIHostingController(rootView: item).view.intrinsicContentSize
        let itemLength = directionHorizontal ? itemSize.width : itemSize.height
        if laneLength + itemLength > self.length {
          lanesSoFar += 1
          laneLength = itemLength
          limits.append(index)
        } else {
          laneLength += itemLength + self.spacing
        }
        index += 1
        return (lanesSoFar, limits, index, laneLength)
    }
    return (lanes, limits)
  }
  
  var totalLanes: Int {
    let (lanes, _) = metrics
    return lanes
  }
  
  var limits: [Int] {
    let (_, limits) = metrics
    return limits
  }
  
  func lowerLimit(_ index: Int) -> Int {
    limits[index]
  }

  func upperLimit(_ index: Int) -> Int {
    if index == totalLanes - 1 {
      return content.count
    }
    return limits[index + 1]
  }

  func makeRow(_ i: Int) -> some View {
    HStack(alignment: verticalAlignment, spacing: spacing) {
      ForEach(self.lowerLimit(i) ..< self.upperLimit(i), id: \.self) {
        self.content[$0]
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    //.clipped()
  }

  func makeColumn(_ i: Int) -> some View {
    VStack(alignment: horizontalAlignment, spacing: spacing) {
      ForEach(self.lowerLimit(i) ..< self.upperLimit(i), id: \.self) {
        self.content[$0]
      }
    }
    .frame(maxHeight: .infinity, alignment: .top)
    //.clipped()
  }

  var lanes: some View {
    ForEach(0 ..< totalLanes, id: \.self) { i in
      Group {
        if self.directionHorizontal {
          self.makeRow(i)
        } else {
          self.makeColumn(i)
        }
      }
    }
  }

  var body: some View {
    Group {
      if directionHorizontal {
        VStack {
          lanes
        }
      } else {
        HStack {
          lanes
        }
      }
    }
  }
}
