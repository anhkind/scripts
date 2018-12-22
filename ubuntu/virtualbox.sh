VM_NAME="Ubuntu"
SHARE_NAME="sf_dev"
VBoxManage setextradata "$VM_NAME" VBoxInternal2/SharedFoldersEnableSymlinksCreate/$SHARE_NAME 1
