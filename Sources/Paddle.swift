import RaylibC

public class Paddle {
  public var x: Float
  public var y: Float
  public var width: Float
  public var height: Float
  public var speed: Int

  init(x: Float, y: Float, width: Float, height: Float, speed: Int) {
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.speed = speed
  }

  init() {
    self.x = 0.0
    self.y = 0.0
    self.width = 0.0
    self.height = 0.0
    self.speed = 0
  }

  public func limitMovement() {
    if self.y <= 0.0 {
      self.y = 0.0
    }

    if self.y + self.height >= Float(GetScreenHeight()) {
      self.y = Float(GetScreenHeight()) - self.height
    }
  }

  public func draw() {
    DrawRectangleRounded(
      Rectangle(x: self.x, y: self.y, width: self.width, height: self.height), 0.8, 0, .white)
  }

  public func update() {
    if IsKeyDown(Int32(KEY_UP.rawValue)) {
      self.y -= Float(self.speed)
    }

    if IsKeyDown(Int32(KEY_DOWN.rawValue)) {
      self.y += Float(self.speed)
    }

    self.limitMovement()
  }
}

public class CpuPaddle: Paddle {
  public func update(ballY: Float) {
    if self.y + self.height / 2.0 > ballY {
      self.y -= Float(self.speed)
    }

    if self.y + self.height / 2.0 <= ballY {
      self.y += Float(self.speed)
    }

    self.limitMovement()
  }
}
