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
HOST_IP="127.0.0.1"
GUEST_IP="10.0.2.15"
VBoxManage modifyvm "$VM_NAME" --natpf1 "guestssh,tcp,$HOST_IP,2222,$GUEST_IP,22"
VBoxManage modifyvm "$VM_NAME" --natpf1 "guestpostgres,tcp,$HOST_IP,5432,$GUEST_IP,5432"
VBoxManage modifyvm "$VM_NAME" --natpf1 "guest3000,tcp,$HOST_IP,3000,$GUEST_IP,3000"
VBoxManage modifyvm "$VM_NAME" --natpf1 "guest4200,tcp,$HOST_IP,4200,$GUEST_IP,4200"
