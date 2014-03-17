package prisma
import grails.plugin.springsecurity.annotation.Secured
@Secured(['permitAll'])
class MapController {
	static scope = "session"
	def decisions = new Decision()
	def offset = "0"
	def static maxToShow = 10

	def index() {
		def decisionG=new Decision()
		decisionG=Decision.createCriteria().list{ isNotNull("geo") }
		println 'size'+decisionG.size()
		def lat,lon,dr,ds
		def marker=new Map[decisionG.size()]
		def tempMarker = new Map[1]
		int i=0
		decisionG.each{ dec ->
			lat=dec.geo.latitude
			lon=dec.geo.longitude
			dr=false
			ds='<a href="'+grailsApplication.config.grails.serverURL+'/map/show_geo/'+dec.geo.id+'/?source=map'+'" target="_blank">'+dec.geo+'</a>'
			tempMarker[0] = [latitude:lat, longitude:lon, draggable:dr,description:ds]
			if(!marker.contains(tempMarker[0])){
				println "new marker"
				marker[i] = [latitude:lat, longitude:lon, draggable:dr,description:ds]
				i++
			}
		}

		/*lat=40.636
		 lon=22.938
		 dr=false
		 marker[0] = [latitude:lat, longitude:lon, draggable:dr,description:ds]
		 lat=40.65
		 lon=22.92
		 dr=false
		 ds='πλατεία τζομπανογλου'
		 marker[1] = [latitude:lat, longitude:lon, draggable:dr,description:ds]*/
		[mark:marker]
	}

	def homepage() {
		def decisionG=new Decision()
		decisionG=Decision.createCriteria().list{ isNotNull("geo") }
		println 'size: '+decisionG.size()
		def lat,lon,dr,ds
		def marker=new Map[decisionG.size()]
		def tempMarker = new Map[1]
		int i=0
		decisionG.each{ dec ->
			lat=dec.geo.latitude
			lon=dec.geo.longitude
			dr=false
			ds='<a href="'+grailsApplication.config.grails.serverURL+'/map/show_geo/'+dec.geo.id+'/?source=map'+'" target="_blank">'+dec.geo+'</a>'
			tempMarker[0] = [latitude:lat, longitude:lon, draggable:dr,description:ds]
			if(!marker.contains(tempMarker[0])){
				println "new marker"
				marker[i] = [latitude:lat, longitude:lon, draggable:dr,description:ds]
				i++
			}
		}
		render(template:"/common/map", model:[mark:marker])
	}
	def show_geo(){
		//def decisions=new Decision()
		decisions=Decision.createCriteria().list{
			geo{
				eq("id",params.id.toLong())
			}
			order("date","desc")
		}
		def toShow = Math.min(maxToShow, decisions.size())
		render(view:"/map/markerList", model:[results:decisions.subList(0, toShow),decisionInstanceTotal:decisions.size(),source:"map"])
	}

	def list() {

		offset=params.offset
		def toShow = Math.min(Math.abs(decisions.size() - params.offset.toInteger()),maxToShow)
		println "toShow: "+toShow
		println "remaining: "+ (decisions.size())
		println "source: "+params.source
		render (template:"/common/decision_list", model:[results:decisions.subList(params.offset.toInteger(),params.offset.toInteger() + toShow), decisionInstanceTotal:(decisions.size()), source:params.source])
	}
	
	def sort(){
		
				/*def c = Decision.createCriteria()
				 decision = c.list {
				 eq("ada",decision.ada)
				 order(params.sort,params.order)
				 }*/
		
				//		decision = decision.ada.sort{it.size()}
				//		def sortedDecisions = Decision.list(params)
				if(offset==null) offset="0";
				def c = Decision.createCriteria()
				decisions = c.list {
					'in'("ada",decisions.ada)
					order(params.sort,params.order)
				}
		
		
				def toShow = Math.min(Math.abs(decisions.size() - offset.toInteger()),maxToShow)
				println offset+":"+toShow
				render (template:"/common/table_results", model:[results:decisions.subList(offset.toInteger(),offset.toInteger() + toShow), decisionInstanceTotal:(decisions.size()), source:params.source])
			}
}
