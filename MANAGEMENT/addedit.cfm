<cftry>
        <cfparam name="book" default="" />
    
    <cfdump var="#form#"/>
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
    #cfcatch#
        </cfoutput>
    </cfcatch>
 </cftry>

<cffunction name="mainForm">

    <cfif book.len()==0>
        Please choose a book from the left hand side.
    <cfelse>
    <cfset allPublishers= addEditFunctions.allPublishers() />
    <cfset bookDetails = addEditFunctions.bookDetails( book ) />
    <cfdump var="#bookDetails#" />
   
    <cfoutput>
        <form action="#cgi.script_name#?tool=addedit" method="post">
            <div class="form-floating mb-3">
                <input type="text" id="isbn13" name="isbn13"  value="#bookDetails.isbn13[1]#" placeholder="ISBN13" />
                <label for="isbn13"></label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" id= "title"  name="title" value="#bookDetails.title[1]#" placeholder= "Book Title" class="form control"/>
                <label for="title"> </label>
            </div>
            <div class="form-floating mb-3">
                <input type="number" id= "pages" name="pages" value="#bookDetails.pages[1]#" placeholder= "Number of Pages" class="form control"/>
                <label for="pages"> </label>
            </div>
            <div class="form-floating mb-3">
                <input type="number" id= "weight" step=".1" name="weight" value="#bookDetails.weight[1]#" placeholder= "Weight of Book "class="form control"/>
                <label for="weight"> </label>
            </div>
            <div class="form-floating mb-3">
                <input type="number" id= "year" name="year" value="#bookDetails.year[1]#"  placeholder= "Year of Publication" class="form control"/>
                <label for="year"> </label>
            </div>
            <div class="form-floating mb-3">
               <select id="publisher" name="publisher" class="form-control">
                    <option value=""></option>
                    <cfloop query="allPublishers">
                        <option value="#id#"  #bookDetails.publisherId[1] ==id ? "selected" : ""  #> #name# </option>
                    </cfloop>

        
               </select>
                <label for="publisher"> Publisher</label>
            </div>
            
            <button type="submit" class="btn btn-primary" style="width: 100%">Add Book</button>
            
        </form>
    </cfoutput>
</cfif>
</cffunction>
   
   
<cffunction name="sideNav">
    <cfset allbooks = addEditFunctions.sideNavBooks()>
     <div>
     Book List
     </div>
     <cfoutput>
     <ul class="nav flex-column">
        <a class=”nav-link” href="#cgi.SCRIPT_NAME#?tool=addeddit&book=new"> Add a New Book</a>
     <cfloop query="allbooks">
     <li class=”nav-item”>
            <a class=”nav-link” href="#cgi.SCRIPT_NAME#?tool=addeddit&book= #isbn13#">#trim(title)#</a>
     </li>
     </cfloop>
     </ul>
     </cfoutput>
    </cffunction>
   
    