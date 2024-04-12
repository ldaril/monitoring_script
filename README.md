# Monitoring

Some monitoring tools: htop, bashtop, ...

## Learning objective
+ Write a monitoring script 
+ Bash / Python scripting 
+ Monitoring system resources

## Requirements

[Instructions for the project](https://github.com/becodeorg/BXL-k4MK4r-2/blob/main/content/02-Linux/09-Projects/03-El_Doctor.md)

There exist a plethora of amazing monitoring tools out there, some of which go as far as offering a full blown graphical dashboard collecting metrics on your entire system in a single unified interface, isn't it great?! Well, this challenge will have you throw all those pre-made solution out the window to create your own monitoring script!

You will have multiple days to make it as useful (collect the data you want or need) and fancy (interactive interface, features, ...) as possible, the goal is for you to be creative and make it your own! As such, we won't give you clear instructions to follow nor specific features to implement. Still, we are no monster so here are some idea to inspire you:

Make an interactive curses interface (or similar) for your script.
Deploy your script on a machine you manage and use something like cron to execute once an hour.
Collect metrics every hour and store them in an CSV file.
If the state of the machine is critical (not enough ram, ...), notify yourself by mail.
Send yourself a system report once a week.

In order to validate this challenge, you must have a repository containing your script and its documentation along with your script.

+ [ ] Make an interactive curses interface (or similar) for your script.
+ [ ] Execute script once an hour
+ [ ] Store script info in an CSV file every hour
+ [ ] If the state of the machine is critical (not enough ram, ...), notify yourself by mail.
+ [ ] Send email from the CLI
+ [ ] Make a system report and send it once a week

## Which data & metrics do we want to collect ?

* General information about the script
* Title, date & hour
* General information about the system
    * OS + other info
    * System load
    * Disk usage
    * Memory usage
* Running services
* Processes
    * Number of processes
    * Memory intensive process
* Network
    * Network status
    * IP addresses
* User activity 
    * Users logged in
    * Last failed login attempts
* Available updates 

## Steps

+ Make a basic script that displays the date, this will be our basis.
+ Give it correct permissions to execute
`chmod +x <script name>`

For convenience, I will push my script via ssh to a machine where I test it.
```bash
scp <filename> <username>@<ip_address>:<location>
```

## Script explanation

#### Date 
```bash
echo "# Server monitoring report - $(date '+%d-%m-%Y %H:%M:%S')"
```

#### General info

##### Get host name
`hostname` or `uname -n`  
The name can be something like `hostname.local` so take only the first part with `hostname | cut -f 1 -d.`


## Store metrics to a CSV file
I guess I'll echo the metrics (the ones that change) to a CSV file

## Send myself an email
?? one thing at a time I guess

## Make it fancier

https://en.wikipedia.org/wiki/Curses_(programming_library)
https://github.com/metal3d/bashsimplecurses
https://bashsimplecurses.readthedocs.io/en/master/

## For sport
Write the script in python