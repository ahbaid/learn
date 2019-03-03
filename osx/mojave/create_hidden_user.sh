# Create a user with the user id in the 401-499 range
sudo dscl . -create /Users/bandit UniqueID 401 

# Set the user primary group to the admin group
sudo dscl . -create /Users/bandit PrimaryGroupID 80 


# Ensure the user home dir is in a non-standard location
sudo dscl . -create /Users/bandit NFSHomeDirectory /var/bandit 
sudo dscl . -create /Users/bandit UserShell /bin/bash 
sudo dscl . -create /Users/bandit RealName "Bandit Admin" 

# Set the user password
sudo dscl . -passwd /Users/bandit IMaBandit23

# Create the user home and give ownership
sudo mkdir -p /var/bandit
sudo chown -R bandit /var/bandit

# Add user to local admin group (if you did not use PrimaryGroupID 80)
sudo dscl . append /Groups/admin GroupMembership bandit

# Enable hidden functions
sudo defaults write /Library/Preferences/com.apple.loginwindow Hide500Users -bool YES

# Ensure "Others" option list at login window
sudo defaults write /Library/Preferences/com.apple.loginwindow SHOWOTHERUSERS_MANAGED -bool TRUE
