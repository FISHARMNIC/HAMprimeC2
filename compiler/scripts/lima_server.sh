if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  echo "Do not run in Lima, exit VM first"
  exit
fi

SSH_PORT=$(cat ~/.lima/debian/ssh.config | grep "Port" | awk '{print $2}')
LIMA_IP=$(limactl list | grep 'debian' | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}')
USER=$(id -un)

D=$(pwd)

ssh -L 8080:localhost:8080 -p $SSH_PORT $USER@$LIMA_IP -F ~/.lima/debian/ssh.config $D/assemble.sh
# ssh -L 8080:localhost:8080 -p $SSH_PORT $USER@$LIMA_IP $D/assemble.sh