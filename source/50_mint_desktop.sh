# Mint only stuff. Abort if not LinuxMint.
is_mint || return 1

export BROWSER=chromium-browser
alias manh='man -H'

function steam() {
  if [[ -e ~/.steam ]]; then
    command steam "$@"
  else
    LD_PRELOAD='/usr/$LIB/libstdc++.so.6 /usr/$LIB/libgcc_s.so.1 /usr/$LIB/libxcb.so.1 /usr/$LIB/libgpg-error.so' command steam
  fi
}
