if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  echo "Do not run in Lima, exit VM first"
  exit
fi

SSH_PORT=$(cat ~/.lima/debian/ssh.config | grep "Port" | awk '{print $2}')
USER=$(id -un)

ssh -X -p $SSH_PORT $USER@localhost /Users/squijano/Documents/HAMprimeC2/compiler/scripts/internal/assemble_x11.sh