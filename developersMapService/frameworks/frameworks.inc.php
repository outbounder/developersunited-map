<?php

ini_set('include_path',
  ini_get('include_path')
  .PATH_SEPARATOR.
  dirname(__FILE__)."/Tree-0.3.4"
  .PATH_SEPARATOR.
  dirname(__FILE__)."/DB-1.7.14RC1"
  .PATH_SEPARATOR.
  dirname(__FILE__)."/konstrukt-2.0.1/lib/"
  .PATH_SEPARATOR.
  dirname(__FILE__)."/Smarty-2.6.22/libs/"
  .PATH_SEPARATOR.
  dirname(__FILE__)."/openinviter/"
  .PATH_SEPARATOR.
  dirname(__FILE__)."/openinviter/plugins/"
);

// include konstrukt rest framework
require_once 'konstrukt/konstrukt.inc.php';

// include Smarty
require_once 'Smarty.class.php';

// include open inviter
require_once 'openinviter.php';

?>