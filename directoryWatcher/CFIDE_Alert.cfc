<cfcomponent>
<cffunction name="onAdd" returntype="any">
<cfargument name="CFEvent" type="struct" required="yes">
<cfset data = CFEvent.data>


 <cfmail to="jacobdeanpostanes@gmail.com" 
		server="Smtp.gmail.com"
		username="jacobdeanpostanes@gmail.com"
		password="30020370.kJ30"
		from="alert@example.com"
		subject="CFIDE CHANGE DETECTED!"
		type="html">
<cfdump var="#data#">
</cfmail>
</cffunction>

<cffunction name="onCHANGE" returntype="any">
<cfargument name="CFEvent" type="struct" required="yes">
<cfset data = CFEvent.data>


 <cfmail to="jacobdeanpostanes@gmail.com" 
		server="Smtp.gmail.com"
		username="jacobdeanpostanes@gmail.com"
		password="30020370.kJ30"
		from="alert@example.com"
		subject="CFIDE CHANGE DETECTED!"
		type="html">
			
<cfdump var="#data#">
</cfmail>
</cffunction>
</cfcomponent>