# Game plan

```
Game plan

MAIN_LOOP:
# render game
# check for user inputs
# check if th ball is colliding with the walls or the paddle
# update the walls
# update the ball position
# update the paddle position
# update the score
# update the screen
# check if the game is over
# if not, go to MAIN_LOOP



# development steps

```

# Order of operations

1. Setup: Install nasm, gcc, and make a make file
2. Figure out how you want to display your game: Text based, graphical user interface- VGA text mode or a simple graphics mode like Mode 13h (320x200 with 256 colors).
3. Print frame
4. Print bricks
5. print paddle
6. Build the main loop where input is taken in continously
7. implement paddle movment
8. print ball
9. implement collision and ball momment
10. Write a simple memory allocated that ues interrupts
11. add scoring
12. optimize routines, decrease number of instruction, add color
13. Add sound and animation effect
14. Figur out making the game flash drive bootable

# Decisions

- o with VGA text mode
- Setup game to run in real mode at the start

  ```bash
  #Save the assembly code in a file named realmode.asm.

  #Assemble the code into a binary file using NASM:

  nasm -f bin -o realmode.bin realmode.asm
  Create a floppy disk image containing the binary file:

  dd if=/dev/zero of=floppy.img bs=1024 count=1440
  dd if=realmode.bin of=floppy.img conv=notrunc
  #Open DOSBox, and mount the floppy disk image:

  imgmount 0 floppy.img -t floppy -fs none
  #reboot DOSBox to start the bootloader:

  boot -l a

  ```

  After some playing around, I just realizd that it is impossible to fit a retor breakout game in a real mode as real mode only gives acces to 510 bytes of code. Even the grid by itself in the best case takes about half of this. So I have decided to work onthe game on protcted mode,which would mean I won't have acces to Bios intruppts and workign with Mode13h won't be easy as there is the os abtract and to help with that I am going to be using the sdl liberary instead.

  whic can be installed by `sudo apt install libsdl-dev`
