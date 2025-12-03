#!/bin/zsh

# Dig aliases
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

# Minikube commands
alias mk="minikube"
alias mkstart="minikube start --cpus 4 --memory 6096 --vm-driver=hyperkit"
alias mkstop="minikube delete --all --purge"

# Terraform aliases
alias t="terraform"

# Create a folder and move into it in one command
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Docker Functions
function dshell() { docker exec -it "$@" /bin/sh }
function dbash() { docker exec -it "$@" /bin/bash }
function dlist() { docker "$@" ls }
function dfollow() { docker logs "$@" -f }
function dremove() { docker "$@" prune }
function dpurge() { docker image rm "$@" }

# Kubernetes functions
function kfollow() { kubectl logs -f "$@" --namespace "${KUBE_NAMESPACE:-default}" }
function klist() { kubectl get pods --namespace "${KUBE_NAMESPACE:-default}" }

# Kubectl Commands
alias k="kubectl"
alias kl="klist"
alias kf="kfollow"

# Git aliases
alias g="git"
alias gi="g init"
alias ga="g add ."
alias gc="g commit -m $1"

# Docker aliases
alias d="docker"
alias dsh="dshell"
alias dbh="dbash"
alias dl="dlist"
alias df="dfollow"
alias dp="d ps"
alias dr="dremove"
alias dd="dpurge"

# General aliases
alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias ls='ls -Ghrlt'
alias gs="getsecret"

# Azure Aliases
alias renew="getPat"

# Go Functions
function golist() {
  # Get the Command
  cmd="$@"

  case $cmd in
  "local")
    ls $GOPATH/src/github.com/sah27513
    ;;
  "packages")
    ls $GOPATH/src/github.com
    ;;
  *)
    ls $GOPATH/$cmd
    ;;
  esac
}

# Azure Environment (Armada)
function getPat() {
  # Get the PAT from Azure key vault
  export DEVOPS_PAT=$(gcloud secrets versions access latest --secret="bitbucket-pat")
  print "Successfully renewed DEVOPS PAT for techless"

  # Set the GOPRIVATE Path
  export GOPRIVATE="dev.azure.com"

  # Set the git configuration to use the PAT for Azure repos
  git config --global url."ssh://git@bitbucket.org:".insteadOf "https://bitbucket.org/"
  git config --global url."ssh://git@bitbucket.org:".insteadOf "https://api.bitbucket.org/2.0/repositories/"
}

function kconfig() {
  # Get the Command
  cmd="$@"

  case $cmd in
  "docker")
    kubectl config use-context docker-desktop
    ;;
  "mk")
    kubectl config use-context minikube.internal
    ;;
  "techless")
    kubectl config use-context gke_techless-260618_us-central1-c_techless-cluster
    ;;
  *)
    kubectl config use-context $1
    ;;
  esac
}

function getsecret() {
  # Get the Command
  cmd="$@"

  if [ -z $cmd ];then
    echo "ERROR: must provide a valid secret"
  else
    gcloud secrets versions access latest --secret=$cmd > credentials.json
  fi
}
