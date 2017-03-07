function rememberMe() 
{
    $.cookie('id', $('#usr').val());
    $.cookie('pass', $('#pwd').val());
}

function fillByMemory() 
{
    if (!!$.cookie('id'))
        $('#usr').val($.cookie('id'));

    if (!!$.cookie('pass'))
        $('#pwd').val($.cookie('pass'));
}
