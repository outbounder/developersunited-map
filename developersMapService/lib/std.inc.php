<?php
// project setup include paths

ini_set('include_path',
  ini_get('include_path')
  .PATH_SEPARATOR.
  dirname(dirname(__FILE__))."/"
  .PATH_SEPARATOR.
  dirname(dirname(__FILE__))."/service"
  .PATH_SEPARATOR.
  dirname(dirname(__FILE__))."/frameworks"
);

// include frameworks specifics.
require_once 'frameworks.inc.php'; 

// include the autoloader at this point
require_once 'classloader.php';

error_reporting(0);
?>