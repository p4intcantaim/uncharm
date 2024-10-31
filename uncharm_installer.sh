#!/bin/bash

# Create the script in /usr/local/bin
echo '#!/bin/bash

PYCHARM_BASE_PATH="/home/${USER}/.var/app/com.jetbrains.PyCharm-Community/config/JetBrains"
LATEST_VERSION=$(ls -1 "$PYCHARM_BASE_PATH" | grep "PyCharmCE" | sort -V | tail -n 1)
PYCHARM_CONFIG_PATH="$PYCHARM_BASE_PATH/$LATEST_VERSION"

cd "$PYCHARM_CONFIG_PATH"

if [ -f ".lock" ]; then
    rm .lock
    echo "✨ PyCharm has been uncharm-ed! Lock file removed from $LATEST_VERSION"
else
    echo "🎉 PyCharm is already free! No lock file found in $LATEST_VERSION"
fi' | sudo tee /usr/local/bin/uncharm > /dev/null

# Make it executable
sudo chmod +x /usr/local/bin/uncharm

echo "Installation complete! You can now run 'uncharm' from anywhere. Just type uncharm in a terminal to remove the .lock file"
