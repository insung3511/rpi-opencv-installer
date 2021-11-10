
# Remove don't use libraries
echo "[INFO]Remove Don't needs"
sudo apt-get purge wolfram-engine -y
sudo apt-get purge libreoffice* -y
sudo apt-get clean -y
sudo apt-get autoremove -y
echo "[FINS]Done remove"

# Start Install
echo "[INFO]Staring Install [$(date)]"
sudo apt-get update
echo '[FINS]Done Update'


# Install decpence and necessary library
echo "[INFO]Install Necessary Libraries"

# build library
sudo apt-get install build-essential -y
sudo apt-get install cmake -y
sudo apt-get install pkg-config -y

# image library
sudo apt-get install libjpeg-dev -y
sudo apt-get install libtiff5-dev -y
sudo apt-get install libjasper-dev -y
sudo apt-get install libpng-dev -y

# video stream library
sudo apt-get install libavcodec-dev -y
sudo apt-get install libavformat-dev -y
sudo apt-get install libswscale-dev -y
sudo apt-get install libv4l-dev -y

# gtk development library
sudo apt-get install libfontconfig1-dev -y
sudo apt-get install libcario2-dev -y
sudo apt-get install libgdk-pixbuf2.0-dev -y
sudo apt-get install libpango1.0-dev -y
sudo apt-get install libgtk2.0-dev -y
sudo apt-get install libgtk-3-dev -y

# extra dependencies
sudo apt-get install libatlas-base-dev -y
sudo apt-get install gfortran -y

# qt guis, hdf5 datasets
sudo apt-get install libhd5-dev -y
sudo apt-get install libhdf5-serial-dev -y
sudo apt-get install libhd5-103 -y
sudo apt-get install libqtgui4 -y 
sudo apt-get install libqtwebkit4 -y
sudo apt-get install libqt4-test -y
sudo apt-get install python3-pyqt5 -y

# install python3-dev
sudo apt-get install python3-dev
echo '[FINS]Done Necessary libraries install.'

# get-pip.py
echo '[INFO]Making python virtual enviroment'
wget https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py
sudo rm -rf ~/.cache/pip

sudo pip install virtualenv virtualenvwrapper
echo "# virtualenv and virtualenvwrapper" >> ~/.bashrc
echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc

echo '[WARN]System updated bashrc. Please check it again.'
cat ~/.bashrc

echo '[WARN]System compile current bash to new session'
source ~/.bashrc

echo '[INFO]System will make virtual python3 develop environmet named *cv*'
mkvirtualenv cv -p python3

echo '[FINS]Done made new python virtual enviromnet'

# download opencv 4.5.3, opencv contrib
echo '[INFO]Starting download and unzip opencv files'
cd ~
wget -O opencv.zip https://github.com/opencv/opencv/archive/4.5.3.zip
wget -O opencv.zip https://github.com/opencv/opencv_contrib/archive/4.5.3.zip
unzip opencv.zip && unzip opencv_contrib.zip
mv opencv-4.5.3 opencv
mv opencv_contrib-4.5.3 opencv_contrib
echo '[FINS]Done download and unzip opencv, opencv_contrib'

echo '[INFO]Starting Make'
workon cv
pip install numpy
cd ~/opencv
mkdir build && cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
 -D CMAKE_INSTALL_PREFIX=/usr/local \
 -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
 -D ENABLE_NEON=ON \
 -D ENABLE_VFPV3=ON \
 -D BUILD_TESTS=OFF \
 -D INSTALL_PYTHON_EXAMPLES=ON \
 -D OPENCV_ENABLE_NONFREE=ON \
 -D CMAKE_SHARED_LINKER_FLAGS=-latomic \
 -D BUILD_EXAMPLES=ON ..

make -j4
sudo make install
sudo ldconfig




 
 


