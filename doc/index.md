**WrapStack** documentation

# WHStack

## Initializers

With function builder  (up to 10 elements):

```swift
init(alignment: VerticalAlignment? = nil, spacing: CGFloat? = nil, @ViewArrayBuilder content: () -> [AnyView])
```

Example

```swift
WVStack {
  Text("Wrapping…").fixedSize()
  Color.red.frame(height: 200)
  // …
}
```

With array:

```swift
init<Content: View>(alignment: VerticalAlignment? = nil, spacing: CGFloat? = nil, content: () -> [Content])
```

Example

```swift
WVStack {
  [
    Text("Wrapping…").fixedSize(),
    Color.red.frame(height: 200),
    // …
  ]
  .map(AnyView.init) // Allows for mixed content
}
```

Default alignment is `.center`.
Default spacing is `0`.

# VHStack

Initializers mirror the ones for `WHStack` but take `HorizontalAlignment` instead.
