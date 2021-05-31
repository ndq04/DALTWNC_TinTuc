$(document).ready(function () {
    $("#selectimg").click(function () {
        var f = new CKFinder();
        f.selectActionFunction = function (u) {
            $("#txt").val(u);
        };
        f.popup();

    })
});