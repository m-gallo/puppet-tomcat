class tomcat::setup inherits tomcat {
  
  file {"tomcat-users.xml":
    source  => "puppet:///modules/${module_name}/tomcat-users.xml",
    ensure  => "present",
    path    => "${deploymentDir}/conf/tomcat-users.xml",
    force   => true,
    owner   => $user,
    group   => $user,
    require => Class['tomcat::install'],
  }
  
  file {"setenv.sh" :
    source  => "puppet:///modules/${module_name}/setenv.sh",
    ensure  => "present",
    path    => "${deploymentDir}/bin/setenv.sh",
    force   => true,
    owner   => $user,
    group   => $user,
    mode    => '655',
    require => File['tomcat-users.xml'],
  }
}