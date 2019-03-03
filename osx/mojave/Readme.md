OSX HowTo's, Issues & Solutions

# Problems

## git 

### producing "xcrun" invalid active developer path errors.
* Solution: "xcode-select --install"


# OSX HowTo's

## Check OS version
~~~~
$ system_profiler SPSoftwareDataType
Software:

    System Software Overview:

      System Version: macOS 10.14.3 (18D109)
      Kernel Version: Darwin 18.2.0
      Boot Volume: Macintosh HD
      Boot Mode: Normal
      Computer Name: Ahbaid’s MacBook Air
      User Name: Ahbaid Gaffoor (ahbaidg)
      Secure Virtual Memory: Enabled
      System Integrity Protection: Enabled
      Time since boot: 6 days 12:40
~~~~

## Hidden users:

### Show hidden users
~~~~
sudo dscl . create /Users/bandit IsHidden 1
~~~~

### Hiding a user
~~~~
sudo dscl . create /Users/bandit IsHidden 1

# Move the home directory to a non-standard Finder lcoation
sudo mv /Users/bandit /var/bandit
# Update the user record info
sudo dscl . create /Users/bandit NFSHomeDirectory /var/bandit
~~~~

### Unhiding a user
~~~~
sudo dscl . create /Users/bandit IsHidden 0
~~~~
