#!/bin/bash

echo "🔍 패키지 업데이트 및 필수 패키지 설치..."
sudo apt update && sudo apt upgrade -y

echo "✅ Python 필수 패키지 설치..."
sudo apt install -y python3 python3-pip python3-venv

echo "✅ Chrome 및 ChromeDriver 설치..."
sudo apt install -y wget unzip curl xvfb libxi6 libgconf-2-4
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb || sudo apt install -f -y
rm google-chrome-stable_current_amd64.deb

echo "✅ ChromeDriver 다운로드 및 설치..."
CHROME_VERSION=$(google-chrome --version | grep -oP '[0-9]+(\.[0-9]+)*' | head -1)
DRIVER_VERSION=$(curl -s "https://chromedriver.storage.googleapis.com/LATEST_RELEASE_$CHROME_VERSION")
wget -N "https://chromedriver.storage.googleapis.com/$DRIVER_VERSION/chromedriver_linux64.zip"
unzip chromedriver_linux64.zip
sudo mv chromedriver /usr/bin/chromedriver
sudo chmod +x /usr/bin/chromedriver
rm chromedriver_linux64.zip

echo "✅ 필요한 Python 라이브러리 설치..."
pip3 install --upgrade pip
pip3 install selenium webdriver-manager beautifulsoup4 tqdm requests

echo "✅ 설치 완료!"
