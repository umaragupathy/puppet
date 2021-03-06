class base {
        $dnsutils = $osfamily ? {
                'Redhat'        => 'bind-utils',
                'Debian'        => 'dnsutils',
        }

	$systemupdate = $osfamily ? {
		'Redhat'	=> '/usr/bin/yum update -y',
		'Debian'	=> '/usr/bin/apt-get update -y'
	}

        package { ['tree', $dnsutils] :
                ensure => present,
        }
	
	schedule { 'system-daily' :
		period => daily,
		range  => '00:00 - 01.00'
	}

	exec { $systemupdate : 
		schedule => 'system-daily',
	}
}


