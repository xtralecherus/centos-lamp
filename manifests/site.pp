# default node for all servers
node default { 

	# Install Apache and PHP
	class { 'apache':  }
	class { 'apache::mod::php': } 
	
	# Install MySQL
	class { '::mysql::server': }
	
	# Create a database
	mysql::db { 'mydb':
		user     => 'vagrant',
		password => 'vagrant',
		host     => 'localhost',
    }
	
	# Install PHP bindings for MySQL
	package { 'php-mysql':
		ensure => installed,
	}
}