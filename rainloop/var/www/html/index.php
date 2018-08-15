<?php
// Enable RainLoop Api and include index file
$_ENV['RAINLOOP_INCLUDE_AS_API'] = true;
include '/var/www/html/rainloop/index.php';

//
// Get sso hash
//
// @param string $email
// @param string $password
// @return string
//
$ssoHash = \RainLoop\Api::GetUserSsoHash('catchall@example.com', $_ENV['CATCHALL_PASSWORD']);
header('Location: http://'.$_SERVER['HTTP_HOST'].'/rainloop/?sso&hash='.$ssoHash);
