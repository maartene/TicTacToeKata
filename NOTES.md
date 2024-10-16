# Notes

## Pomodoro 1

### Goals:

- Have a project scaffold setup ✅
- That can build and run a ®example single unit test pass to demonstrate that the project setup is working. (i.e. the unit test does not demonstrate any domain logic) ✅
- Demonstrate mockup version of UI ✅ (my main concern was how to make a grid for the play area in SwiftUI. Although it doesnt look like much yet, I feel confident that I now have a setup that I can improve on).

### (Possible) goals for next pom:

- Create a model that when its state changes, displays the changes in the UI

## Pomodoro 2

### Goals:
- Have a valid board definition (size, placing and retrieving cells) 🔴
- Have changes of board state reflected in the UI 🔴

### (Possible) goals for next pom:
- you cannot place on an occupied cell
- Have changes of board state reflected in the UI

## Pomodoro 3

### Goals:
- you cannot place on an occupied cell ✅
- Have changes of board state reflected in the UI ✅

### Notes:
- To integrate with SwiftUI (Apples declerative and reactive UI framework, currently the default), requires some boilerplate code. In particular, it requires 'cells' to not be a lazy variable, meaning that if we want to prevent magic numbers, we need to define the boards width and height in static members. 

### (Possible) goals for next pom:
- Determine active player (and show in UI)
- Determine legal moves
- Implement an 'AI' that makes legal moves.

## Pomodoro 4

### Goals:
- Determine active player (and show in UI)
- Determine legal moves
- Implement an 'AI' that makes legal moves.

