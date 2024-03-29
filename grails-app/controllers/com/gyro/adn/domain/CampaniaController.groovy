package com.gyro.adn.domain

import org.springframework.dao.DataIntegrityViolationException

import grails.converters.JSON

class CampaniaController {

    // fase inList: ["Contacto", "Diseño", "Emailing", "Preparacion", "Fin"]

    static final String CAMPAIGN_PHASE_CONTACT              = "Contacto";
    static final String CAMPAIGN_PHASE_DESIGN               = "Diseño";
    static final String CAMPAIGN_PHASE_EMAILING             = "Emailing";
    static final String CAMPAIGN_PHASE_PREPARING            = "Preparacion";
    static final String CAMPAIGN_PHASE_COMPLETE             = "Fin";
    
    static final String CAMPAIGN_STATS_TIMESERIES           = "timeseries";
    static final String CAMPAIGN_STATS_DATA                 = "data";
    static final String CAMPAIGN_STATS_EMAIL                = "email";
    static final String CAMPAIGN_STATS_STATUS               = "status";
    static final String CAMPAIGN_STATS_STATUS_SENT          = "sent";
    static final String CAMPAIGN_STATS_ACTION               = "action";
    static final String CAMPAIGN_STATS_ACTION_OPEN          = "open";
    static final String CAMPAIGN_STATS_ACTION_CLICK         = "click";
    static final String CAMPAIGN_STATS_ERROR                = "error";
    static final String CAMPAIGN_STATS_ACTIVITY             = "activity";
    static final String CAMPAIGN_STATS_URL                  = "url";
    static final String CAMPAIGN_STATS_TIMESTAMP            = "timestamp";

    static final String CAMPAIGNS_FILTERS_CAMPAIGN_ID       = "campaign_id";


    static final String CAMPAIGN_TYPE_REGULAR               = "regular";
    static final String CAMPAIGN_TYPE_PLAINTEXT             = "plaintext";
    static final String CAMPAIGN_TYPE_ABSPLIT               = "absplit";
    static final String CAMPAIGN_TYPE_RSS                   = "rss";
    static final String CAMPAIGN_TYPE_TRANS                 = "trans";


    static final String CAMPAIGN_OPTION_LIST_NAME           = "name";
    static final String CAMPAIGN_OPTION_LIST_ID             = "list_id";
    static final String CAMPAIGN_OPTION_SUBJECT             = "subject";
    static final String CAMPAIGN_OPTION_FROM_EMAIL          = "from_email";
    static final String CAMPAIGN_OPTION_FROM_NAME           = "from_name";
    static final String CAMPAIGN_OPTION_TEMPLATE_ID         = "template_id";
    static final String CAMPAIGN_OPTION_FOLDER_ID           = "folder_id";
    static final String CAMPAIGN_OPTION_TRACKING            = "tracking";
    static final String CAMPAIGN_OPTION_TITLE               = "title";
    static final String CAMPAIGN_OPTION_AUTHENTICATE        = "authenticate";
    static final String CAMPAIGN_OPTION_ANALYTICS           = "analytics";
    static final String CAMPAIGN_OPTION_ANALYTICS_GOOGLE    = "google";
    static final String CAMPAIGN_OPTION_INLINE_CSS          = "inline_css";
    static final String CAMPAIGN_OPTION_GENERATE_TEXT       = "generate_text";
    static final String CAMPAIGN_OPTION_TYPE                = "type";
    static final String CAMPAIGN_OPTION_ID                  = "id";
    static final String CAMPAIGN_OPTION_SEND_TIME           = "send_time";
    static final String CAMPAIGN_OPTION_ARCHIVE_URL         = "archive_url";
    static final String CAMPAIGN_OPTION_TYPE_OPTS           = "type_opts";
    static final String CAMPAIGN_OPTION_AUTO_FOOTER         = "auto_footer";
    static final String CAMPAIGN_OPTION_CONTENT_TYPE        = "content_type";
    static final String CAMPAIGN_OPTION_WEB_ID              = "web_id";
    static final String CAMPAIGN_OPTION_TO_NAME             = "to_name";
    static final String CAMPAIGN_OPTION_TIMEWARP            = "timewarp";
    static final String CAMPAIGN_OPTION_AUTO_TWEET          = "auto_tweet";
    static final String CAMPAIGN_OPTION_STATUS              = "status";
    static final String CAMPAIGN_OPTION_ECOMM360            = "ecomm360";
    static final String CAMPAIGN_OPTION_EMAILS_SENT         = "emails_sent";
    static final String CAMPAIGN_OPTION_SEGMENT_OPTS        = "segment_opts";
    static final String CAMPAIGN_OPTION_AUTO_FB_POST        = "auto_fb_post";
    static final String CAMPAIGN_OPTION_TIMEWARP_SCHEDULE   = "timewarp_schedule";
    static final String CAMPAIGN_OPTION_ANALYTICS_TAG       = "analytics_tag";

