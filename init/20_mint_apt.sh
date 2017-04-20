# Mint-only stuff. Abort if not LinuxMint.
is_mint || return 1

apt_keys=()
apt_source_files=()
apt_source_texts=()
apt_packages=()
deb_installed=()
deb_sources=()

# Distro release name, eg. "xenial"
release_name=$(lsb_release -c | awk '{print $2}')

#############################
# WHAT DO WE NEED TO INSTALL?
#############################

# Misc.
apt_packages+=(
  ansible
  cowsay
  curl
  git-core
  htop
  imagemagick
  nmap
  silversearcher-ag
  sl
  telnet
  tree
  vim
  python-pip
  iotop
  remmina
  remmina-plugin-rdp
  whois
  curl
  wget
  gparted
  chromium-browser
)

function other_stuff() {
  # Install Git Extras
  if [[ ! "$(type -P git-extras)" ]]; then
    e_header "Installing Git Extras"
    (
      cd $DOTFILES/vendor/git-extras &&
      sudo make install
    )
  fi
}

####################
# ACTUALLY DO THINGS
####################

# Only do a dist-upgrade on initial install, otherwise do an upgrade.
if is_dotfiles_bin; then
  sudo apt-get -qq upgrade
else
  sudo apt-get -qq dist-upgrade
fi

# Install APT packages.

if (( ${#apt_packages[@]} > 0 )); then
  e_header "Installing APT packages (${#apt_packages[@]})"
  pip install --upgrade pip
  for package in "${apt_packages[@]}"; do
    e_arrow "$package"
    [[ "$(type -t preinstall_$package)" == function ]] && preinstall_$package
    sudo apt-get -qq install "$package" && \
    [[ "$(type -t postinstall_$package)" == function ]] && postinstall_$package
  done
fi

# Run anything else that may need to be run.
type -t other_stuff >/dev/null && other_stuff
