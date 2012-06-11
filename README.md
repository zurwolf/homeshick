homeshick
=========
<div style="float: right"><img src="http://i.imgur.com/3zAK9.jpg"></div>
homs**h**ick is a dependency-free stand-in for [homesick](https://github.com/technicalpickles/homesick)

# homeshick vs. homesick #
The goal is to mimick homesick in functionality so that it can be a drop-in replacement.

_Functionality_ does however not include:
* **reliability**. technicalpickles has created a ton of tests for his tool, I'm not going to do that.
* **gem** With _gem_ you can easily install and update homesick. That's a bit harder with a simple shell script.
* **tersity**. homesick hides a lot of git output. homeshick doesn't.

If anyone were to send a pull request fixing one/some of the above, I would be very grateful.

One advantage homshick has over homesick is the ability to install it easily without root privileges.
To install a gem, not having root privileges makes the job a lot harder (in my experience).
With homeshick you simply run the three commands listed below and you are done!

# Installation #
Get the latest version of the script
```
    curl -so ~/.homeshick https://raw.github.com/andsens/homeshick/master/homeshick
```
make the script executable and alias it in your .bashrc or .zshrc
```
    chmod +x ~/.homeshick
    printf '\nalias homesick="$HOME/.homeshick"' >> .bashrc
```

# Automatic deployment #
After having launched ec2 instances a lot, I got tired of installing zsh, tmux etc.
Check out [this gist](https://gist.github.com/2913223).

In one line you can run a script which installs your favorite shell and multiplexer.
It also installs homeshick, which then clones and symlinks your castle(s).
To clone via ssh instead of https, you will need a private key.

You may however not trust the current server with agent forwarding,
which is why the script contains variables to hold the unencrypted deploy key of your castles
(available in the admin section of your repo).
They will be added to the ssh-agent in order for git to be able to clone. Enjoy!
