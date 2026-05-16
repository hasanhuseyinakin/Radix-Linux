<p align="center"><img src="/img/newlogo.jpg" alt="radix os logo" width="200"></p>

<h1 align="center">Radix Linux 0.9.2 Alpha Version</h1>

<p align="center">Radix Linux is a lightweight Linux distribution currently in beta, designed specifically for students.
 It is built from scratch to run efficiently on low-resource hardware and offers Turkish language support. 
 This early version invites testing and feedback from its users.
 https://www.reddit.com/r/RadixLinuxCommunity/</p>

<hr>

## How to install Radix Linux on your Chroot Virtual Environment?


1. To interact with your filesystem mount points, you must first switch to the root user. We will also initialize a global variable to simplify the commands used throughout this guide.

   - **You can change to root user and create the variable with this command**:
     ```
     sudo su
     export radixlinux=/home/yourusernamehere/Radix-Linux
     ```


2. Once the variable is defined, set the umask to ensure consistent file permissions, as your host distribution may use a different default value.
   
   - **You can set umask with this command**:
     ```
     umask 022
     ```


**Note:** Since variables and umask settings are session-specific, you must redefine them whenever you open a new terminal or restart your session. To verify that they are correctly applied, run the following command:

   - **You can set check the variable and umask with this command**:
     ```
     echo $radixlinux
     umask
     ```

3. After verifying the environment variables, we need to create essential system directories and mount points required for the kernel to interact with your hardware.
- **Now create new directories with this command**:
     ```
     mkdir $radixlinux/sys
     mkdir $radixlinux/proc
     mkdir $radixlinux/run
     mkdir $radixlinux/dev
     mkdir $radixlinux/dev/pts
     mkdir $radixlinux/dev/shm
     ```


 4. After that, you need to mount your host systems kernel drivers because we dont have any yet:)
    
 - **Now mount some directories with this command**:
     ```
     mount -v -t sysfs sysfs $radixlinux/sys
     mount -v -t proc proc $radixlinux/proc
     mount -v -t tmpfs tmpfs $radixlinux/run
     mount -v --bind /dev $radixlinux/dev
     mount -v --bind /dev/pts $radixlinux/dev/pts
     mount -v -t tmpfs tmpfs $radixlinux/dev/shm
     ```
     
 5. After you finished testing, you need to unmount them so come back here later and **skip this part for now :)** 
- **You can unmount the mounted directories with this command**:
     ```
     umount -v $radixlinux/dev/shm
     umount -v $radixlinux/dev/pts
     umount -v $radixlinux/dev
     umount -v $radixlinux/run
     umount -v $radixlinux/proc
     umount -v $radixlinux/sys
     ```


Enter the Chroot Virtual Environment and test everything!


6. You have successfully reached to the end of setup phase. We will now set up a chroot environment to ensure a safe and isolated testing experience for our distribution.

NOTE:(Once you finished using, go back to the 5th part and unmount before leaving!)

- **Enter the chroot environment with these commands**:
     ```
     chroot "$radixlinux" /usr/bin/env -i   \
         HOME=/root                  \
         TERM="$TERM"                \
         PS1='(radix linux chroot) \u:\w\$ ' \
         PATH=/usr/bin:/usr/sbin     \
         MAKEFLAGS="-j$(nproc)"      \
         TESTSUITEFLAGS="-j$(nproc)" \
         /bin/bash --login

     exec /usr/bin/bash --login
     ```

  Now you are ready to boot into our os :)

## Thank you for testing our software and sharing your ideas. See you later.

