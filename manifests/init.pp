# Class: tomcat
#
# This module manages tomcat
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class tomcat (
  $source = $tomcat::params::source,
  $deploymentDir = $tomcat::params::deploymentDir,
  $user = $tomcat::params::user,
  $service_ensure = $tomcat::params::service_ensure,
  $cacheDir = '/var/lib/puppet/working-tomcat'
) inherits tomcat::params {
  
  if ($source == undef) {
    fail('source parameter must be set')
  }
  
  if ($deploymentDir == undef) {
    fail('deploymentdir parameter must be set')
  }
  
  if ($user == undef) {
    fail('user parameter must be set')
  }
  
  include tomcat::install
  include tomcat::setup
  include tomcat::service
}
