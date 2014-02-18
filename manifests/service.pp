class tomcat::service inherits tomcat {
  
  if ($service_ensure == undef or !($service_ensure in [ 'running', 'stopped' ])) {
    fail('service_ensure parameter must be running or stopped')
  }
  
  if ($service_ensure == 'running') {
    exec { 'start-tomcat':
      cwd     =>  "${deploymentDir}/bin",
      user    => "${user}",
      command => "sudo ./startup.sh",
      creates => '/var/run/tomcat.pid',
      path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
      require => Class['tomcat::setup'],
    }  
  } 
}