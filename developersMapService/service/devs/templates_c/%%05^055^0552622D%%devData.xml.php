<?php /* Smarty version 2.6.22, created on 2009-06-12 13:38:58
         compiled from devData.xml */ ?>
<?php $_from = $this->_tpl_vars['dev']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['v']):
?>
<property name="<?php echo $this->_tpl_vars['k']; ?>
"><?php echo $this->_tpl_vars['v']; ?>
</property>
<?php endforeach; endif; unset($_from); ?>