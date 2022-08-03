//
//  Obserable.swift
//  SadaPayTest
//
//  Created by Asfand Hafeez on 03/08/2022.
//

final class Observale<T> {
  //1
  typealias Listener = (T) -> Void
  var listener: Listener?
  //2
  var value: T {
    didSet {
      listener?(value)
    }
  }
  //3
  init(_ value: T) {
    self.value = value
  }
  //4
  func bind(listener: Listener?) {
    self.listener = listener
    listener?(value)
  }
}

