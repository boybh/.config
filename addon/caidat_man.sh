#!/bin/zsh

# Kiểm tra xem gói man-db đã cài chưa
if ! dpkg -l | grep -q man-db; then
  echo "Cài đặt gói man-db..."
  sudo apt-get install -y man-db
else
  echo "Gói man-db đã được cài đặt."
fi

# Kiểm tra xem gói manpages đã cài chưa
if ! dpkg -l | grep -q manpages; then
  echo "Cài đặt gói manpages..."
  sudo apt-get install -y manpages
else
  echo "Gói manpages đã được cài đặt."
fi

# Kiểm tra xem gói manpages-dev đã cài chưa
if ! dpkg -l | grep -q manpages-dev; then
  echo "Cài đặt gói manpages-dev..."
  sudo apt-get install -y manpages-dev
else
  echo "Gói manpages-dev đã được cài đặt."
fi

# Kiểm tra xem gói manpages-dev đã cài chưa
if ! dpkg -l | grep -q groff; then
  echo "Cài đặt gói manpages-dev..."
  sudo apt-get install -y groff
else
  echo "Gói groff đã được cài đặt."
fi
