<?php

/**
*	Database Connection
*	Including this file will let you use $db to run MySQL queries on the database
*
*	APPROOT/config/erc-archive.php MUST have been require()'d before this can work!
*
*/


$db = mysqli_connect(APP_DBHOST, APP_DBUSER, APP_DBPASS, APP_DBNAME);

if ($db->connect_errno) {
	error_log("Database connection failed.");
        exit();
}

$db->query("SET NAMES utf8");
