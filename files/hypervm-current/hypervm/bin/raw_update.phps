<?php 

function windowsOs() { if (getOs() == "windows") { return true; } return false; }
function getOs() { return (substr(php_uname(), 0, 7) == "Windows")? "windows": "linux"; }

function download_file($url, $localfile = null)
{
	$ch = curl_init($url);
	if (!$localfile) {
		$localfile = basename($url);
	}
	$fp = fopen($localfile, "w");
	curl_setopt($ch, CURLOPT_FILE, $fp);
	curl_setopt($ch, CURLOPT_HEADER, 0);
	curl_exec($ch);
	curl_close($ch);
	fclose($fp);
}
chdir("..");
unlink("hypervm-current.zip");
print("Downloading.... \n");
download_file("http://download.hypervm-ng.org/download/hypervm-ng/production/hypervm-current.zip");
print("download done...\n");
if (WindowsOs()) {
	system("c:/Progra~1/7-zip/7z.exe x -y hypervm-current.zip");
} else {
	system("unzip -oq hypervm-current.zip");
	print("Chowning...\n");
	system("chown -R lxlabs ..");
}


