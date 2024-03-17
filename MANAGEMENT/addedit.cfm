<cftry><cfdump var="#form#"/>
    <cfset addEditFunctions = createObject("addedit") />
    <cfset addEditFunctions.processForms(form)>
    <div class="row">
         <div id="main" class="col-9">
    <cfoutput> #mainForm()#</cfoutput>
    </div>

     <div id= "leftgutter" class="col-lg-3 order-first">
        <cfoutput> #sideNav()#</cfoutput>
     </div>
    </div>
    <cfcatch type="any">
        <cfoutput>
    #cfcatch.Message#
        </cfoutput>
    </cfcatch>
 </cftry>

<cffunction name="mainForm">
    <cfoutput>
        <form action="#cgi.script_name#?tool=addedit" method="post">
            <div class="form-floating mb-3">
                <input type="text" id="isbn13" name="isbn13" class="formcontrol" value="" placeholder="Please Enter The ISBN13 of the
                   book" />
                   Expanding And Styling The Main Form 2
                <label for="isbn13">ISBN 13: </label>
                <button type="submit" class="btn btn-primary" style="width: 100%">Add Book</button>
                </div>
            <label for="isbn13">ISBN13:</label>
            <input type="text" id="isbn13" name="isbn13" value="" placeholder="ISBN13" />
            <label for="title"> Book Title</label>
            <input type="text" id="title" name="title"  placeholder="Book Title" />
            <button typle= "submit" class="btn btn-primary"> Add Book </button>
            
        </form>
    </cfoutput>
</cffunction>
   
   
   <cffunction name="sideNav">
    <cfset allbooks = addEditFunctions.sideNavBooks()>
     <div>
     Book List
     </div>
     <cfoutput>
     <ul class="nav flex-column">
     <cfloop query="allbooks">
     <li class=”nav-item”>
     <a class=”nav-link”>#trim(title)#</a>
     </li>
     </cfloop>
     </ul>
     </cfoutput>
    </cffunction>
   
    