function onSkinChange(skin) {
    mini.Cookie.set('miniuiSkin', skin);
    window.location.reload()
}
var CanSet = false;
window.onload = function () {
    var skin = mini.Cookie.get("miniuiSkin");
    if (skin) {
        var selectSkin = document.getElementById("selectSkin");
        selectSkin.value = skin;
    }
    CanSet = true;
}