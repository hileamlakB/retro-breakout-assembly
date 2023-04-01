# Instruction

[Deprecated] - as the code for the game couldn't fit in the MBR sector
To run this program in real mode follow the instructions below

1. Install dosbox and other requirments as described in the INSTALL file
2. run the make_real_mode code to create a runnable floppy disk immage
3. open dosbox and run the following commands to load the floppy disk image

   ```
   imgmount 0 floppy.img -t floppy -fs none
   #reboot DOSBox to start the bootloader:

   boot -l a
   ```
