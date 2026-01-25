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
# Function: p6df::modules::mysql::external::brew()
#
#>
######################################################################
p6df::modules::mysql::external::brew() {

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
# Function: p6df::modules::mysql::home::symlink()
#
#  Environment:	 P6_DFZ_DATA_DIR P6_DFZ_SRC_P6M7G8_DOTFILES_DIR
#>
######################################################################
p6df::modules::mysql::home::symlink() {

  p6_file_symlink "$P6_DFZ_SRC_P6M7G8_DOTFILES_DIR/p6df-db/share/mysqlrc" "$P6_DFZ_DATA_DIR/.mysqlrc"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::mysql::init(_module, dir)
#
#  Args:
#	_module -
#	dir -
#
#  Environment:	 MYSQL_PS1
#>
######################################################################
p6df::modules::mysql::init() {
  local _module="$1"
  local dir="$2"

  p6_bootstrap "$dir"

  p6_env_export MYSQL_PS1 "\v \u@\h:\p (\d)>"

  p6_return_void
}
