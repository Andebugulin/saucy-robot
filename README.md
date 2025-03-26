# saucy-robot
```
# Clone your repository
git clone https://github.com/Andebugulin/saucy-robot.git
cd saucy-robot

# Set up Python
python3 -m venv venv
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt
pip install robotframework robotframework-seleniumlibrary

# Create build directory
mkdir -p build
cp -r ./* ./build/

# Start local server
python3 -m http.server 8000 --directory build &
SERVER_PID=$!

# Run Robot tests
export URL=http://localhost:8000
robot tests/

# Stop server
kill $SERVER_PID
```
