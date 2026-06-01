# mirror
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
cat > /etc/pacman.d/mirrorlist << 'EOF'
Server = https://mirrors.aliyun.com/archlinux/$repo/os/$arch
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch
Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch
EOF

pacman -Syu –noconfirm
pacman -S --noconfirm fuse2 \
                    libglvnd \
                    fontconfig \
                    usbutils
