ad_library {
    Procedures for registering implementations for the
    dotlrn lamsint package. 
    
    @creation-date 2005-09-25
    @author Ernie Ghiglione (ErnieG@melcoe.mq.edu.au)
    @cvs-id $Id$
}

namespace eval dotlrn_lamsint {}

ad_proc -public dotlrn_lamsint::install {} {
    dotLRN LAMSINT package install proc
} {
    register_portal_datasource_impl
}

ad_proc -public dotlrn_lamsint::uninstall {} {
    dotLRN LAMSINT package uninstall proc
} {
    unregister_portal_datasource_impl
}

ad_proc -public dotlrn_lamsint::register_portal_datasource_impl {} {
    Register the service contract implementation for the dotlrn_applet service contract
} {
    set spec {
        name "dotlrn_lamsint"
	contract_name "dotlrn_applet"
	owner "dotlrn_lamsint"
        aliases {
	    GetPrettyName dotlrn_lamsint::get_pretty_name
	    AddApplet dotlrn_lamsint::add_applet
	    RemoveApplet dotlrn_lamsint::remove_applet
	    AddAppletToCommunity dotlrn_lamsint::add_applet_to_community
	    RemoveAppletFromCommunity dotlrn_lamsint::remove_applet_from_community
	    AddUser dotlrn_lamsint::add_user
	    RemoveUser dotlrn_lamsint::remove_user
	    AddUserToCommunity dotlrn_lamsint::add_user_to_community
	    RemoveUserFromCommunity dotlrn_lamsint::remove_user_from_community
	    AddPortlet dotlrn_lamsint::add_portlet
	    RemovePortlet dotlrn_lamsint::remove_portlet
	    Clone dotlrn_lamsint::clone
	    ChangeEventHandler dotlrn_lamsint::change_event_handler
        }
    }
    
    acs_sc::impl::new_from_spec -spec $spec
}

ad_proc -public dotlrn_lamsint::unregister_portal_datasource_impl {} {
    Unregister service contract implementations
} {
    acs_sc::impl::delete \
        -contract_name "dotlrn_applet" \
        -impl_name "dotlrn_lamsint"
}

