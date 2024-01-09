// The Swift Programming Language
// https://docs.swift.org/swift-book

import RaylibC

var playerScore = 0
var cpuScore = 0

var ball = Ball()
var player = Paddle()
var cpu = CpuPaddle()

print("Starting the game")

let screenWidth: Int32 = 1280
let screenHeight: Int32 = 800
let title = "My Pong Game"

InitWindow(screenWidth, screenHeight, title)
SetTargetFPS(60)

ball.radius = 20.0
ball.x = Float(screenWidth) / 2.0
ball.y = Float(screenHeight) / 2.0
ball.speedX = 7
ball.speedY = 7

player.width = 25.0
player.height = 120.0
player.x = 10.0
player.y = Float(screenHeight) / 2.0 - player.height / 2.0
player.speed = 6

cpu.height = 120.0
cpu.width = 25
cpu.x = Float(screenWidth) - cpu.width - 10.0
cpu.y = Float(screenHeight) / 2.0 - cpu.height / 2.0
cpu.speed = 6

while !WindowShouldClose() {
  BeginDrawing()

  // Updating

  ball.update()
  player.update()
  cpu.update(ballY: ball.y)

  // Checking for collisions
  if CheckCollisionCircleRec(
    Vector2(x: ball.x, y: ball.y), ball.radius,
    Rectangle(x: player.x, y: player.y, width: player.width, height: player.height))
  {
    ball.speedX *= -1
  }

  if CheckCollisionCircleRec(
    Vector2(x: ball.x, y: ball.y), ball.radius,
    Rectangle(x: cpu.x, y: cpu.y, width: cpu.width, height: cpu.height))
  {
    ball.speedX *= -1
  }

  // Drawing
  ClearBackground(darkGreen)
  DrawRectangle(screenWidth / 2, 0, screenWidth / 2, screenHeight, green)
  DrawCircle(screenWidth / 2, screenHeight / 2, 150.0, lightGreen)
  DrawLine(screenWidth / 2, 0, screenWidth / 2, screenHeight, .white)
  ball.draw()
  player.draw()
  cpu.draw()

  DrawText("\(playerScore)", 3 * screenWidth / 4 - 20, 20, 80, .white)
  DrawText("\(cpuScore)", screenWidth / 4 - 20, 20, 80, .white)
  EndDrawing()
}

CloseWindow()
