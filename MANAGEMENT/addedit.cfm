<cftry>
    <cfparam name= "book" default= "" />
    <cfparam name= "qTerm" default= "" />

    <cfset addEditFunctions = createObject("addedit") />
    <cfset addEditFunctions.processForms(form)>

    <div class="row">
        <div id="main" class="col-9">
            <cfoutput>#mainForm()#</cfoutput>
        </div>

        <div id="leftgutter" class= "col-lg-3 order-first">
             <cfoutput>#sideNav()#</cfoutput>
        </div>
    </div>
    <cfcatch type="any">
        <cfoutput>
            #cfcatch#
        </cfoutput>
    </cfcatch>
</cftry>

<cffunction name="mainForm">

    <cfif book.len() ==0>
        Please choose a book from the left hand side.
    <cfelse>
    <cfset var allPublishers = addEditFunctions.allPublishers()/>
    <cfset var bookDetails = addEditFunctions.bookDetails( book ) />
    
    <cfoutput>
        <form action="#cgi.SCRIPT_NAME#?tool=addedit" method="post">
            <div class="form-floating mb-3">
                <input type="text" id="isbn13" name="isbn13" value="#bookDetails.isbn13[1]#" placeholder="ISBN13" class="form-control" style="width:250px"/>
                <label for="isbn13">ISBN13:</label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" id="title" name="title" value="#bookDetails.title[1]#" placeholder="Book Title" class="form-control" style="width:250px"/>
                <label for="title">Book Title</label>
            </div>
            <div class="form-floating mb-3">
                <input type="number" id="pages" name="pages" value="#bookDetails.pages[1]#" placeholder="Number of Pages" class="form-control" style="width:250px"/>
                <label for="pages">Number of Pages</label>
            </div>
            <div class="form-floating mb-3">
                <input type="number" id="weight" step=".1" name="weight" value="#bookDetails.weight[1]#" placeholder="Weight of Book" class="form-control" style="width:250px"/>
                <label for="weight">Weight of Book</label>
            </div>
            <div class="form-floating mb-3">
                <input type="number" id="year" name="year" value="#bookDetails.year[1]#"placeholder="Year of Publication" class="form-control" style="width:250px"/>
                <label for="year">Year of Publication</label>
            </div>
            <div class="form-floating mb-3">
                <select id= "publisher" name= "publisher" class= "form-control" style="width:250px">
                    <option value= ""></option>
                    <cfloop query="allPublishers">
                            <option value="#publisherid#" #bookDetails.publisherId[1] == publisherid ? "selected" : "" #> #name#</option>
                    </cfloop>
                </select>
                <label for="publisher">Publisher</label>
            </div>
            <div class="row">
                <div class= "col">
                    <label for="uploadImage"> Upload Cover </label>
                    <div class="input-group mb-3">
                        <input type="file" id="uploadImage" name= "uplaodImage" class="form-control" />
                        <input type="hidden" name="image" value="#trim(BookDetails.image[1])#" />
                    </div>
                </div>
                <div class= "col">
                    <cfif BookDetails.image[1].len() gt 0>
                        <img src="../images/#trim(BookDetails.image[1])#" style="width:200px" />
                    </cfif>
                </div>
                <div class="form-floating mb-3" >
                    <div>
                    <label for="description">Description</label>
                    </div>
                        <textarea id="description" name="description">
                            <cfoutput>#BookDetails.description#</cfoutput>
                        </textarea>
                            <script>
                                 ClassicEditor
                                    .create(document.querySelector('##description'))
                                    .catch(error => {console.dir(error)});
                            </script>
                    </div>
           
            <button type=”submit” class="btn btn-primary" style="width:200px">Add Book</button>

        </form>
    </cfoutput>
</cfif>
</cffunction>

<cffunction name="sideNav">
    <cfset allBooks = addEditFunctions.sideNavBooks( qterm )/>
        <div>
            Book List
        </div>
             <cfoutput>
                #findBookForm()#
            </cfoutput>
            <cfoutput>
                 <ul class="nav flex-column">
                 <li class="nav-item">
                     <a href="#cgi.script_name#?tool=addedit&book=new" class="nav-link">
                         New Book
                    </a>
                </li>
        <cfif qterm.len() ==0>
            No Search Term Entered
            <cfelseif allBooks.recordcount==0>
            No Results Found
            Adding Search To Our Management Page 5
            <cfelse>
    <cfloop query="allBooks">
                <li class="nav-item">
                    <a href="#cgi.script_name#?tool=addedit&book=#isbn13#" class="nav-link">#trim(title)#</a>
                </li>
    </cfloop>
        </cfif>
                </ul>
             </cfoutput>
   </cffunction>
   
<cffunction name="findBookForm">
    <cfoutput>
    <form action="#cgi.script_name#?tool=#tool#" method ="post">
        <div class="form-floating mb-3">
            <input type="text" id="qterm" name="qterm" class="form-control" value="#qterm#" placeholder="Enter a search term to find a book to edit" />
            <label for="qterm">Search Inventory </label>
        </div>
    </form>
    </cfoutput>
</cffunction>
   
           