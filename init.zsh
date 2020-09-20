######################################################################
#<
#
# Function: p6df::modules::mysql::version()
#
#>
######################################################################
p6df::modules::mysql::version() { echo "0.0.1" }

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

  brew install mytop
  brew install mysqltuner
  brew install mycli
  brew install mydumper

  brew cask install mysqlworkbench
}

######################################################################
#<
#
# Function: p6df::modules::mysql::home::symlink()
#
#>
######################################################################
p6df::modules::mysql::home::symlink() {

  ln -sf $P6_DFZ_SRC_P6M7G8_DIR/p6df-db/share/mysqlrc $P6_DFZ_DATA_DIR/.mysqlrc
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

# We've installed your MySQL database without a root password. To secure it run:
#    mysql_secure_installation
# MySQL is configured to only allow connections from localhost by default
# To connect run:
#    mysql -uroot
#
# To have launchd start percona-server now and restart at login:
#    brew services start percona-server
# Or, if you don't want/need a background service you can just run:
#    mysql.server start