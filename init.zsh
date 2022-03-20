
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

  brew install innotop
 
  brew install percona-server
  brew install percona-toolkit

  # XXX: CONFLICTS
  # brew install mysql
  # brew install mariadb

  brew install sysbench
  brew install mytop
  brew install mysqltuner
  brew install mycli
  brew install mydumper

  brew install --cask mysqlworkbench
}

######################################################################
#<
#
# Function: p6df::modules::mysql::init()
#
#>
######################################################################
p6df::modules::mysql::init() {

  export MYSQL_PS1="\v \u@\h:\p (\d)>"
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
