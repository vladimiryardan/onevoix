<cfcomponent>
	
	<!--- onAdd --->
	<cffunction name="onAdd" returntype="any">
		<cfargument name="CFEvent" type="struct" required="yes">
	
	
		<cflog file="directoryWatcher"  
		       application="no" 		       
		       text="On Add Event">
		       
		<!---	
		<cfoutput>                                                                
			<cfsavecontent variable="theText">		                                                                
					<cfdump var="#CFEvent#" label="CFEvent"><br>
			</cfsavecontent>	                                                                
		</cfoutput>			       
			       
		<cffile action="append"                                                                
				file="C:\inetpub\wwwroot\DirectoryWatcher\LogCfdebugCFC.txt.html"                                                                
				output="#theText#">
		---> 	       
		
		<!--- CFEVENT structure sample content
		cfevent.CFCMETHOD = onAdd 
		cfevent.CFCPATH = D:\Coldfusion11\cfusion\wwwroot\ford.autorevolution.net\directoryWatcher\directorWatcher.cfc 
		cfevent.DATA.FILENAME = D:\Coldfusion11\cfusion\wwwroot\ford.autorevolution.net\directoryWatcher\Source\autorevolution.txt 
		cfevent.DATA.LASTMODIFIED = {ts '2018-07-19 08:57:50'}
		cfevent.DATA.TYPE = ADD 
		cfevent.GATEWAYID = directoryWatcher_ford 
		cfevent.GATEWAYTYPE = FileWatcher 
		cfevent.ORIGINATORID = [empty string] 
		--->


			<!--- append sa masterfile.txt --->
			<cffile action="append"                                                                
						file="Masterfile.text"                                                                
						output="#CFEvent.data.filename##chr(10)#">


			<!--- 
				cfftp function
					* check if directory exists
					* create directory if not existing
					* transfer the file 
			--->
			
    	<cfftp 
    	 action="putFile"
    	 passive="yes"
    	 remotefile="/DirectoryWatcher" 
    	 localfile="D:\Jake\CF2016\cfusion\wwwroot\github\onevoix\directoryWatcher\" 
    	 failifexists="yes"
    	>
	
			
					             
	</cffunction>

	<!---onCHANGE --->
	<cffunction name="onCHANGE" returntype="any">
		
		<cfargument name="CFEvent" type="struct" required="yes">      
                                                                 			
		<cfset data = CFEvent.data>	

		<cflog file="directoryWatcher"  
		       application="no" 		       
		       text="onChange Event">		
	
	</cffunction>
	
	
	<!---onDelete --->
	<cffunction name="onDelete" returntype="any">
		
		<cfargument name="CFEvent" type="struct" required="yes">	
  
				                                                               			
		<cfset data = CFEvent.data>	

		<cflog file="directoryWatcher"  
		       application="no" 		       
		       text="onDelete Event">
		       	
	</cffunction>	
	

</cfcomponent>