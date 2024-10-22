# Kubernetes aliases for Windows PowerShell
 Save this in your PowerShell profile file

1. To find your profile path, run:
```powershell
echo $PROFILE

# Usually it's at: %UserProfile%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
```

2. If the file doesn't exist, you can create it
```powershell
New-Item -Path $PROFILE -Type File -Force
```
3. Copy the below script into your profile file. You can open it with:
```powershell
notepad $PROFILE
```
4. After saving, reload your profile:
```powershell
. $PROFILE
```

```powershell


# Basic kubectl shortcuts
Set-Alias -Name k -Value kubectl
Function Get-KubectlGet { kubectl get $args }
Set-Alias -Name kg -Value Get-KubectlGet
Function Get-KubectlDescribe { kubectl describe $args }
Set-Alias -Name kd -Value Get-KubectlDescribe
Function Remove-KubectlDelete { kubectl delete $args }
Set-Alias -Name kdel -Value Remove-KubectlDelete

# Pod management
Function Get-KubectlPods { kubectl get pods $args }
Set-Alias -Name kgp -Value Get-KubectlPods
Function Get-KubectlPodsAllNamespaces { kubectl get pods --all-namespaces }
Set-Alias -Name kgpa -Value Get-KubectlPodsAllNamespaces
Function Get-KubectlPodsWide { kubectl get pods -o wide }
Set-Alias -Name kgpw -Value Get-KubectlPodsWide
Function Get-KubectlPodDesc { kubectl describe pod $args }
Set-Alias -Name kdp -Value Get-KubectlPodDesc

# Service management
Function Get-KubectlServices { kubectl get services $args }
Set-Alias -Name kgs -Value Get-KubectlServices
Function Get-KubectlServicesAll { kubectl get services --all-namespaces }
Set-Alias -Name kgsa -Value Get-KubectlServicesAll

# Node management
Function Get-KubectlNodes { kubectl get nodes $args }
Set-Alias -Name kgn -Value Get-KubectlNodes
Function Get-KubectlNodesWide { kubectl get nodes -o wide }
Set-Alias -Name kgnw -Value Get-KubectlNodesWide

# Deployment management
Function Get-KubectlDeployments { kubectl get deployments $args }
Set-Alias -Name kgd -Value Get-KubectlDeployments
Function Get-KubectlDeploymentsAll { kubectl get deployments --all-namespaces }
Set-Alias -Name kgda -Value Get-KubectlDeploymentsAll

# Namespace management
Function Get-KubectlNamespaces { kubectl get namespaces }
Set-Alias -Name kgns -Value Get-KubectlNamespaces
Function Set-KubectlNamespace { kubectl config set-context --current --namespace=$args }
Set-Alias -Name kcn -Value Set-KubectlNamespace

# Logs
Function Get-KubectlLogs { kubectl logs $args }
Set-Alias -Name kl -Value Get-KubectlLogs
Function Get-KubectlLogsFollow { kubectl logs -f $args }
Set-Alias -Name klf -Value Get-KubectlLogsFollow

# Context and config
Function Get-KubectlContexts { kubectl config get-contexts }
Set-Alias -Name kgc -Value Get-KubectlContexts
Function Set-KubectlContext { kubectl config use-context $args }
Set-Alias -Name ksc -Value Set-KubectlContext
Function Get-KubectlCurrentContext { kubectl config current-context }
Set-Alias -Name kcc -Value Get-KubectlCurrentContext

# Resource monitoring
Function Get-KubectlTop { kubectl top $args }
Set-Alias -Name ktop -Value Get-KubectlTop
Function Get-KubectlTopPod { kubectl top pod $args }
Set-Alias -Name ktoppod -Value Get-KubectlTopPod
Function Get-KubectlTopNode { kubectl top node $args }
Set-Alias -Name ktopnode -Value Get-KubectlTopNode

# Apply and Delete files
Function Apply-KubectlFile { kubectl apply -f $args }
Set-Alias -Name kaf -Value Apply-KubectlFile
Function Remove-KubectlFile { kubectl delete -f $args }
Set-Alias -Name kdf -Value Remove-KubectlFile

# Function to support auto-completion
function k { 
    param([string]$args)
    kubectl $args
}

# Enable auto-completion for kubectl commands
Register-ArgumentCompleter -CommandName k -ScriptBlock {
    param($commandName, $wordToComplete, $cursorPosition)
    kubectl completion pwsh | Out-String | Where-Object { $_ -like "$wordToComplete*" }
}

# Usage examples:
# kgp                     # Get all pods in current namespace
# kgp -n kube-system     # Get pods in kube-system namespace
# kl pod-name            # Get logs for a pod
# kaf deployment.yaml    # Apply a YAML file

```
