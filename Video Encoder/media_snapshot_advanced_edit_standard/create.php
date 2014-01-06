<?php

if ( isset ( $GLOBALS["HTTP_RAW_POST_DATA"] )) {

	$im =  $GLOBALS["HTTP_RAW_POST_DATA"];
	
	$fp = fopen($_GET['name'], 'wb');	
	fwrite($fp, $im);
	fclose($fp);
	
	echo "result=".$_GET['name'];
	
}  else echo 'result=An error occured.';

?>