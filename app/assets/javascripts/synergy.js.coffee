#= require_directory .
#= stub ./active_admin
#
#= require_self

@controller = (name) -> $("body").hasClass(name)
@action     = (name) -> $("body").hasClass(name)
