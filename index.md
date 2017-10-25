# Theodolite: A Fast React Framework for Swift

Theodolite allows you to write Components just like React:

```swift
final class FooComponent: TypedComponent {
  typealias PropType = Int

  func view() -> ViewConfiguration? {
    return LabelComponent {
      ("\(self.props())", LabelComponent.Options())
    }
  }
}
```

```swift
FooComponent { 42 }
```