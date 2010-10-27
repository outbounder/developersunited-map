<?php
/**
  * Provides functionality for including files.
  */
class classLoader
{
  /**
    * Default autoloader for Konstrukt naming scheme.
    */
  static function autoload($classname) {
    $filename = str_replace('_', '/', $classname).'.php';
    if (self::SearchIncludePath($filename)) {
      require_once($filename);
    }
    else
    	echo $filename.' not found in '.ini_get("include_path");	 
  }

  /**
    * Searches the include-path for a filename.
    * Returns the absolute path (realpath) if found or FALSE
    * @return mixed
    */
  static function SearchIncludePath($filename) {
    if (is_file($filename)) {
      return $filename;
    }
    foreach (explode(PATH_SEPARATOR, ini_get("include_path")) as $path) {
      if (strlen($path) > 0 && $path{strlen($path)-1} != DIRECTORY_SEPARATOR) {
        $path .= DIRECTORY_SEPARATOR;
      }
      $f = realpath($path . $filename);
      if ($f && is_file($f)) {
        return $f;
      }
    }
    return FALSE;
  }
}

// Here we hook up the default autoloader. With this, you don't need to explicitly include
// files, as long as they follow the Konstrukt naming scheme.
// Note that Konstrukt differs slightly from PEAR, in that all filenames are lowercase.
// This is to ensure portability across filesystems, with case sensitive filenames (*nix)
spl_autoload_register(Array('classLoader', 'autoload'));