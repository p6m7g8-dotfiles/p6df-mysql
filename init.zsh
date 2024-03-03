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
#  Environment:	 XXX
#>
######################################################################
p6df::modules::mysql::external::brew() {

  brew install innotop

  brew install percona-server
  brew install percona-toolkit

  # XXX: CONFLICTS
  # brew install mysql
  # brew install mariadb

  brew install sysbench
  brew install mysqltuner
  brew install mycli
  brew install mydumper

  brew install --cask mysqlworkbench

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::mysql::home::symlink()
#
#  Environment:	 P6_DFZ_SRC_P6M7G8_DOTFILES_DIR
#>
######################################################################
p6df::modules::mysql::home::symlink() {

  p6_file_symlink "$P6_DFZ_SRC_P6M7G8_DOTFILES_DIR/p6df-db/share/mysqlrc" "$P6_DFZ_DATA_DIR/.mysqlrc"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::mysql::init()
#
#  Environment:	 MYSQL_PS1
#>
######################################################################
p6df::modules::mysql::init() {

  p6_env_export MYSQL_PS1 "\v \u@\h:\p (\d)>"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::mysql::external::services::start()
#
#>
######################################################################
p6df::modules::mysql::external::services::start() {

  brew services start percona-server
}

######################################################################
#<
#
# Function: p6df::modules::mysql::external::start()
#
#>
######################################################################
p6df::modules::mysql::external::start() {

  mysql.server start
}
