#!bin/bash
git clone https://github.com/vgeruso/cpn.git .cpn/

cd .cpn

sudo chmod 755 cpn.sh
sudo chmod 733 uninstall.sh

sudo cp cpn.sh /usr/bin
cd /usr/bin
sudo mv cpn.sh cpn

cd ~/

echo "Installation successfully!"
echo "Now try:"
echo ""
echo "cpn [you-projec-name]"
echo ""
echo "To uninstall run uninstall.sh in the ~/.cpn/ directory"

rm install.sh
