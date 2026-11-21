# Appended to posix.sh at build time (devenv/build.rs) to produce hook-bash.sh.

# Register hook
if [[ ${BLE_VERSION-} ]] && (( _ble_version >= 400 )); then
    function devenv/hook_pre_cmd {
        blehook PRECMD!="_devenv_hook"
    }
    blehook ATTACH!="devenv/hook_pre_cmd"
elif [[ -z "${PROMPT_COMMAND:-}" ]]; then
    PROMPT_COMMAND="_devenv_hook"
else
    PROMPT_COMMAND="_devenv_hook;${PROMPT_COMMAND}"
fi
