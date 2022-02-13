/**
* Draws a random colored circled patterns,created with a circle that expands and retract.
**/

var isGrowing = true
var maxCircleSize = 500
var minCircleSize = 60
var currentCircleSize = minCircleSize

var colorStepper = 0
var currentColorIndex = 0
var colorTimerDelta = 10

var incrementFactor = 10
var warmColorList = ["#f72585","#b5179e","#7209b7","#560bad","#480ca8"]
var coldColorList = ["#3a0ca3","#3f37c9","#4361ee","#4895ef","#4cc9f0"]

function setup() {
  createCanvas(710, 400);
  background(250)
}

function draw() {
  colorTimer();
  handleGrowth();
  circle(width/2, height/2, currentCircleSize);
}

function handleGrowth() {
  if(isGrowing) {
    expand()
    fill(warmColorList[currentColorIndex])
  } else {
    retract()
    fill(coldColorList[currentColorIndex])

  }
}

function expand() { 
   var nextSize = currentCircleSize + incrementFactor
      if(nextSize > maxCircleSize) {
        isGrowing = false
      } else {
        currentCircleSize = nextSize
      }
}

function retract() {
     var nextSize = currentCircleSize - incrementFactor
      if(nextSize < minCircleSize) {
        isGrowing = true
      } else {
        currentCircleSize = nextSize
      }
}


function colorTimer() {
  if(colorStepper + 1 <= colorTimerDelta) {
    colorStepper = colorStepper + 1
  } else {
    colorStepper = 0
    if(currentColorIndex + 1 < warmColorList.length) {
      currentColorIndex = currentColorIndex + 1  
    } else {
      currentColorIndex = 0
    }
  }
}
