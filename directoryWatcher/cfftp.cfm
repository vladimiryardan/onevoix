
<cfset path = getdirectoryFromPath("C:/inetpub/wwwroot/DirectoryWatcher/Source/auction123_com/autorevolution.txt") >

<cfset dir = listlast(path, "\/") >
<!---<cfset password = "NFTp2007!@##">

<script>
function myFunction() {                        
    var str = document.getElementById("password").innerHTML; 
    var res = str.replace("NFTp2007!@##", "NFTp2007!@#");
    document.getElementById("password").innerHTML = res;
}
</script>--->

<!---List Dir--->
<cfsavecontent variable="passw" >NFTp2007!@#</cfsavecontent>
<cfftp 
    	 action = "listDir"
    	 name="directoryWatcher"
    	 server="data.autorevolution.net"
    	 directory="/"
	   	 username="newftp"
		 password="#passw#"
		 connection="dataftp"
		 timeout="360"
		 retrycount="3"
		 passive="true"
>

<cfdump var="#passw#">
<cfdump var="#directoryWatcher#">

<!---Put File --->

<cfftp
  
	action="putFile"
	name="directoryWatcher"
	server="data.autorevolution.net"
	username="newftp"
	password="#passw#"
	remotefile=  "autorevolution2.txt"
    localfile=   "D:\Jake\CF2016\cfusion\wwwroot\local\directoryWatcher\ftpsample\auction123_com"
    
>

<cfdump var="#directoryWatcher#">
