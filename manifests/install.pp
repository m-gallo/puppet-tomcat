class tomcat::install inherits tomcat {
   
  file { $cacheDir:
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '644',
  }
  
  Exec {
    path => ['/sbin', '/bin', '/usr/sbin', '/usr/bin'],
  }

  file { "${cacheDir}/${source}":
    source  => "puppet:///modules/${module_name}/${source}",
    require => File[$cacheDir],
  }

  exec { "extract_tomcat-${name}":
    cwd     => $cacheDir,
    command => "mkdir extracted; tar -C extracted -xzf ${source} && touch .tomcat_extracted",
    creates => "${cacheDir}/.tomcat_extracted",
    require => File["${cacheDir}/${source}"],
  }

  exec { "create_target_tomcat-${name}":
    cwd     => '/',
    command => "mkdir -p ${deploymentDir}",
    creates => $deploymentDir,
    require => Exec["extract_tomcat-${name}"],
  }

  exec { "move_tomcat-${name}":
    cwd     => $cacheDir,
    command => "cp -r extracted/apache-tomcat*/* ${deploymentDir} && chown -R ${user}:${user} ${deploymentDir}",
    creates => "${deploymentDir}/lib/catalina.jar",
    require => Exec["create_target_tomcat-${name}"],
  }
}

