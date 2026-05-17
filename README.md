<p align="center"><img src="/img/newlogo.jpg" alt="radix os logo" width="200"></p>

<h1 align="center">Radix Linux 1.0 Beta Version</h1>

<p align="center">Radix Linux is a lightweight Linux distribution currently in beta, designed specifically for students.
 It is built from scratch to run efficiently on low-resource hardware and offers Turkish language support. 
 This early version invites testing and feedback from its users.
 
 **Our Community Page:** https://www.reddit.com/r/RadixLinuxCommunity/
 
 **Download Latest Version:** https://github.com/VFL-DEEP/Radix-Linux/releases </p>

<hr>

## Important: Quick Start & How To Use Radix Linux Distrubition:


### For Users: 
If you are looking for a bootable ISO or a ready-to-run distribution, please navigate to the Releases section. There you can find pre-built images and latest stable versions.

### For Developers:
This repository itself is a Source Archive & Base System. It is designed to be a transparent foundation for other distributions and to simplify release tracking. If you want to customize Radix or build it from scratch, follow the **Build Pipeline** below.


## Build Pipeline Overview

The build system is executed in a strict order to ensure a clean and fully functional Linux base system. Each script is responsible for a specific layer of the operating system, starting from the toolchain and ending with user-level utilities and development environments. The correct execution order is essential for a successful build.



### Cloning the Repository
To get started with the latest version, use the git clone command:

```
git clone --depth 1 https://github.com/VFL-DEEP/Radix-Linux.git
```


### 1. Toolchain Setup

The toolchain stage initializes the compiler environment, assembler, linker, and core build utilities required to compile the rest of the system from source. This is the foundation of the entire distribution and must be completed before any other package is built.

   - **You can setup the toolchain with this command**:
     ```
     ./toolchain.sh
     ```


### 2. Temporary Tools Setup

This stage installs and prepares temporary bootstrap utilities required during the early build phases, ensuring that the system has minimal operational tools before full system libraries are available.
   
   - **You can setup temporary-tools with this command**:
     ```
     ./temp-tools.sh
     ```


### 3. Extended Temporary Tools

This step expands the bootstrap environment by adding additional helper utilities that support compilation, patching, and intermediate build operations required by later stages.

   - **You can setup extended temporary tools with this command**:
     ```
     ./temp-tools-extra.sh
     ```


 ### 4. Basic System Softwares

This stage builds and installs essential base system software such as core utilities, shell tools, and fundamental system binaries required for a functional Linux environment.
    
 - **You can setup basic system softwares with this command**:
     ```
     ./basic-software.sh
     ```

     
 ### 5. Kernel Build

This step compiles and installs the Linux kernel, which provides hardware interaction, process management, and core system functionality required for system boot and runtime operations.
 
- **You can setup linux kernel with this command**:
     ```
     ./kernel-build.sh
     ```


### 6. Bootloader Installation

This stage installs and configures the bootloader responsible for system startup, allowing the kernel to be loaded and the operating system to initialize correctly.

- **You can setup bootloader with this command**:
     ```
     ./bootloader.sh
     ```


### 7. Security Layer

This stage applies system-level security configurations, permissions hardening, and baseline security policies to ensure a stable and controlled environment.

- **You can setup security layer with this command**:
     ```
     ./security.sh
     ```



### 8. General Libraries

This step installs core system libraries required by both system components and user applications, ensuring compatibility and runtime support.

- **You can setup general libraries with this command**:
     ```
     ./general-libraries.sh
     ```


### 9. Networking Libraries

This stage installs networking-related libraries and components required for connectivity, communication protocols, and internet functionality.

- **You can setup networking libraries with this command**:
     ```
     ./network-libraries.sh
     ```

     
### 10. Text Editors

This step installs command-line and basic text editing tools required for system configuration and development tasks.

- **You can setup text editors with this command**:
     ```
     ./text-editors.sh
     ```

  
### 11. Programming Tools

This stage installs development tools, compilers, interpreters, and debugging utilities required for software development on the system.

- **You can setup programming tools with this command**:
     ```
     ./programming-tools.sh
     ```

     
### 12. Graphics Libraries

This step installs graphical subsystem libraries required for rendering, display management, and GUI-based applications.

- **You can setup graphics libraries with this command**:
     ```
     ./graphic-libraries.sh
     ```


### 13. File Management Tools

This final stage installs file management utilities that provide user-level file operations, system navigation, and data handling capabilities.

- **You can setup file management tools with this command**:
     ```
     ./file-management.sh
     ```     



## Thank you for testing our software and sharing your ideas. See you later.

