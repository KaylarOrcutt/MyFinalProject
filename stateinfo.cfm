<cfset stateFunctions = createObject("stateinfo")/>
<cfset session.clear()/>

    <cfif !session.keyExists("user")>
<cfset session["user"] = stateFunctions.obtainUser() />
    </cfif>
    <cfif form.keyExists("firstname")>
        <cfset newAccountResult = stateFunctions.processNewAccount (form)/>
    </cfif>