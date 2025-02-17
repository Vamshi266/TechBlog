

function doLike(pid,uid) {
    
    const data = {
        uid:uid,
        pid:pid,
        operation:'like'
    };
    
    $.ajax({
        url : "LikeServlet",
        data : data,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(error);
        }
    })
    
}