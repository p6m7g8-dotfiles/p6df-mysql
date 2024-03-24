# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::mysql::cli::start()
#
#>
######################################################################
p6df::modules::mysql::cli::start() {

  brew services start percona-server
}