    static final String CAMPAIGN_CONTENT_HTML               = "html";
    static final String CAMPAIGN_CONTENT_TEXT               = "text";
    static final String CAMPAIGN_CONTENT_URL                = "url";
    static final String CAMPAIGN_CONTENT_HTML_HEADER        = "html_HEADER";
    static final String CAMPAIGN_CONTENT_HTML_MAIN          = "html_MAIN";
    static final String CAMPAIGN_CONTENT_HTML_SIDECOLUMN    = "html_SIDECOLUMN";
    static final String CAMPAIGN_CONTENT_HTML_FOOTER        = "html_FOOTER";

    static final String AFIRMATIVO                          = "Si";
    static final String NEGATIVO                            = "No";

    def mailchimpService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [campaniaInstanceList: Campania.list(params), campaniaInstanceTotal: Campania.count()]
    }

    def create() {
        [campaniaInstance: new Campania(params)]
    }

    def save() {
        def campaniaInstance = new Campania(params)
        if (!campaniaInstance.save(flush: true)) {
            render(view: "create", model: [campaniaInstance: campaniaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'campania.label', default: 'Campania'), campaniaInstance.id])
        redirect(action: "show", id: campaniaInstance.id)
    }


    def showStatByUserByUrl() {
        def response = [:]
        if (params.cid?.length() > 0 && params.id?.length() > 0){
            mailchimpService.campaignEmailStatsAIM(params.cid, params.id) { json ->
                if(json.get(CAMPAIGN_STATS_ERROR) == 0){
                    def rows = []
                    for(activityEmail in json?.get(CAMPAIGN_STATS_DATA)) {
                        for(element in activityEmail?.get(CAMPAIGN_STATS_ACTIVITY)) {
                            if (element?.get(CAMPAIGN_STATS_ACTION) == CAMPAIGN_STATS_ACTION_CLICK){
                                def row = [:]
                                row.id = element?.get(CAMPAIGN_STATS_URL)
                                row.cell = [row.id, element?.get(CAMPAIGN_STATS_TIMESTAMP)]
                                rows.add(row)
                            }
                        }
                    }
                    
                    response.total = rows.size()
                    response.rows = rows
                }
            }
        }
        response.page = "1"
        response.records = "1"
        render response as JSON
    }

    def showStatByUser() {
        def response = [:]
        if (params.cid?.length() > 0){
            
            def usuarios = Campania.findByCid(params.cid).usuarios
            println usuarios
            response.total = usuarios.size()
            def usuariosEnviados
            def usuariosAbrirClick
            mailchimpService.campaignMembers(params.cid) { json ->
                usuariosEnviados = json 
            }
            mailchimpService.campaignEmailStatsAIMAll(params.cid) { json ->
                usuariosAbrirClick = json 
            }
            def rows = []
            for(usuario in usuarios) {
                def esEnviado = NEGATIVO
                def row = [:]
                row.id = usuario?.usuario?.email
                for(element in usuariosEnviados?.get(CAMPAIGN_STATS_DATA)) {
                    if (element.get(CAMPAIGN_STATS_EMAIL) == usuario?.usuario?.email){
                        esEnviado = element.get(CAMPAIGN_STATS_STATUS) == CAMPAIGN_STATS_STATUS_SENT ? AFIRMATIVO : NEGATIVO
                        usuariosEnviados.remove(element)
                        break
                    }
                }
                def data = usuariosAbrirClick?.get(CAMPAIGN_STATS_DATA)
                def abrir = NEGATIVO
                def click = NEGATIVO
                def totalAbrir = 0
                def totalClick = 0
                if (data?.containsKey(usuario?.usuario?.email)){
                    for(element in data?.get(usuario?.usuario?.email)) {  
                        switch(element?.get(CAMPAIGN_STATS_ACTION)) {
                            case CAMPAIGN_STATS_ACTION_OPEN:
                                totalAbrir++
                            break
                            case CAMPAIGN_STATS_ACTION_CLICK:
                                totalClick++
                            break
                        }
                    }
                abrir = totalAbrir > 0 ? "$AFIRMATIVO($totalAbrir)" : NEGATIVO
                click = totalClick > 0 ? "$AFIRMATIVO($totalClick)" : NEGATIVO
                }

                row.cell = [usuario?.usuario?.email, usuario?.usuario?.nombreCompleto,usuario?.nivelUsuario,esEnviado,abrir,click]
                rows.add(row)
            }
            response.rows = rows
        }
        response.page = "1"
        response.records = "1"

        render response as JSON
    }

    def showStatistics(){
        def response = [:]
         def rows = []
         def HashMap<String, Object> campaniaEstadisticas
         
         if (params.cid?.length() > 0){
            mailchimpService.campaignStats(params.cid) { json ->
                campaniaEstadisticas= json    
            }            
            campaniaEstadisticas.each{

                key, value ->
                def row = [:]
                row.id = key
                row.cell = [key, value]
                rows.add(row)
            }
            response.rows = rows
            response.page = "1"
            response.records = "1"
            render response as JSON
        }
    }

    def getFullCampania( String id, Closure callback ){
        def campaniaInstance = Campania.get(id )
        if (campaniaInstance.cid?.length() > 0){
            def filtersCampaigns = [CAMPAIGNS_FILTERS_CAMPAIGN_ID : campaniaInstance.cid]

            mailchimpService.campaigns(filtersCampaigns){ json ->
                def data = json?.get(CAMPAIGN_STATS_DATA)
                campaniaInstance.estadisticas = [ : ]

                data.each{ it ->
                    it.each{ key, value ->
                        switch(key) {
                            case CAMPAIGN_OPTION_LIST_ID:
                            case CAMPAIGN_OPTION_SUBJECT:
                            case CAMPAIGN_OPTION_TYPE:
                            case CAMPAIGN_OPTION_SEND_TIME:
                            case CAMPAIGN_OPTION_TITLE:
                            case CAMPAIGN_OPTION_FROM_NAME:
                            case CAMPAIGN_OPTION_FROM_EMAIL:
                            case CAMPAIGN_OPTION_ARCHIVE_URL:
                            case CAMPAIGN_OPTION_STATUS:
                            case CAMPAIGN_OPTION_EMAILS_SENT:
                                campaniaInstance.estadisticas."$key" = value        
                            break
                        }
                    }
                }
            }

            def filtersList = [CAMPAIGN_OPTION_LIST_ID : campaniaInstance.estadisticas."$CAMPAIGN_OPTION_LIST_ID"]
            
            mailchimpService.lists(filtersList){ json ->
                def data = json?.get(CAMPAIGN_STATS_DATA)
                data.each{ it ->
                    campaniaInstance?.estadisticas."$CAMPAIGN_OPTION_LIST_ID" = it?.get(CAMPAIGN_OPTION_LIST_NAME)
                }
            }
        }
        callback(campaniaInstance)
    }

    def show() {
        def campaniaInstance
        getFullCampania(params.id){ campania ->
            campaniaInstance = campania
        }
        if (!campaniaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'campania.label', default: 'Campania'), params.id])
            redirect(action: "list")
            return
        }
        [campaniaInstance: campaniaInstance]
    }

    def nextStep() {
        def campaniaInstance = Campania.get(params.id)
        def fase = ""
        def msg = ""
        def error = ""
        def html = ""
        if (campaniaInstance != null) {
            switch(params.fase) {
                case CAMPAIGN_PHASE_CONTACT:
                    campaniaInstance.fase = CAMPAIGN_PHASE_DESIGN;
                break
                case CAMPAIGN_PHASE_DESIGN:
                    campaniaInstance.fase = CAMPAIGN_PHASE_EMAILING;
                break
                case CAMPAIGN_PHASE_EMAILING:
                    campaniaInstance.fase = CAMPAIGN_PHASE_PREPARING;
                break
                case CAMPAIGN_PHASE_PREPARING:
                    campaniaInstance.fase = CAMPAIGN_PHASE_COMPLETE;
                break
                default:
                    fase = params.fase
                    msg = 'Error al pasar al siguiente estado'
                    error = '1'
                break
            }

            if (!campaniaInstance.save(flush: true)) {
                fase = params.fase
                msg = 'Error al pasar al siguiente estado'
                error = '1'
            }else{
                fase = campaniaInstance.fase     
                msg = 'Actualizado correctamente'
                error = '0'
                if (campaniaInstance.fase == CAMPAIGN_PHASE_EMAILING){
                    mailchimpService.campaignSendNow(campaniaInstance.cid) { json ->
                        if (json.code != 0)
                            msg = json.error
                    }
                }
            }
        }else{
            fase = params.fase
            msg = 'No existe la campaña'
            error = '1'
        }
        def htmlRender = '<span id="faseVal" class="property-value" aria-labelledby="fase-label">' + fase + '</span>'
        render([error: error, msg: msg, fase: fase, html: htmlRender] as JSON)
        return
    }

    def edit() {
        def campaniaInstance
        getFullCampania(params.id){ campania ->
            campaniaInstance = campania
        }
        if (!campaniaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'campania.label', default: 'Campania'), params.id])
            redirect(action: "list")
            return
        }
        [campaniaInstance: campaniaInstance]
    }

    def update() {
        def campaniaInstance = Campania.get(params.id)
        if (!campaniaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'campania.label', default: 'Campania'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (campaniaInstance.version > version) {
                campaniaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'campania.label', default: 'Campania')] as Object[],
                          "Another user has updated this Campania while you were editing")
                render(view: "edit", model: [campaniaInstance: campaniaInstance])
                return
            }
        }

        campaniaInstance.properties = params

        if (!campaniaInstance.save(flush: true)) {
            render(view: "edit", model: [campaniaInstance: campaniaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'campania.label', default: 'Campania'), campaniaInstance.id])
        redirect(action: "show", id: campaniaInstance.id)
    }

    def delete() {
        def campaniaInstance = Campania.get(params.id)
        if (!campaniaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'campania.label', default: 'Campania'), params.id])
            redirect(action: "list")
            return
        }

        try {
            campaniaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'campania.label', default: 'Campania'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'campania.label', default: 'Campania'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def companiaSelectedProducto = {
        def compania = Compania.get(params.id)
        render g.select(optionKey: 'id', 
                        from: compania.productos, 
                        id: 'producto', 
                        name: 'producto.id', 
                        class: 'many-to-one', 
                        required: '', 
                        value: params.idProducto)
    }

    def companiaSelectedContacto = {
        def compania = Compania.get(params.id)
        render g.select(optionKey: 'id', 
                        from: compania.contactos, 
                        id: 'contacto', 
                        name: 'contacto.id', 
                        class: 'many-to-one', 
                        required: '', 
                        value: params.idContacto)
    }
}
