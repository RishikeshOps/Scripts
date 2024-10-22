# Kubernetes aliases for bash/zsh
```bash
# Basic kubectl shortcuts
alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl describe'
alias kdel='kubectl delete'
alias ka='kubectl apply -f'

# Pod management
alias kgp='kubectl get pods'
alias kgpa='kubectl get pods --all-namespaces'
alias kgpw='kubectl get pods -o wide'
alias kdp='kubectl describe pod'
alias kdelp='kubectl delete pod'
alias kgpn='kubectl get pods -n'  # Usage: kgpn namespace-name

# Service management
alias kgs='kubectl get services'
alias kgsa='kubectl get services --all-namespaces'
alias kds='kubectl describe service'
alias kdels='kubectl delete service'

# Node management
alias kgn='kubectl get nodes'
alias kgnw='kubectl get nodes -o wide'
alias kdn='kubectl describe node'

# Deployment management
alias kgd='kubectl get deployments'
alias kgda='kubectl get deployments --all-namespaces'
alias kdd='kubectl describe deployment'
alias kdeld='kubectl delete deployment'

# Namespace management
alias kgns='kubectl get namespaces'
alias kcn='kubectl config set-context --current --namespace'  # Usage: kcn namespace-name

# Logs
alias kl='kubectl logs'
alias klf='kubectl logs -f'  # Follow logs
alias klt='kubectl logs --tail'  # Usage: klt 100 pod-name

# Context and config
alias kgc='kubectl config get-contexts'
alias ksc='kubectl config use-context'  # Usage: ksc context-name
alias kcc='kubectl config current-context'

# Events
alias kge='kubectl get events --sort-by=".lastTimestamp"'

# Additional useful shortcuts
alias kaf='kubectl apply -f'  # Usage: kaf filename.yaml
alias kdf='kubectl delete -f'  # Usage: kdf filename.yaml
alias kex='kubectl exec -it'   # Usage: kex pod-name -- /bin/bash

# Resource monitoring
alias ktop='kubectl top'
alias ktoppod='kubectl top pod'
alias ktopnode='kubectl top node'

# Auto-completion for kubectl (if not enabled)
if command -v kubectl &> /dev/null; then
  source <(kubectl completion bash) # or zsh
fi

# To use these aliases:
# 1. Copy this content to your ~/.bashrc or ~/.zshrc file
# 2. Run: source ~/.bashrc (or source ~/.zshrc)

```
