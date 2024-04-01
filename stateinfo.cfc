component{
    
    function obtainUser(){
        firstname="",
        lastname="",
        email="",
        acctNumber=""

    }


      

     
    

 
function processNewAccont(formData){
    if (emailUnique( formdata.email)){
        var newId = createuuid();
        writeDump("IT was unique")
    } else{
        writeDump("Already in the database")
    }
}
function emailUnique(required string email){
    var qs = new query(datasource=application.dsource);
    qs.setSql("Select * from people where email=:email");
    qs.addParam(name="email", value=arugment.email);
    return qs.execute().getResult().recordcount ==0;
}


}


