KEYPATH=".sekrets"
KEYNAME="deploy-aws"
chmod 755 $KEYPATH/kubernetes.pem 
openssl genrsa -out "$KEYPATH/kubernetes.pem" 4096
openssl rsa -in "$KEYPATH/kubernetes.pem" -pubout > "$KEYPATH/kubernetes.pub"
chmod 400 "$KEYPATH/kubernetes.pem"
aws ec2 import-key-pair \
  --key-name $KEYNAME \
  --public-key-material \
        "$(grep -v PUBLIC $KEYPATH/kubernetes.pub | 
           tr -d '\n')"
mv $HOME/.ssh/$KEYNAME.pem $HOME/.ssh/$KEYNAME.pem_bk
mv $HOME/.ssh/$KEYNAME.pub $HOME/.ssh/$KEYNAME.pub_bk
cp $KEYPATH/kubernetes.pem $HOME/.ssh/$KEYNAME.pem
cp $KEYPATH/kubernetes.pub $HOME/.ssh/$KEYNAME.pub
KEYNAME="deploy-aws"
