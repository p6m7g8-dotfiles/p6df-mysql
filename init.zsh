# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::mysql::deps()
#
#>
######################################################################
p6df::modules::mysql::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6common
  )
}

######################################################################
#<
#
# Function: p6df::modules::mysql::env::init()
#
#  Environment:	 MYSQL_PS1
#>
######################################################################
p6df::modules::mysql::env::init() {

  local _module="$1"
  local _dir="$2"
  p6_env_export MYSQL_PS1 "\v \u@\h:\p (\d)>"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::mysql::home::symlinks()
#
#  Environment:	 P6_DFZ_DATA_DIR P6_DFZ_SRC_P6M7G8_DOTFILES_DIR
#>
######################################################################
p6df::modules::mysql::home::symlinks() {

  p6_file_symlink "$P6_DFZ_SRC_P6M7G8_DOTFILES_DIR/p6df-db/share/mysqlrc" "$P6_DFZ_DATA_DIR/.mysqlrc"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::mysql::external::brews()
#
#>
######################################################################
p6df::modules::mysql::external::brews() {

  p6df::core::homebrew::cli::brew::install innotop

  p6df::core::homebrew::cli::brew::install percona-server
  p6df::core::homebrew::cli::brew::install percona-toolkit

  # XXX: CONFLICTS
  # p6df::core::homebrew::cli::brew::install mysql
  # p6df::core::homebrew::cli::brew::install mariadb

  p6df::core::homebrew::cli::brew::install sysbench
  p6df::core::homebrew::cli::brew::install mysqltuner
  p6df::core::homebrew::cli::brew::install mycli
  p6df::core::homebrew::cli::brew::install mydumper

  p6df::core::homebrew::cli::brew::install --cask mysqlworkbench

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::mysql::mcp()
#
#>
######################################################################
p6df::modules::mysql::mcp() {

  p6_js_npm_global_install "mysql-mcp-server"

  p6df::modules::anthropic::mcp::server::add "mysql" "npx" "-y" "mysql-mcp-server"
  p6df::modules::openai::mcp::server::add "mysql" "npx" "-y" "mysql-mcp-server"

  p6_return_void
}

######################################################################
#<
#
# Function: words mysql $MYSQL_HOST = p6df::modules::mysql::profile::mod()
#
#  Returns:
#	words - mysql $MYSQL_HOST
#
#  Environment:	 MYSQL_HOST
#>
######################################################################
p6df::modules::mysql::profile::mod() {

  p6_return_words 'mysql' '$MYSQL_HOST' '$MYSQL_HOME'
}

