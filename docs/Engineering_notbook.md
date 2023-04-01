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
3. Build the main loop where input is taken in continously and use rinput is print
4. Build the game board
5. build paddle
6. build paddle controle with keyboard
7. add ball
8. add ball moment
9. add ball bounciness
10. add scoring
11. optimize routines, decrease number of instruction
12. Add sound and animation effect
13. Figur out making the game flash drive bootable

# Decisions

- Go with VGA text mode
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
