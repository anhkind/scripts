# make symlink work on shared folder (from: https://github.com/npm/npm/issues/992#issuecomment-174154202)
VM_NAME="Ubuntu"
SHARE_NAME="dev"
VBoxManage setextradata "$VM_NAME" VBoxInternal2/SharedFoldersEnableSymlinksCreate/$SHARE_NAME 1
# check again
VBoxManage getextradata "$VM_NAME" enumerate
