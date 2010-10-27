<?php /* Smarty version 2.6.22, created on 2009-06-12 13:50:12
         compiled from devsList.xml */ ?>
<?php echo '<?xml'; ?>
 version="1.0" encoding="UTF-8"<?php echo '?>'; ?>

<devs>
<?php $_from = $this->_tpl_vars['devs']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['dev']):
?>
<dev>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'devData.xml', 'smarty_include_vars' => array('entity' => $this->_tpl_vars['dev'])));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
</dev>
<?php endforeach; endif; unset($_from); ?>
</devs>