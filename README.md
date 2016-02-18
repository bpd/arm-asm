
# Download QEMU

If you're using Windows, this specific version works best:
http://qemu.weilnetz.de/w64/qemu-w64-setup-20151216.exe


# Download QEMU images

https://people.debian.org/~aurel32/qemu/armel/

* debian_wheezy_armel_standard.qcow2
* initrd.img-3.2.0-4-versatile
* vmlinuz-3.2.0-4-versatile  


# Start QEMU, redirect SSH

(If you're using windows, run in CMD as opposed to a MinGW terminal)

    qemu-system-arm -M versatilepb 
      -kernel vmlinuz-3.2.0-4-versatile 
      -initrd initrd.img-3.2.0-4-versatile 
      -hda debian_wheezy_armel_standard.qcow2 
      -append "root=/dev/sda1" 
      -redir tcp:4222::22

# SSH from the host

  $ ssh -p 4222 localhost

# Install dev tools

    $ apt-get update
    $ apt-get install gcc, git, tmux
    
