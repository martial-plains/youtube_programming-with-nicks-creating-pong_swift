import RaylibC

struct Ball {
  public var x: Float
  public var y: Float
  public var speedX: Int
  public var speedY: Int
  public var radius: Float

  init() {
    self.x = 0.0
    self.y = 0.0
    self.speedX = 0
    self.speedY = 0
    self.radius = 0.0
  }

  public func draw() {
    DrawCircle(Int32(x), Int32(y), Float(radius), yellow)
  }

  public mutating func update() {
    self.x += Float(self.speedX)
    self.y += Float(self.speedY)

    if self.y + self.radius >= Float(GetScreenHeight()) || self.y - self.radius <= 0 {
      self.speedY *= -1
    }

    // Cpu Wins
    if self.x + self.radius >= Float(GetScreenWidth()) {
      cpuScore += 1
      self.resetBall()
    }

    if self.x - self.radius <= 0.0 {
      playerScore += 1
      self.resetBall()
    }
  }

  public mutating func resetBall() {
    self.x = Float(GetScreenWidth() / 2)
    self.y = Float(GetScreenHeight() / 2)

    let speedChoices = [-1, 1]
    self.speedX *= speedChoices[Int(GetRandomValue(0, 1))]
    self.speedY *= speedChoices[Int(GetRandomValue(0, 1))]
  }
}
