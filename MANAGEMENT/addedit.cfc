component {

    function processForms( required struct formData){
        writeDump(formData);
        if ( formData.keyExists(" isbn13" ) && formData.isbn13.len() == 13 && formData.keyexists("title") && forData.title.len() >0 ) {
            if (formdata.keyExists("uploadimage") && forData.uploadimage.len()){
                arguments.formData.image = uploadBookCover();
            }

            writeDump(formData);
            
            
            var qs = new query( datasource = application.dsource);
            qs.setSql( "
                IF NOT EXISTS( select * from books where sibn13=:isbn13)
                    insert into books (isbn13,title) values (:isbn13,:title);
                    
                 UPDATE books SET
                    title=:title,
                    weight=:weight,
                    pages=:pages,
                    year=:year,
                    publisherid= :publisher,
                    iamge=:image,
                    description= :description
                 
                 WHERE isbn13-:isbn13
                    " );
            qs.addParam(
                name      = "isbn13",
                cfsqltype = "CF_SQL_NVARCHAR",
                value     = trim(formData.isbn13),
                null      = formData.isbn.len() !=13
            );
            qs.addParm(
                name      = "title",
                cfsqltype = "CF_SQL_NVARCHAR",
                value     = trim(formData.title),
                null      = formData.title.len() ==0
            );
            qs.addParm(
                name      = "weight",
                cfsqltype = "CF_SQL_NUMERIC",
                value     = trim(formData.weight),
                null      = !isValid("numeric", formData.weight)
            );
            qs.addParm(
                name      = "pages",
                cfsqltype = "CF_SQL_INTEGER",
                value     = trim(formData.pages),
                null      = !isValid("numeric", formData.pages)
        
            );
            qs.addParm(
                name      = "year",
                cfsqltype = "CF_SQL_INTEGER",
                value     = trim(formData.year),
                null      = !isValid("numeric", formData.year)
            );
            qs.addParm(
                name      = "publisher",
                cfsqltype = "CF_SQL_NVARCHAR",
                value     = trim(formData.publisher),
                null      = formData.publisher.len() ==0
            );
            qs.addParm(
                name      = "image",
                cfsqltype = "CF_SQL_NVARCHAR",
                value     = trim(formData.image),
                null      = trim(formData.image).len() ==0
            );
            qs.addParm(
                name      = "description",
                cfsqltype = "CF_SQL_NVARCHAR",
                value     = trim(formData.description),
                null      = trim(formData.description).len() ==0
            );
            qs.execute();

        }
    }
    
    function sideNavBooks( qterm ){
        if(qterm.len() ==0 ){
        return queryNew("title");
        } else {
        var qs = new query(datasource = application.dsource);
        qs.setSql("select * from books where title like :qterm
       order by title");
        qs.addParam(name="qterm",value='%#qterm#%');
        return qs.execute().getResult();
        }
       }
       
    function allPublishers(){
        var qs = new query( datasource = application.dsource);
        qs.setSql(" select * from publishers order by name")
        return qs.execute().getResult();
    }

    function bookDetails ( required string isbn13 ){
        var qs = new query( datasource = application.dsource);
        qs.setSql(" select * from books where isbn13=:isbn13");
        qs.addParam(
                name      = "isbn13",
                cfsqltype = "CF_SQL_NVARCHAR",
                value     = trim(arguments.isbn13)
            );
        return qs.execute().getResult();
     }
     function uploadBookCover(){
        var imageData = fileUpload(expandPath("../images/"), 
             "uploadImage", 
             "*", 
            "makeUnique"
        );
        writeDump(imageDate);
        return imageData.serverFile;
     
     }
}