VM_NAME="Ubuntu"
SHARE_NAME="dev"
HOST_LOCAL_PATH="/Users/anhkind"
SHARED_PATH="$HOST_LOCAL_PATH/$SHARE_NAME"

# add shared folder
VBoxManage sharedfolder add $VM_NAME --name $SHARE_NAME --hostpath $SHARED_PATH --automount

# make symlink work on shared folder (from: https://github.com/npm/npm/issues/992#issuecomment-174154202)
VBoxManage setextradata "$VM_NAME" VBoxInternal2/SharedFoldersEnableSymlinksCreate/$SHARE_NAME 1
# check again
# VBoxManage getextradata "$VM_NAME" enumerate

# add port forwarding
VBoxManage modifyvm "$VM_NAME" --natpf1 "guestssh,tcp,,2222,,22"
VBoxManage modifyvm "$VM_NAME" --natpf1 "guest3000,tcp,,3000,,3000"
VBoxManage modifyvm "$VM_NAME" --natpf1 "guest4200,tcp,,4200,,4200"
