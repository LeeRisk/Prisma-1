package prisma

class Extra {
String name
String label
String formName
String validationType
boolean required
static belongsTo=[type:Type]
String toString(){
	return name
	}
    static constraints = {
		name(nullable:false,blank:false,unique:true)
    }
}
