//
//  Component.swift
//  components-swift
//
//  Created by Oliver Rickard on 10/9/17.
//  Copyright © 2017 Oliver Rickard. All rights reserved.
//

import UIKit

public protocol Component: class {
  init()
  
  /** Core methods */
  func render() -> [Component]
  func mount(parentView: UIView, layout: Layout, position: CGPoint) -> MountContext
  func unmount(layout: Layout)
  func layout(constraint: CGSize, tree: ComponentTree) -> Layout
  
  func shouldComponentUpdate(previous: Component) -> Bool
  
  /** Lifecycle methods */
  
  /** Finalize: finished layout, and is now available for rendering */
  func componentDidFinalize(layout: Layout)
  
  /** Mount: attaching to a view */
  func componentWillMount()
  func componentDidMount()

  /** Unmount: detaching from a view */
  func componentWillUnmount()
  
  /** Used to identify the component so it can be associated with its prior state. */
  func key() -> AnyHashable?
}

extension Component {
  public func render() -> [Component] {
    return []
  }
  
  public func mount(parentView: UIView, layout: Layout, position: CGPoint) -> MountContext {
    return MountContext(view: parentView,
                        position: position,
                        shouldMountChildren:true)
  }
  
  public func unmount(layout: Layout) {}
  
  public func shouldComponentUpdate(previous: Component) -> Bool { return true }
  
  public func componentDidFinalize(layout: Layout) {}
  
  public func componentWillMount() {}
  public func componentDidMount() {}
  
  public func componentWillUnmount() {}
  
  public func key() -> AnyHashable? {
    return nil
  }
}