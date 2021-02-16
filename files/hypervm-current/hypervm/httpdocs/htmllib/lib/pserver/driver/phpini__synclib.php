<?php 

class phpini__sync extends Lxdriverclass {


function initString($ver)
{
	$pclass = $this->main->getParentClass();

	$this->main->fixphpIniFlag();

if ($this->main->phpini_flag_b->isON('enable_zend_flag')) {
	$this->main->phpini_flag_b->enable_zend_val =<<<XML

[Zend]
zend_extension_manager.optimizer=/usr/lib/kloxophp/zend/lib/Optimizer-3.2.8
zend_extension_manager.optimizer_ts=/usr/lib/kloxophp/zend/lib/Optimizer_TS-3.2.8
zend_optimizer.version=3.2.8
zend_extension=/usr/lib/kloxophp/zend/lib/ZendExtensionManager.so
zend_extension_ts=/usr/lib/kloxophp/zend/lib/ZendExtensionManager_TS.so
XML;

} else {
	$this->main->phpini_flag_b->enable_zend_val = "";
}

if ($this->main->phpini_flag_b->isON('enable_xcache_flag')) {
	lxfile_touch("../etc/flag/xcache_enabled.flg");
	$this->main->phpini_flag_b->enable_xcache_val =<<<XML
zend_extension = /usr/lib/php/modules/xcache.so
XML;
} else {
	lxfile_rm("../etc/flag/xcache_enabled.flg");
	$this->main->phpini_flag_b->enable_xcache_val = "";
}


if ($this->main->phpini_flag_b->isON('enable_ioncube_flag')) {
	$this->main->phpini_flag_b->enable_ioncube_val =<<<XML
zend_extension=/usr/lib/kloxophp/ioncube/ioncube_loader_lin_$ver.so
XML;
} else {
	$this->main->phpini_flag_b->enable_ioncube_val = "";
}

}

function enableDisableModule($flag, $mod)
{
	unlink("/etc/php.d/$mod.ini");
	unlink("/etc/php.d/$mod.noini");
	if ($this->main->phpini_flag_b->isOn($flag)) {
		lxfile_cp("../file/$mod.ini", "/etc/php.d/$mod.ini");
	} else {
		lxfile_cp("../file/$mod.ini", "/etc/php.d/$mod.noini");
	}

}
function createIniFile()
{
	$pclass = $this->main->getParentClass();


	$ver = find_php_version();

	//dprintr($this->main->phpini_flag_b);
	$this->initString($ver);

	//dprintr($this->main->phpini_flag_b);

	$header = lfile_get_contents("../file/phpini/php.ini.template-$ver");
	$cont = lfile_get_contents("../file/phpini/php.ini.temp");
	$htcont = lfile_get_contents("../file/phpini/htaccesstemp");

	$vlist = array("enable_zend_val", "enable_ioncube_val", "enable_xcache_val");

	$l1 = $this->main->getInheritedList();
	$l2 = $this->main->getLocalList();
	$l3 = $this->main->getExtraList();

	$ll  = lx_array_merge(array($l1, $l2, $l3));
	$list =  array_unique($ll);
	foreach($list as $l) {
		$vl = strtil($l, "_flag") . "_val";
		if (array_search_bool($vl, $vlist)) {
			continue;
		}
		list($cont, $htcont) = $this->replacestr(array($cont, $htcont), $l);
	}

	foreach($vlist as $vl) {
		list($cont) = $this->replacestr(array($cont), $vl);
	}


	/*
	list($cont) = $this->replacestr(array($cont), 'enable_zend_val');
	list($cont) = $this->replacestr(array($cont), 'enable_ioncube_val');
	list($cont) = $this->replacestr(array($cont), 'enable_xcache_val');


	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'register_global_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'output_compression_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'display_error_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'file_uploads_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'upload_max_filesize');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'log_errors_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'upload_tmp_dir_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'output_buffering_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'register_argc_argv_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'magic_quotes_gpc_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'variables_order_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'magic_quotes_runtime_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'magic_quotes_sybase_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'gpc_order_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'extension_dir_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'enable_dl_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'mysql_allow_persistent_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'disable_functions_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'max_execution_time_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'max_input_time_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'memory_limit_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'post_max_size_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'register_long_arrays_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'allow_url_fopen_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'allow_url_include_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'session_save_path_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'cgi_force_redirect_flag');
	list($cont, $htcont) = $this->replacestr(array($cont, $htcont), 'safe_mode_flag');
	*/



	$stlist[] = "###Start Kloxo PHP config Area";
	$stlist[] = "###Start Lxdmin Area";
	$stlist[] = "###Start Kloxo Area";
	$stlist[] = "###Start Lxadmin PHP config Area";

	$endlist[] = "###End Kloxo PHP config Area";
	$endlist[] = "###End Kloxo Area";
	$endlist[] = "###End Lxadmin PHP config Area";

	$endstring = $endlist[0];
	$startstring = $stlist[0];


	if ($pclass === 'pserver') {
		$file = "/etc/php.ini";
		if (!lxfile_exists("__path_kloxo_back_phpini")) {
			lxfile_cp("/etc/php.ini", "__path_kloxo_back_phpini");
		}
		$this->enableDisableModule("enable_xcache_flag", "xcache");
		$htfile = null;
		$extrafile = "/etc/custom.php.ini";
		$extrastring = lfile_get_contents("/etc/custom.php.ini");
		$cont = "$extrastring\n$cont";
	} else {
		$dname = $this->main->getParentName();
		$elogfile = "/home/{$this->main->__var_customer_name}/__processed_stats/{$this->main->getParentName()}.phplog";
		$file = "__path_httpd_root/{$this->main->getParentName()}/php.ini";
		$extrafile = "__path_httpd_root/{$this->main->getParentName()}/custom.php.ini";
		$extrastring = lfile_get_contents($extrafile);
		$htfile = "{$this->main->__var_docrootpath}/.htaccess";
		$ht1file = "/home/httpd/{$this->main->getParentName()}/kloxoscript/.htaccess";
		$htcont = "php_value error_log $elogfile\n$htcont";
		$htcont = "<Ifmodule mod_php4.c>\n$htcont\n</Ifmodule>\n<Ifmodule mod_php5.c>\n$htcont\n</Ifmodule>\n";
		file_put_between_comments($stlist, $endlist, $startstring, $endstring, $htfile, $htcont);
		file_put_between_comments($stlist, $endlist, $startstring, $endstring, $ht1file, $htcont);
		lxfile_unix_chown($htfile, "{$this->main->__var_web_user}:apache");
		$adminbasedir = trim($this->main->__var_extrabasedir);

		if (!$this->main->isOn('__var_disable_openbasedir')) {
			$cont = "open_basedir = /home/{$this->main->__var_customer_name}:$adminbasedir:/tmp:/usr/share/pear:/home/httpd/$dname:/var/lib/php/session:/home/kloxo/httpd/script:/home/httpd/$dname/kloxoscript/\n$cont";
		}
		$cont = "error_log = $elogfile\n$cont";
		$cont = "$extrastring\n$cont";
	}

	
	lxfile_rm($file);
	lfile_put_contents($file, "$header\n$cont\n");

	createRestartFile($this->main->__var_webdriver);

}

function replacestr($list, $var)
{
	$val = $this->main->phpini_flag_b->$var;

	foreach($list as $string) {
		if (!$val) {
			$string = str_replace("__lx_{$var}_comment", ";", $string);
		} else {
			$string = str_replace("__lx_{$var}_comment", "", $string);
		}
		$string = trim($string);
		$out[] = str_replace("__lx__$var", $val, $string);
	}
	return $out;
}

function dbactionAdd()
{
	$this->createIniFile();
}

function dbactionUpdate($subaction)
{
	$this->createIniFile();
}

}
