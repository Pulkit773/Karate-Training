function auth(cred) {
	var info = cred.username + ':' + cred.password;
	var base64 = Java.type('java.util.Base64');
	var encodedStr = base64.getEncoder().encodeToString(info.toString().getBytes());
	return 'Basic ' + encodedStr;	
}