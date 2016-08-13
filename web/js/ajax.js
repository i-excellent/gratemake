 var ajaxurl = '/ajax/';
    var  csrfToken = $('meta[name=csrf-token]').prop('content');
                function getSubject(){
                    $.post(ajaxurl + "menu", {
                        menu: $("select[name='Work[id_menu]']").val(),
                        _csrf: csrfToken
                    }, function (data) {
                        data = JSON.parse(data);
                        $("select[name='Work[id_subject]']").empty();
                        for (var id in data) {
                            $("select[name='Work[id_subject]']").append($("<option value='" + data[id].id + "'>" + data[id].name + "</option>"));
                        }
                })
        }

