# Start Install
echo "[INFO]Staring Install [time: $date]"

# Update
sudo apt-get Update

# Remove don't use libraries
sudo apt-get purge wolfram-engine -y
sudo apt-get purge libreoffice* -y
sudo apt-get clean -y
sudo apt-get autoremove

# Install decpence and necessary library
echo "[INFO]Install Necessary Libraries"
