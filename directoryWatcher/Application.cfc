<cfcomponent>
	<cfset this.name= hash( "DirectoryWatcher") >
	<cfset this.datasource = "ecworking">
	
	
	<!---
	The very first time your application is used (think immediately after a reboot), 
	the onApplicationStart event is broadcast. 
	This gives you an opportunity to define some application-specific configuration,
	 prime caches, and do a lot more. The important part to remember is that, 
	as a rule of thumb, it only happens once, until your application times out (hasn't been used in a while), 
	the process is restarted, or the computer is restarted. 
	--->
	<cffunction
	        name="OnApplicationStart"
	        access="public"
	        returntype="boolean"
	        output="false"
	        hint="Fires when the application is first created.">
	
	        <!--- Return out. --->
	        <cfreturn true />
	</cffunction>


	<!---             
     This event is broadcast when your application times out (hasn't been used in a while),              
     or if ColdFusion is shutting down.             
     --->             
     <cffunction             
             name="OnApplicationEnd"             
             access="public"             
             returntype="void"             
             output="false"             
             hint="Fires when the application is terminated.">             
     
             <!--- Define arguments. --->             
             <cfargument             
                 name="ApplicationScope"             
                 type="struct"             
                 required="false"             
                 default="#StructNew()#"             
                 />             
     
             <!--- Return out. --->             
             <cfreturn />             
     </cffunction>
	
	
<!---
onRequestStart is broadcast before every request, giving you an opportunity to set variables that 
should be accessible on every page in the site, or to validate that the user is allowed access to the requested page, for instance. 
--->
<cffunction
        name="OnRequestStart"
        access="public"
        returntype="boolean"
        output="false"
        hint="Fires at first part of page processing.">
        
        <!--- Define arguments. --->
        <cfargument
            name="TargetPage"
            type="string"
            required="true"
            />
		<!--- reload --->
		<cfif ( structkeyExists(url,"reload") ) >
			<cfset ApplicationStop() > <!--- ormReload is a friend--->
			<cfset structclear(session)><!--- useful if login attempt is locked. --->
			<cfhtmlhead text='<script type="text/javascript">alert("Application was refreshed.");</script>'>
		</cfif>



        <!--- Return out. --->
        <cfreturn true />
</cffunction>	
	
	
	
	
	
	<!---The onRequestStart event has this weird cousin, onRequest,.     
    You can effectively use them both (onRequestStart is broadcast before onRequest), but they operate a little differently.     
    --->    
    <cffunction    
            name="OnRequest"    
            access="public"    
            returntype="void"    
            output="true"    
            hint="Fires after pre page processing is complete.">    
    
            <!--- Define arguments. --->    
            <cfargument    
                name="TargetPage"    
                type="string"    
                required="true"    
                />    
    
            <!--- Include the requested page. --->    
            <cfinclude template="#ARGUMENTS.TargetPage#" />    
    
            <!--- Return out. --->    
            <cfreturn />    
    </cffunction>
    
    
  
</cfcomponent>