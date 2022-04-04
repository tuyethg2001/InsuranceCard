/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* global fetch */


function doImgUpload(fileInputId, urlout, imgout) {
    var form = new FormData();
    const outputURL = document.getElementById(urlout);
    const outputImg = document.getElementById(imgout);
    
    form.append("image", fileInputId.files[0]);
    fetch("https://api.imgbb.com/1/upload?key=1af8cbe03c0cb11d90d17917021deeeb", {
        method: "post",
        body: form
    }).then(data => data.json()).then(data => {
        outputURL.value = data.data.url;
        outputImg.src = data.data.url;
    });
}
